part of 'family_profile_cubit.dart';

class FamilyProfileState extends Equatable with BaseState {
  FamilyProfileState({this.relativesResponse, this.deleteRelativeResonse});

  final RelativesResponse? relativesResponse;
  final DeleteRelativeResonse? deleteRelativeResonse;

  @override
  List<Object?> get props =>
      [relativesResponse, loading, isSuccess, msg, deleteRelativeResonse];

  FamilyProfileState copyWith({
    RelativesResponse? relativesResponse,
    DeleteRelativeResonse? deleteRelativeResonse,
    bool? isSuccess,
    String? msg,
    bool? loading,
  }) {
    FamilyProfileState familyProfileState = FamilyProfileState(
        relativesResponse: relativesResponse ?? this.relativesResponse,
        deleteRelativeResonse: deleteRelativeResonse ??
            this.deleteRelativeResonse
    );
    familyProfileState.loading = loading ?? this.loading;
    familyProfileState.msg = msg;
    familyProfileState.isSuccess = isSuccess ?? this.isSuccess;
    return familyProfileState;
  }
}
