import 'package:astro_tak/res/app_resources.dart';
import 'package:astro_tak/src/base_bloc/base_state.dart';
import 'package:astro_tak/src/screens/family_profile/models/delete_relative/delete_relative_resonse.dart';
import 'package:astro_tak/src/screens/family_profile/models/get_relatives/relatives_response.dart';
import 'package:astro_tak/src/screens/family_profile/repository/family_profile_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'familly_profile_state.dart';

class FamilyProfileCubit extends Cubit<FamilyProfileState> {
  FamilyProfileCubit({required this.familyProfileRepo})
      : super(FamilyProfileState()) {
    getAllRelatives();
  }

  FamilyProfileRepo familyProfileRepo;

  getAllRelatives() async {
    RelativesResponse? relativesResponse =
        await familyProfileRepo.getAllRelatives((loading) async {
      emit(state.copyWith(
        loading: loading,
      ));
    });
    if (relativesResponse != null) {
      emit(state.copyWith(
          relativesResponse: relativesResponse,
          isSuccess: true,
          loading: false));
    } else {
      emit(state.copyWith(
          msg: appStringErrorMsg, isSuccess: false, loading: false));
    }
  }

  deleteRelative(String relativeUUID) async {
    DeleteRelativeResonse? deleteRelativeResonse =
        await familyProfileRepo.deleteRelatives(relativeUUID, (loading) async {
      emit(state.copyWith(
        loading: loading,
      ));
    });
    if (deleteRelativeResonse != null) {
      emit(state.copyWith(
          isSuccess: true,
          deleteRelativeResonse: deleteRelativeResonse,
          msg: deleteRelativeResonse.message,
          loading: false));
    } else {
      emit(state.copyWith(
          msg: appStringErrorMsg, isSuccess: false, loading: false));
    }
  }
}
