import 'package:flutter/material.dart';
import 'package:astro_tak/res/app_strings.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(appStringNavReport),
    );
  }
}
