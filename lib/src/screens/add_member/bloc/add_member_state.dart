part of 'add_member_cubit.dart';

class AddMemberState extends Equatable with BaseState {
  final AddMemberResponse? addMemberResponse;
  final AddMemberRequest? addMemberRequest;
  final bool? isSomethingChanged;

  AddMemberState(
      {this.addMemberResponse, this.addMemberRequest, this.isSomethingChanged});

  AddMemberState copyWith(
      {AddMemberResponse? addMemberResponse,
      AddMemberRequest? addMemberRequest,
      bool? loading,
      String? msg,
      bool? isSuccess,
      bool? isSomethingChanged}) {
    var addMember = AddMemberState(
        addMemberRequest: addMemberRequest ?? this.addMemberRequest,
        addMemberResponse: addMemberResponse ?? this.addMemberResponse);
    addMember.loading = loading ?? loading;
    addMember.msg = msg;
    addMember.isSuccess = isSuccess ?? isSuccess;

    return addMember;
  }

  @override
  List<Object?> get props =>
      [addMemberResponse, loading, msg, isSuccess, addMemberRequest];
}
