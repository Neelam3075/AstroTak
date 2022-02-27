import 'package:flutter/material.dart';

class BaseScreenModel {
  BaseScreenModel({this.loading, this.dialogMessage});

  final bool? loading;
  final String? dialogMessage;

  BaseScreenModel copyWith({
    bool? loading,
    String? dialogMessage,
  }) {
    return BaseScreenModel(
      loading: loading ?? this.loading,
      dialogMessage: dialogMessage,
    );
  }
}
