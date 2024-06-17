import 'package:education_system/account/domain/account.dart';
import 'package:education_system/appbar/customAppBar.dart';
import 'package:education_system/customWidget/customWidget.dart';
import 'package:education_system/lesson/controller/lessonController.dart';
import 'package:education_system/lesson/domain/lesson.dart';
import 'package:education_system/lesson/presentation/Info.dart';
import 'package:education_system/lesson/presentation/addLesson.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class teacherLessonsPage extends StatefulHookConsumerWidget {
  final accountData data;
  const teacherLessonsPage({required this.data, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _lessonListPageState();
}

class _lessonListPageState extends ConsumerState<teacherLessonsPage> {
  bool isInitializing = true;
  List<lessonData> items = [];
  @override
  void initState() {
    _getData();
  }

  _getData() async {
    final lsCtrPro = ref.read(lessonCtrProvider);
    items = await lsCtrPro.fetchs();
    isInitializing = false;
    setState(() {});
  }

  _getInfo(lessonData item) async => await Navigator.of(context)
      .push(
        MaterialPageRoute(
          builder: (_) => lessonInfoPage(
            data: item,
          ),
        ),
      )
      .then((value) async => await _getData());

  _onDelete(int fid) async {
    final lsCtrPro = ref.read(lessonCtrProvider);
    await lsCtrPro.delete(fid);
    await _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: '${widget.data.name}老師您的課程總覽'),
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: isInitializing
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: List.generate(
                      items.length,
                      (index) => lessonCard(
                            lesson: items[index],
                            onTap: () => _getInfo(items[index]),
                            onDelete: () => _onDelete(items[index].fid!),
                          )),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () =>
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => addLessonPage(account: widget.data))).then((value) => _getData()),
          child: Icon(Icons.add)),
    );
  }
}
