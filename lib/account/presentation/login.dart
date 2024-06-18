import 'package:education_system/account/controller/accountController.dart';
import 'package:education_system/account/domain/account.dart';
import 'package:education_system/account/presentation/list.dart';
import 'package:education_system/account/presentation/register.dart';
import 'package:education_system/appbar/customAppBar.dart';
import 'package:education_system/customWidget/customWidget.dart';
import 'package:education_system/lesson/domain/studentLesson.dart';
import 'package:education_system/lesson/presentation/allLessons.dart';
import 'package:education_system/lesson/presentation/Info.dart';
import 'package:education_system/lesson/presentation/studentLessons.dart';
import 'package:education_system/lesson/presentation/teacherLessons.dart';
import 'package:education_system/utils/pub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class loginPage extends StatefulHookConsumerWidget {
  final String title;
  const loginPage({required this.title, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _loginPageState();
}

class _loginPageState extends ConsumerState<loginPage> {
  TextEditingController accountCtr = TextEditingController();
  TextEditingController pswdCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _login() async {
      final accountCtrPro = ref.read(accountCtrProvider);
      final account = await accountCtrPro.login(accountCtr.text, pswdCtr.text);
      if (account == null) {
        Pub_Function.msgShow('登入失敗');
        return;
      }
      if (account.identity == identityEnum.teacher)
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => teacherLessonsPage(data: account)));
      else
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => studentLessonsPage(data: account)));
    }

    return Scaffold(
      appBar: customAppBar(title: '教育課程系統', back: false),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 0.03.sh),
            titleTxt('帳號'),
            SizedBox(height: 10),
            customEditField(ctr: accountCtr, width: 0.5.sw, trailingIconOnTap: accountCtr.clear),
            SizedBox(height: 20),
            titleTxt('密碼'),
            SizedBox(height: 10),
            customEditField(ctr: pswdCtr, width: 0.5.sw, trailingIconOnTap: pswdCtr.clear),
            SizedBox(height: 10),
            customBtn(
              text: '登入',
              onPressed: () => _login(),
            ),
            SizedBox(height: 10),
            customBtn(
              text: '註冊',
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => registerPage())),
            ),
            SizedBox(height: 10),
            customBtn(
              text: '帳號管理',
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => accountListPage())),
            ),
            SizedBox(height: 10),
            customBtn(
              text: '課程總覽',
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => AllLessonsPage())),
            ),
          ],
        ),
      ),
    );
  }
}
