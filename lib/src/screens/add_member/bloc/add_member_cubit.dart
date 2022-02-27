import 'package:astro_tak/res/app_resources.dart';
import 'package:astro_tak/src/base_bloc/base_state.dart';
import 'package:astro_tak/src/screens/add_member/models/add_member_request.dart';
import 'package:astro_tak/src/screens/add_member/models/add_member_respone.dart';
import 'package:astro_tak/src/screens/add_member/models/birth_details.dart';
import 'package:astro_tak/src/screens/add_member/models/birth_place.dart';
import 'package:astro_tak/src/screens/add_member/view/add_member_validation_mixin.dart';
import 'package:astro_tak/src/screens/family_profile/repository/family_profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_member_state.dart';

class AddMemberCubit extends Cubit<AddMemberState>
    with AddMemberValidationMixin {
  AddMemberCubit({required this.familyProfileRepo})
      : super(AddMemberState(
            addMemberRequest: AddMemberRequest(
                birthDetails: BirthDetails(), birthPlace: BirthPlace())));

  FamilyProfileRepo familyProfileRepo;

  addMember() async {
    AddMemberResponse? addMemberResponse = await familyProfileRepo
        .addMember(state.addMemberRequest, (loading) async {
      emit(state.copyWith(
        loading: loading,
      ));
    });
    if (addMemberResponse != null) {
      emit(state.copyWith(
        addMemberResponse: addMemberResponse,
        msg: addMemberResponse.message,
        isSuccess: true,
      ));
    } else {
      emit(state.copyWith(isSuccess: false, msg: appStringErrorMsg));
    }
  }

  setDate(DateTime dateTime) {
    AddMemberRequest? request = state.addMemberRequest;
    request?.birthDetails?.dobDay = dateTime.day;
    request?.birthDetails?.dobMonth = dateTime.month;
    request?.birthDetails?.dobYear = dateTime.year;
    emit(state.copyWith(addMemberRequest: request));
  }

  setTime(TimeOfDay tod) {
    AddMemberRequest? request = state.addMemberRequest?.copyWith(
        birthDetails: state.addMemberRequest?.birthDetails?.copyWith(
            tobHour: tod.hour,
            tobMin: tod.minute,
            meridiem: tod.period.name.toUpperCase()));

    emit(state.copyWith(addMemberRequest: request));
  }

  setRelation(int relationId) async {
    emit(state.copyWith(
        addMemberRequest:
            state.addMemberRequest?.copyWith(relationId: relationId)));
  }

  setGender(String gender) async {
    emit(state.copyWith(
        addMemberRequest: state.addMemberRequest?.copyWith(gender: gender)));
  }
}
