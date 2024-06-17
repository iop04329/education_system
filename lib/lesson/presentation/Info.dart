import 'package:education_system/appbar/customAppBar.dart';
import 'package:education_system/customWidget/customWidget.dart';
import 'package:education_system/customWidget/dialogWidget.dart';
import 'package:education_system/lesson/controller/lessonController.dart';
import 'package:education_system/lesson/domain/lesson.dart';
import 'package:education_system/utils/pub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class lessonInfoPage extends StatefulHookConsumerWidget {
  final lessonData data;
  const lessonInfoPage({required this.data, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _lessonInfoPageState();
}

class _lessonInfoPageState extends ConsumerState<lessonInfoPage> {
  final List<String> weekList = weekNumEnum.values.map((e) => e.name).toList();
  TextEditingController lessonNameCtr = TextEditingController();
  TextEditingController lessonContent = TextEditingController();
  TextEditingController startCtr = TextEditingController();
  TextEditingController endCtr = TextEditingController();

  _goBack() => Navigator.of(context).pop();
  @override
  Widget build(BuildContext context) {
    final isEdit = useState(false);
    final weekindex = useState<int?>(null);
    final startTime = useState(TimeOfDay.now());
    final endTime = useState(TimeOfDay.now());
    final lessonProvider = ref.read(lessonCtrProvider);
    _timeSelect({required BuildContext ct, bool isStart = true, required TextEditingController ctr}) async {
      isStart
          ? startTime.value = await customDialog.showTimeDialog(ct, startTime.value) ?? startTime.value
          : endTime.value = await customDialog.showTimeDialog(ct, endTime.value) ?? endTime.value;
      final dt = Pub_Function.timeOfDayToDateTime(startTime.value);
      ctr.text = Pub_Function.dateTimeToHHmm(dt);
    }

    _goEdit() {
      lessonNameCtr.text = widget.data.lessonName;
      lessonContent.text = widget.data.lessonContent;
      weekindex.value = widget.data.weekNumber.index;
      startTime.value = Pub_Function.DTToTimeOfDay(widget.data.startTime);
      startCtr.text = Pub_Function.dateTimeToHHmm(widget.data.startTime);
      endTime.value = Pub_Function.DTToTimeOfDay(widget.data.endTime);
      endCtr.text = Pub_Function.dateTimeToHHmm(widget.data.endTime);
      isEdit.value = !isEdit.value;
    }

    _complete() async {
      if (lessonNameCtr.text == '' || lessonContent.text == '' || weekindex.value == null) {
        Pub_Function.msgShow('請檢查欄位是否都填寫完畢');
        return;
      }
      lessonData data = lessonData(
        fid: widget.data.fid,
        teacherId: widget.data.teacherId,
        lessonName: lessonNameCtr.text,
        lessonContent: lessonContent.text,
        weekNumber: lessonFn.getWeekEnum(weekindex.value!),
        startTime: Pub_Function.timeOfDayToDateTime(startTime.value),
        endTime: Pub_Function.timeOfDayToDateTime(endTime.value),
      );
      final res = await lessonProvider.edit(data);
      if (res)
        Navigator.of(context).pop();
      else
        Pub_Function.msgShow('修改失敗');
    }

    return Scaffold(
      appBar: customAppBar(title: '課程資訊'),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: isEdit.value
                ? [
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
                    customBtn(text: '完成', onPressed: _complete),
                  ]
                : [
                    SizedBox(height: 0.03.sh),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        titleTxt('課程名稱:'),
                        SizedBox(width: 5),
                        contentTxt(widget.data.lessonName),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        titleTxt('課程內容:'),
                        SizedBox(width: 5),
                        contentTxt(widget.data.lessonContent),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        titleTxt('每星期:'),
                        SizedBox(width: 5),
                        contentTxt(widget.data.weekNumber.name),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        titleTxt('開始時間:'),
                        SizedBox(width: 5),
                        contentTxt(Pub_Function.dateTimeToHHmm(widget.data.startTime)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        titleTxt('結束時間:'),
                        SizedBox(width: 5),
                        contentTxt(Pub_Function.dateTimeToHHmm(widget.data.endTime)),
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
