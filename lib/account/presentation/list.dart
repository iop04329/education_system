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
    getData();
  }

  getData() async {
    accounts = await accountProvider.getDatas();
    isInitializing = false;
    setState(() {});
  }

  _onDelete(int ind) async {
    await accountProvider.delete(ind);
    await getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: '帳號列表'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: isInitializing
                ? [Center(child: CircularProgressIndicator())]
                : List.generate(
                    accounts.length,
                    (index) => accountCard(
                      account: accounts[index],
                      onTap: () async => await Navigator.of(context)
                          .push(
                            MaterialPageRoute(
                              builder: (_) => accountInfoPage(
                                data: accounts[index],
                              ),
                            ),
                          )
                          .then((value) async => await getData()),
                      onDelete: () => _onDelete(accounts[index].fid!),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
