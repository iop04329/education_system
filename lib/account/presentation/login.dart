import 'package:education_system/account/presentation/list.dart';
import 'package:education_system/account/presentation/register.dart';
import 'package:education_system/appbar/customAppBar.dart';
import 'package:education_system/customWidget/customWidget.dart';
import 'package:education_system/lesson/presentation/lesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key, required this.title});

  final String title;

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController accountCtr = TextEditingController();
  TextEditingController pswdCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            customEditField(ctr: accountCtr, width: 0.5.sw, onTap: accountCtr.clear),
            SizedBox(height: 20),
            titleTxt('密碼'),
            SizedBox(height: 10),
            customEditField(ctr: pswdCtr, width: 0.5.sw, onTap: pswdCtr.clear),
            SizedBox(height: 10),
            customBtn(
              text: '登入',
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => lessonPage())),
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
          ],
        ),
      ),
    );
  }
}
