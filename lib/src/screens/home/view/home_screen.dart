import 'package:flutter/material.dart';
import 'package:astro_tak/res/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(appStringNavHome),
    );
  }
}
