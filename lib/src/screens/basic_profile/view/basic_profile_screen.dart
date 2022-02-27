import 'package:flutter/cupertino.dart';
import 'package:astro_tak/res/app_strings.dart';

class BasicProfileScreen extends StatelessWidget {
  const BasicProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text(appStringBasicProfile),
    );
  }
}
