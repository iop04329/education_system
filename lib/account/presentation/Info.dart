import 'package:education_system/account/controller/accountController.dart';
import 'package:education_system/account/domain/account.dart';
import 'package:education_system/appbar/customAppBar.dart';
import 'package:education_system/customWidget/customWidget.dart';
import 'package:education_system/utils/pub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class accountInfoPage extends StatefulHookConsumerWidget {
  final accountData data;
  const accountInfoPage({required this.data, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _accountInfoPage2State();
}

class _accountInfoPage2State extends ConsumerState<accountInfoPage> {
  final List<String> identityList = identityEnum.values.map((e) => e.name).toList();
  final List<String> genderList = genderEnum.values.map((e) => e.name).toList();
  TextEditingController photoCtr = TextEditingController();
  TextEditingController nameCtr = TextEditingController();
  TextEditingController accountCtr = TextEditingController();
  TextEditingController passwordCtr = TextEditingController();
  TextEditingController mailCtr = TextEditingController();

  _goBack() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    final isEdit = useState(false);
    final identityInd = useState<int?>(null);
    final genderInd = useState<int?>(null);
    final accountProvider = ref.read(accountCtrProvider);
    _goEdit() {
      photoCtr.text = widget.data.InternetPhoto ?? '';
      nameCtr.text = widget.data.name;
      accountCtr.text = widget.data.account;
      passwordCtr.text = widget.data.password;
      mailCtr.text = widget.data.mail ?? '';
      identityInd.value = widget.data.identity.index;
      genderInd.value = widget.data.gender.index;
      isEdit.value = !isEdit.value;
    }

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
        fid: widget.data.fid,
        InternetPhoto: photoCtr.text,
        name: nameCtr.text,
        account: accountCtr.text,
        password: passwordCtr.text,
        identity: accountFn.getIdentityEnum(identityInd.value!),
        gender: accountFn.getGenderEnum(genderInd.value!),
        mail: mailCtr.text,
      );
      final res = await accountProvider.edit(data);
      if (res)
        Navigator.of(context).pop();
      else
        Pub_Function.msgShow('修改失敗');
    }

    return Scaffold(
      appBar: customAppBar(title: '帳號資訊'),
      body: Container(
        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: isEdit.value
                ? [
                    SizedBox(height: 0.03.sh),
                    titleTxt('照片(用網路網址當範例)'),
                    SizedBox(height: 10),
                    customEditField(ctr: photoCtr, width: 0.5.sw, onTap: photoCtr.clear),
                    SizedBox(height: 20),
                    titleTxt('名稱'),
                    SizedBox(height: 10),
                    customEditField(ctr: nameCtr, width: 0.5.sw, onTap: nameCtr.clear),
                    SizedBox(height: 20),
                    titleTxt('帳號'),
                    SizedBox(height: 10),
                    customEditField(ctr: accountCtr, width: 0.5.sw, onTap: accountCtr.clear),
                    SizedBox(height: 20),
                    titleTxt('密碼'),
                    SizedBox(height: 10),
                    customEditField(ctr: passwordCtr, width: 0.5.sw, onTap: passwordCtr.clear),
                    SizedBox(height: 20),
                    titleTxt('身份'),
                    SizedBox(height: 10),
                    customDropBtn(
                      '身份',
                      identityInd.value,
                      identityList,
                      btnWidth: 0.5.sw,
                      onChanged: (p0) =>
                          identityInd.value = p0 == null ? identityInd.value = null : identityList.indexWhere((element) => element == p0),
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
                    customEditField(ctr: mailCtr, width: 0.5.sw, onTap: mailCtr.clear),
                    SizedBox(height: 20),
                    customBtn(text: '修改', onPressed: _checkVal),
                  ]
                : [
                    SizedBox(height: 0.03.sh),
                    accountPhotoView(networkPhoto: widget.data.InternetPhoto),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        titleTxt('名稱:'),
                        SizedBox(width: 5),
                        contentTxt(widget.data.name),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        titleTxt('帳號:'),
                        SizedBox(width: 5),
                        contentTxt(widget.data.account),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        titleTxt('身份:'),
                        SizedBox(width: 5),
                        contentTxt(widget.data.identity.name),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        titleTxt('性別:'),
                        SizedBox(width: 5),
                        contentTxt(widget.data.gender.name),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        titleTxt('信箱:'),
                        SizedBox(width: 5),
                        contentTxt(widget.data.mail ?? ''),
                      ],
                    ),
                    SizedBox(height: 20),
                    customBtn(text: '返回', onPressed: _goBack),
                    customBtn(text: '編輯', onPressed: _goEdit),
                  ],
          ),
        ),
      ),
    );
  }
}
