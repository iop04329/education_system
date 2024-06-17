import 'package:education_system/account/domain/account.dart';
import 'package:education_system/appbar/customAppBar.dart';
import 'package:education_system/customWidget/customWidget.dart';
import 'package:education_system/lesson/domain/lesson.dart';
import 'package:education_system/utils/pub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class AllLessonsPage extends StatefulHookConsumerWidget {
  const AllLessonsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _lessonPageState();
}

class _lessonPageState extends ConsumerState<AllLessonsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: '學生課程總覽'),
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: List.generate(5, (index) => teacherInfoCard()),
            // ListView.builder(
            //   itemCount: 5,
            //   itemBuilder: (_, ind) => lessonCard(),
            // ),
          ),
        ),
      ),
    );
  }
}
