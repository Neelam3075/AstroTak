part of 'ask_question_cubit.dart';

class AskQuestionState extends Equatable with BaseState {
  final CategoryResponse? categoryResponse;
  final int index;

  AskQuestionState({this.categoryResponse, this.index = 0});

  AskQuestionState copyWith(
      {CategoryResponse? categoryResponse,
      bool? loading,
      String? msg,
      bool? isSuccess,
      int? index}) {
    var askQuestion = AskQuestionState(
      categoryResponse: categoryResponse ?? this.categoryResponse,
      index: index ?? 0,
    );
    askQuestion.loading = loading ?? this.loading;
    askQuestion.msg = msg;
    askQuestion.isSuccess = isSuccess ?? this.isSuccess;

    return askQuestion;
  }

  @override
  List<Object?> get props => [categoryResponse, loading, msg, isSuccess, index];
}
