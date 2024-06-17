import 'package:education_system/appbar/customAppBar.dart';
import 'package:education_system/lesson/domain/lesson.dart';
import 'package:flutter/material.dart';

class lessonInfoPage extends StatelessWidget {
  final lessonData data;
  const lessonInfoPage({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: '課程總覽'),
      body: Container(
        height: double.infinity,
        color: Colors.white,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
