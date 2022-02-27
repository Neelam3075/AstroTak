import 'package:equatable/equatable.dart';

import '../base_screen_model.dart';

class BaseScreenState extends Equatable {
  const BaseScreenState(this.baseScreenModel);

  final BaseScreenModel baseScreenModel;

  @override
  List<Object> get props => [baseScreenModel];
}
