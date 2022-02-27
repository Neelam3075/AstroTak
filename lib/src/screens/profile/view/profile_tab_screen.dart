import 'package:flutter/material.dart';
import 'package:astro_tak/gen/assets.gen.dart';
import 'package:astro_tak/res/app_colors.dart';
import 'package:astro_tak/res/app_strings.dart';
import 'package:astro_tak/res/app_styles.dart';
import 'package:astro_tak/src/screens/order_history/order_history.dart';
import 'package:astro_tak/src/screens/profile/view/my_profile_inner_tab_page.dart';

class ProfileTabScreen extends StatelessWidget {
  const ProfileTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Assets.images.icon.image(height: 65),
            centerTitle: true,
            backgroundColor: appColorPrimary,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: appColorOrange,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    appStringButtonLogout,
                    style: appStyleButtonLogout,
                  ),
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      BorderSide.lerp(
                          const BorderSide(
                            style: BorderStyle.solid,
                            color: appColorOrange,
                            width: 1.0,
                          ),
                          const BorderSide(
                            style: BorderStyle.solid,
                            color: appColorOrange,
                            width: 1.0,
                          ),
                          4.0),
                    ),
                  ),
                ),
              ),
            ],
            bottom: const TabBar(
              indicatorColor: appColorOrange,
              labelColor: appColorOrange,
              unselectedLabelColor: appColorGrey,
              tabs: [
                Tab(
                  text: appStringMyProfile,
                ),
                Tab(
                  text: appStringOrderHistory,
                ),
              ],
              automaticIndicatorColorAdjustment: true,
            ),
          ),
          body: const TabBarView(children: [
            MyProfileInnerTabScreen(),
            OrderHistory(),
          ])),
    );
  }
}
