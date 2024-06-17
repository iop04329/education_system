import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:education_system/account/controller/accountController.dart';
import 'package:education_system/account/domain/account.dart';
import 'package:education_system/account/presentation/Info.dart';
import 'package:education_system/appbar/customAppBar.dart';
import 'package:education_system/customWidget/customWidget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class accountListPage extends ConsumerStatefulWidget {
  const accountListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _accountListPageState();
}

class _accountListPageState extends ConsumerState<accountListPage> with AfterLayoutMixin<accountListPage> {
  bool isInitializing = true;
  List<accountData> accounts = [];
  late accountController accountProvider;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {}

  @override
  void initState() {
    accountProvider = ref.read(accountCtrProvider);
    _getData();
  }

  _getData() async {
    accounts = await accountProvider.getDatas();
    isInitializing = false;
    setState(() {});
  }

  _getInfo(accountData item) async => await Navigator.of(context)
      .push(
        MaterialPageRoute(
          builder: (_) => accountInfoPage(
            data: item,
          ),
        ),
      )
      .then((value) async => await _getData());

  _onDelete(int fid) async {
    await accountProvider.delete(fid);
    await _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: '帳號列表'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: isInitializing
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: List.generate(
                    accounts.length,
                    (index) => accountCard(
                      account: accounts[index],
                      onTap: () => _getInfo(accounts[index]),
                      onDelete: () => _onDelete(accounts[index].fid!),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
