
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:astro_tak/src/common_widgets/base_screen/bloc/base_screen_state.dart';

class BaseScreenBloc extends Cubit<BaseScreenState> {
  BaseScreenBloc(BaseScreenState initialState) : super(initialState);

  showDialog(String? dialogMessage) {
    emit(BaseScreenState(state.baseScreenModel
        .copyWith(dialogMessage: dialogMessage, loading: false)));
  }

  showLoading(bool showLoading) {
    emit(BaseScreenState(state.baseScreenModel.copyWith(loading: showLoading)));
  }
}
