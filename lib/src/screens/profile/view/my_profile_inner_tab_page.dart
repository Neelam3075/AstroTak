import 'package:astro_tak/res/app_colors.dart';
import 'package:astro_tak/res/app_strings.dart';
import 'package:astro_tak/src/custom_widgets/RectIndicator.dart';
import 'package:astro_tak/src/screens/basic_profile/view/basic_profile_screen.dart';
import 'package:astro_tak/src/screens/family_profile/view/family_profile_screen.dart';
import 'package:flutter/material.dart';

class MyProfileInnerTabScreen extends StatelessWidget {
  const MyProfileInnerTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.grey[100],
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: appColorPrimary,
                ),
              ),

              child: TabBar(
                labelColor: appColorPrimary,
                unselectedLabelColor: appColorOrange,
                tabs: const [
                  Tab(
                    text: appStringBasicProfile,
                  ),
                  Tab(
                    text: appStringFrndsFamily,
                  ),
                ],
                automaticIndicatorColorAdjustment: true,
                indicator: RectangularIndicator(
                  color: appColorOrange,
                  topLeftRadius: 5,
                  topRightRadius: 5,
                  bottomLeftRadius: 5,
                  bottomRightRadius: 5,
                ),
              ),
            ),
             Expanded(
              child: TabBarView(children: [
                BasicProfileScreen(),
                FamilyProfileScreen(),

              ]),
            )
          ],
        ),
      ),
    );



  }
}
