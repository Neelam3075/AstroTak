import 'package:astro_tak/res/app_strings.dart';
import 'package:astro_tak/src/base_bloc/base_state.dart';
import 'package:astro_tak/src/screens/ask_question/models/category_response.dart';
import 'package:astro_tak/src/screens/ask_question/models/question_category.dart';
import 'package:astro_tak/src/screens/ask_question/repository/ask_question_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

part 'ask_question_state.dart';

class AskQuestionCubit extends Cubit<AskQuestionState> {
  AskQuestionCubit({required this.askQuestionRepo})
      : super(AskQuestionState()) {
    _getQuestionCategories();
  }

  AskQuestionRepo askQuestionRepo;

  _getQuestionCategories() async {
    CategoryResponse? categoryResponse =
        await askQuestionRepo.getQuestionCategories((loading) async {
      emit(state.copyWith(
        loading: loading,
      ));
    });
    if (categoryResponse != null) {
      emit(state.copyWith(
          index: 0,
          categoryResponse: categoryResponse,
          isSuccess: true,
          loading: false));
    } else {
      emit(state.copyWith(
          msg: appStringErrorMsg, isSuccess: false, loading: false));
    }
  }

  getSelectedCategories(QuestionCategory? cat) async {
    int? getIndex =
        state.categoryResponse?.data?.indexOf(cat ?? QuestionCategory());
    emit(state.copyWith(
      index: getIndex,
    ));
  }

  void hideDialog() {
    emit(state.copyWith(msg: null));
  }
}
