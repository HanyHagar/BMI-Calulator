import 'package:bloc/bloc.dart';
import 'package:bmi_calculater/layout/calculate_screen.dart';
import 'package:flutter/material.dart';
import 'shared/cubit/myBlocObserver.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff100B20),

      ),
      debugShowCheckedModeBanner: false,
      home: CalculateScreen(),
    );
  }
}

