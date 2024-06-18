import 'package:education_system/account/domain/account.dart';
import 'package:education_system/appbar/customAppBar.dart';
import 'package:education_system/customWidget/customWidget.dart';
import 'package:education_system/lesson/controller/lessonController.dart';
import 'package:education_system/lesson/data/studentLessonRepository.dart';
import 'package:education_system/lesson/domain/lesson.dart';
import 'package:education_system/lesson/domain/studentLesson.dart';
import 'package:education_system/lesson/presentation/Info.dart';
import 'package:education_system/utils/pub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class studentAddPage extends StatefulHookConsumerWidget {
  final accountData data;
  const studentAddPage({required this.data, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _studentAddPageState();
}

class _studentAddPageState extends ConsumerState<studentAddPage> {
  bool isInitializing = true;
  List<lessonData> items = [];
  _getData() async {
    final lsCtrPro = ref.read(lessonCtrProvider);
    items = await lsCtrPro.fectchStudentCanAdd(widget.data.fid!);
    isInitializing = false;
    setState(() {});
  }

  _addLesson(lessonData lesson) async {
    final slProvider = ref.read(studentLessonRepoProvider);
    final sl = studentLesson(studentId: widget.data.fid!, lessonId: lesson.fid!);
    final res = await slProvider.insert(sl);
    if (res) {
      Pub_Function.msgShow('加選成功');
      _getData();
    } else
      Pub_Function.msgShow('加選失敗');
  }

  _getInfo(lessonData item) async => await Navigator.of(context)
      .push(
        MaterialPageRoute(
          builder: (_) => lessonInfoPage(data: item, canEdit: false),
        ),
      )
      .then((value) async => await _getData());

  @override
  void initState() {
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: '可加選課程'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: isInitializing
            ? Center(child: CircularProgressIndicator())
            : items.isEmpty
                ? noDataWidget(text: '無課程可加選')
                : SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                          items.length,
                          (index) => lessonCard(
                                lesson: items[index],
                                onTap: () => _getInfo(items[index]),
                                btnTxt: '加選',
                                onBtnTap: () => _addLesson(items[index]),
                              )),
                    ),
                  ),
      ),
    );
  }
}
