import 'package:feemanage/dashboard.dart';
import 'package:feemanage/login.dart';
import 'package:feemanage/registration.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const ResgiterPage(),
        '/login': (context) => const LoginPages(),
        '/dashboard': (context) => const DashBoardPage(),
      },
    );
  }
}
