import 'package:flutter/material.dart';
import 'package:astro_tak/res/app_strings.dart';

class TalkScreen extends StatelessWidget {
  const TalkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(appStringNavTalk),
    );
  }
}
