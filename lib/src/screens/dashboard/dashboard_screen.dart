import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:astro_tak/gen/assets.gen.dart';
import 'package:astro_tak/res/app_colors.dart';
import 'package:astro_tak/res/app_strings.dart';
import 'package:astro_tak/res/app_styles.dart';
import 'package:astro_tak/src/screens/ask_question/view/ask_question_screen.dart';
import 'package:astro_tak/src/screens/chat/view/chat_screen.dart';
import 'package:astro_tak/src/screens/dashboard/bloc/dashboard_cubit.dart';
import 'package:astro_tak/src/screens/home/view/home_screen.dart';
import 'package:astro_tak/src/screens/profile/view/profile_tab_screen.dart';
import 'package:astro_tak/src/screens/reports/view/report_screen.dart';
import 'package:astro_tak/src/screens/talk/view/talk_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, int>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              toolbarHeight: 80,
              centerTitle: true,
              title: Assets.images.icon.image(height: 65),
              backgroundColor: appColorPrimary,
              leading: Assets.images.hamburger.image(),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(48.0),
                child: Theme(
                  data: Theme.of(context).copyWith(accentColor: Colors.white),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: appColorBlue,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                            text: const TextSpan(
                                text: appStringLabelBalance,
                                style: appStyleHeadingLight,
                                children: <InlineSpan>[
                              TextSpan(
                                text: '10',
                              )
                            ])),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 18),
                            decoration: BoxDecoration(
                                color: appColorPrimary,
                                border: Border.all(
                                  color: appColorPrimary,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8))),
                            child: const Text(
                              appStringButtonAddMoney,
                              style: appStyleButtonMoney,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProfileTabScreen()),
                      );
                    },
                    icon: Assets.images.profile.image())
              ],
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: appColorBlue,
                      border: Border.all(
                        color: appColorBlue,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: const TextSpan(
                              text: appStringLabelRupee,
                              style: appStyleTextSmallLight,
                              children: <InlineSpan>[
                            TextSpan(
                              text: '150 (1 Question on Love )',
                            )
                          ])),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                              color: appColorPrimary,
                              border: Border.all(
                                color: appColorPrimary,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          child: const Text(
                            appStringButtonAskNow,
                            style: appStyleButtonAskNow,
                          )),
                    ],
                  ),
                ),
                BottomNavigationBar(
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Assets.images.home.image(
                          height: 24,
                          color: (state == 0) ? appColorOrange : appColorGrey),
                      label: appStringNavHome,
                    ),
                    BottomNavigationBarItem(
                      icon: Assets.images.talk.image(
                          height: 24,
                          color: (state == 1) ? appColorOrange : appColorGrey),
                      label: appStringNavTalk,
                    ),
                    BottomNavigationBarItem(
                      icon: Assets.images.ask.image(
                          height: 24,
                          color: (state == 2) ? appColorOrange : appColorGrey),
                      label: appStringNavAskQues,
                    ),
                    BottomNavigationBarItem(
                      icon: Assets.images.reports.image(
                          height: 24,
                          color: (state == 3) ? appColorOrange : appColorGrey),
                      label: appStringNavReport,
                    ),
                    BottomNavigationBarItem(
                      icon: Assets.images.chat.image(
                          height: 24,
                          color: (state == 4) ? appColorOrange : appColorGrey),
                      label: appStringNavChat,
                    ),
                  ],
                  currentIndex: state,
                  selectedItemColor: appColorOrange,
                  unselectedItemColor: appColorGrey,
                  showUnselectedLabels: true,
                  selectedLabelStyle: appStyleNavLabelSelected,
                  unselectedLabelStyle: appStyleNavLabelUnSelected,
                  type: BottomNavigationBarType.fixed,
                  onTap: (value) {
                    context.read<DashboardCubit>().setNavigationIndex(value);
                  },
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              // isExtended: true,
              child: const Icon(Icons.menu),
              backgroundColor: appColorOrange,
              onPressed: () {},
            ),
            body: getBody(state));
      },
    );
  }

  getBody(int index) {
    switch (index) {
      case 0:
        {
          return const HomeScreen();
        }

      case 1:
        {
          return TalkScreen();
        }
      case 2:
        {
          return AskQuestionScreen();
        }
      case 3:
        {
          return ReportsScreen();
        }
      case 4:
        {
          return ChatScreen();
        }
      default:
        {
          return HomeScreen();
        }
    }
  }
}
