import 'package:education_system/account/domain/account.dart';
import 'package:education_system/appbar/customAppBar.dart';
import 'package:education_system/customWidget/customWidget.dart';
import 'package:education_system/lesson/controller/lessonController.dart';
import 'package:education_system/lesson/data/studentLessonRepository.dart';
import 'package:education_system/lesson/domain/lesson.dart';
import 'package:education_system/lesson/presentation/Info.dart';
import 'package:education_system/lesson/presentation/allLessons.dart';
import 'package:education_system/lesson/presentation/studentAdd.dart';
import 'package:education_system/lesson/presentation/teacherLessons.dart';
import 'package:education_system/utils/pub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class studentLessonsPage extends StatefulHookConsumerWidget {
  final accountData data;
  const studentLessonsPage({required this.data, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _teacherLessonsPageState();
}

class _teacherLessonsPageState extends ConsumerState<studentLessonsPage> {
  bool isInitializing = true;
  List<lessonData> items = [];
  _getData() async {
    final lsCtrPro = ref.read(lessonCtrProvider);
    items = await lsCtrPro.fectchStudentLessons(widget.data.fid!);
    isInitializing = false;
    setState(() {});
  }

  _getInfo(lessonData item) async => await Navigator.of(context)
      .push(
        MaterialPageRoute(
          builder: (_) => lessonInfoPage(data: item, canEdit: false),
        ),
      )
      .then((value) async => await _getData());

  _deleteLesson(lessonData lesson) async {
    final slProvider = ref.read(studentLessonRepoProvider);
    final res = await slProvider.deleteByLessonId(lesson.fid!);
    if (res) {
      _getData();
      Pub_Function.msgShow('退選成功');
    } else
      Pub_Function.msgShow('退選失敗');
  }

  @override
  void initState() {
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: '${widget.data.name}你的課表'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: isInitializing
            ? Center(child: CircularProgressIndicator())
            : items.isEmpty
                ? noDataWidget(text: '你尚未加選課程，請點選右下角加選課程')
                : SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                          items.length,
                          (index) => lessonCard(
                                lesson: items[index],
                                onTap: () => _getInfo(items[index]),
                                btnTxt: '退選',
                                onBtnTap: () => _deleteLesson(items[index]),
                              )),
                    ),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => studentAddPage(data: widget.data))).then((value) => _getData()),
          child: Icon(Icons.add)),
    );
  }
}
