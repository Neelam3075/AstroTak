import 'package:astro_tak/src/screens/add_member/view/add_member_screen.dart';
import 'package:astro_tak/src/screens/family_profile/bloc/family_profile_cubit.dart';
import 'package:astro_tak/src/screens/family_profile/repository/family_profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'family_profile_ui.dart';

class FamilyProfileScreen extends StatelessWidget {
   FamilyProfileScreen({Key? key}) : super(key: key);

  ValueNotifier<bool> addMember = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FamilyProfileRepo(),
      child: ValueListenableBuilder<bool>(
          valueListenable: addMember,
          builder: (context, value, child) {
            return Stack(
              children: [
                BlocProvider<FamilyProfileCubit>(
                  create: (BuildContext context) => FamilyProfileCubit(
                      familyProfileRepo: context.read<FamilyProfileRepo>()),
                  child: FamilyProfileUi(addMember: addMember,),
                ),

                Visibility(
                    visible: value,
                    child: AddMemberScreen(
                      addMember: addMember,
                    ))
              ],
            );
          }),

    );
  }
}
