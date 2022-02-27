import 'package:astro_tak/res/app_resources.dart';
import 'package:astro_tak/src/screens/dashboard/bloc/dashboard_cubit.dart';
import 'package:astro_tak/src/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appStringAppName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => DashboardCubit(0), child: DashboardScreen()),
    );
  }
}