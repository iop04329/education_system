import 'package:education_system/account/domain/account.dart';
import 'package:education_system/appbar/customAppBar.dart';
import 'package:education_system/customWidget/customWidget.dart';
import 'package:education_system/lesson/domain/lesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class lessonAddPage extends StatefulHookConsumerWidget {
  final accountData account;
  const lessonAddPage({required this.account, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _lessonAddPageState();
}

class _lessonAddPageState extends ConsumerState<lessonAddPage> {
  final List<String> weekList = weekNumEnum.values.map((e) => e.name).toList();
  TextEditingController lessonNameCtr = TextEditingController();
  TextEditingController lessonContent = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final weekindex = useState<int?>(null);
    final startTime = useState(TimeOfDay.now());
    final endTime = useState(TimeOfDay.now());
    return Scaffold(
      appBar: customAppBar(title: '新增課程'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 0.03.sh),
              titleTxt('課程名稱'),
              SizedBox(height: 10),
              customEditField(ctr: lessonNameCtr, width: 0.5.sw, onTap: lessonNameCtr.clear),
              SizedBox(height: 20),
              titleTxt('課程內容'),
              SizedBox(height: 10),
              customEditField(ctr: lessonContent, width: 0.5.sw, onTap: lessonContent.clear),
              SizedBox(height: 20),
              titleTxt('星期'),
              SizedBox(height: 10),
              customDropBtn(
                '星期',
                weekindex.value,
                weekList,
                btnWidth: 0.5.sw,
                onChanged: (p0) => weekindex.value = p0 == null ? weekindex.value = null : weekList.indexWhere((element) => element == p0),
              ),
              SizedBox(height: 20),
              titleTxt('課程開始時間'),
              SizedBox(height: 10),
              // customEditField(ctr: mailCtr, width: 0.5.sw, onTap: mailCtr.clear),
              // SizedBox(height: 20),
              // customBtn(text: '註冊', onPressed: _checkVal),
              // customBtn(text: '資訊', onPressed: _getDatas),
            ],
          ),
        ),
      ),
    );
  }
}
