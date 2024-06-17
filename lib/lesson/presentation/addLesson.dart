import 'package:education_system/account/domain/account.dart';
import 'package:education_system/appbar/customAppBar.dart';
import 'package:education_system/customWidget/customWidget.dart';
import 'package:education_system/customWidget/dialogWidget.dart';
import 'package:education_system/lesson/controller/lessonController.dart';
import 'package:education_system/lesson/domain/lesson.dart';
import 'package:education_system/utils/pub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class addLessonPage extends StatefulHookConsumerWidget {
  final accountData account;
  const addLessonPage({required this.account, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _lessonAddPageState();
}

class _lessonAddPageState extends ConsumerState<addLessonPage> {
  final List<String> weekList = weekNumEnum.values.map((e) => e.name).toList();
  TextEditingController lessonNameCtr = TextEditingController();
  TextEditingController lessonContent = TextEditingController();
  TextEditingController startCtr = TextEditingController();
  TextEditingController endCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final weekindex = useState<int?>(null);
    final startTime = useState(TimeOfDay.now());
    final endTime = useState(TimeOfDay.now());
    _timeSelect({required BuildContext ct, bool isStart = true, required TextEditingController ctr}) async {
      isStart
          ? startTime.value = await customDialog.showTimeDialog(ct, startTime.value) ?? startTime.value
          : endTime.value = await customDialog.showTimeDialog(ct, endTime.value) ?? endTime.value;
      final dt = Pub_Function.timeOfDayToDateTime(startTime.value);
      ctr.text = Pub_Function.dateTimeToHHmm(dt);
    }

    _add() async {
      if (lessonNameCtr.text == '' || lessonContent.text == '' || weekindex.value == null) {
        Pub_Function.msgShow('請檢查欄位是否都填寫完畢');
        return;
      }
      final addLs = lessonData(
        teacherId: widget.account.fid!,
        lessonName: lessonNameCtr.text,
        lessonContent: lessonContent.text,
        weekNumber: lessonFn.getWeekEnum(weekindex.value!),
        startTime: Pub_Function.timeOfDayToDateTime(startTime.value),
        endTime: Pub_Function.timeOfDayToDateTime(endTime.value),
      );
      final lsCtrPro = ref.read(lessonCtrProvider);
      await lsCtrPro.insert(addLs);
      Navigator.of(context).pop();
    }

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
              customEditField(ctr: lessonNameCtr, width: 0.5.sw, trailingIconOnTap: lessonNameCtr.clear),
              SizedBox(height: 20),
              titleTxt('課程內容'),
              SizedBox(height: 10),
              customEditField(ctr: lessonContent, width: 0.5.sw, height: 0.1.sh, trailingIconOnTap: lessonContent.clear),
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
              customEditField(
                  ctr: startCtr,
                  width: 0.5.sw,
                  enable: false,
                  trailingIconOnTap: () => _timeSelect(ct: context, isStart: true, ctr: startCtr),
                  trailingIcon: Icons.schedule),
              SizedBox(height: 20),
              titleTxt('課程結束時間'),
              SizedBox(height: 10),
              customEditField(
                  ctr: endCtr,
                  width: 0.5.sw,
                  enable: false,
                  trailingIconOnTap: () => _timeSelect(ct: context, isStart: false, ctr: endCtr),
                  trailingIcon: Icons.schedule),
              SizedBox(height: 20),
              customBtn(text: '新增', onPressed: _add),
              // customBtn(text: '資訊', onPressed: _getDatas),
            ],
          ),
        ),
      ),
    );
  }
}
