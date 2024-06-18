import 'package:education_system/account/data/accountRepository.dart';
import 'package:education_system/account/presentation/login.dart';
import 'package:education_system/lesson/data/lessonRepository.dart';
import 'package:education_system/lesson/data/studentLessonRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    ProviderScope(
      child: const MyApp2(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print('${size.width} , ${size.height}');
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: const loginPage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}

class MyApp2 extends ConsumerWidget {
  const MyApp2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    ref.read(accountRepoProvider);
    ref.read(lessonRepoProvider);
    ref.read(studentLessonRepoProvider);
    print('${size.width} , ${size.height}');
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: const loginPage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}
