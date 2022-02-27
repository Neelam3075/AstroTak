import 'package:equatable/equatable.dart';

class BaseScreenEvent extends Equatable {
  const BaseScreenEvent({this.showLoading, this.dialogMessage});

  final bool? showLoading;
  final String? dialogMessage;

  @override
  List<Object?> get props => [showLoading, dialogMessage];
}
