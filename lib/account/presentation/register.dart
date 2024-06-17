import 'package:education_system/account/controller/accountController.dart';
import 'package:education_system/account/domain/account.dart';
import 'package:education_system/account/presentation/Info.dart';
import 'package:education_system/appbar/customAppBar.dart';
import 'package:education_system/customWidget/customWidget.dart';
import 'package:education_system/utils/pub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class registerPage extends StatefulHookConsumerWidget {
  const registerPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _registerPageState();
}

class _registerPageState extends ConsumerState<registerPage> {
  final List<String> identityList = identityEnum.values.map((e) => e.name).toList();
  final List<String> genderList = genderEnum.values.map((e) => e.name).toList();
  TextEditingController photoCtr = TextEditingController();
  TextEditingController nameCtr = TextEditingController();
  TextEditingController accountCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController mailCtr = TextEditingController();
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    final identityInd = useState<int?>(null);
    final genderInd = useState<int?>(null);
    final accountProvider = ref.read(accountCtrProvider);
    _checkVal() async {
      if (photoCtr.text == '' ||
          nameCtr.text == '' ||
          accountCtr.text == '' ||
          passwordCtr.text == '' ||
          mailCtr.text == '' ||
          identityInd.value == null ||
          genderInd.value == null) {
        Pub_Function.msgShow('請檢查欄位是否填寫完畢');
        return;
      }
      accountData data = accountData(
        InternetPhoto: photoCtr.text,
        name: nameCtr.text,
        account: accountCtr.text,
        password: passwordCtr.text,
        identity: accountFn.getIdentityEnum(identityInd.value!),
        gender: accountFn.getGenderEnum(genderInd.value!),
        mail: mailCtr.text,
      );
      final res = await accountProvider.register(data);
      if (res)
        Navigator.of(context).pop();
      else
        Pub_Function.msgShow('註冊失敗');
    }

    _getDatas() async {
      final accounts = await accountProvider.getDatas();
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => accountInfoPage(data: accounts[2])));
    }

    return Scaffold(
      appBar: customAppBar(title: '註冊'),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 0.03.sh),
              titleTxt('照片(用網路網址當範例)'),
              SizedBox(height: 10),
              customEditField(ctr: photoCtr, width: 0.5.sw, trailingIconOnTap: photoCtr.clear),
              SizedBox(height: 20),
              titleTxt('名稱'),
              SizedBox(height: 10),
              customEditField(ctr: nameCtr, width: 0.5.sw, trailingIconOnTap: nameCtr.clear),
              SizedBox(height: 20),
              titleTxt('帳號'),
              SizedBox(height: 10),
              customEditField(ctr: accountCtr, width: 0.5.sw, trailingIconOnTap: accountCtr.clear),
              SizedBox(height: 20),
              titleTxt('密碼'),
              SizedBox(height: 10),
              customEditField(ctr: passwordCtr, width: 0.5.sw, trailingIconOnTap: passwordCtr.clear),
              SizedBox(height: 20),
              titleTxt('身份'),
              SizedBox(height: 10),
              customDropBtn(
                '身份',
                identityInd.value,
                identityList,
                btnWidth: 0.5.sw,
                onChanged: (p0) => identityInd.value = p0 == null ? identityInd.value = null : identityList.indexWhere((element) => element == p0),
              ),
              SizedBox(height: 20),
              titleTxt('性別'),
              SizedBox(height: 10),
              customDropBtn(
                '性別',
                genderInd.value,
                genderList,
                btnWidth: 0.5.sw,
                onChanged: (p0) => genderInd.value = p0 == null ? genderInd.value = null : genderList.indexWhere((element) => element == p0),
              ),
              SizedBox(height: 20),
              titleTxt('email'),
              SizedBox(height: 10),
              customEditField(ctr: mailCtr, width: 0.5.sw, trailingIconOnTap: mailCtr.clear),
              SizedBox(height: 20),
              customBtn(text: '註冊', onPressed: _checkVal),
              customBtn(text: '資訊', onPressed: _getDatas),
            ],
          ),
        ),
      ),
    );
  }
}
