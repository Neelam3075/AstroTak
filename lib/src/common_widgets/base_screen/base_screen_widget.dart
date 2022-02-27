import 'dart:developer';

import 'package:astro_tak/res/app_resources.dart';
import 'package:astro_tak/src/common_widgets/custom_dialog.dart';
import 'package:flutter/material.dart';

class BaseScreenWidget extends StatelessWidget {
  const BaseScreenWidget({
    Key? key,
    required this.child,
    this.loading = false,
    this.dialogMessage,
    this.dialogPositiveButton,
    this.dialogNegetiveButton,
    this.dialogPositiveButtonColor,
    this.dialogNegetiveButtonColor,
    required this.dialogPositiveButtonClick,
    this.dialogNegetiveButtonClick,
    this.backgroundColor = appColorPrimary,
    this.overLayColor = appColorTransparentGrey,
    this.padding,
    this.margin,
    this.height
  }) : super(key: key);
  final Widget child;
  final bool? loading;
  final String? dialogMessage;
  final String? dialogPositiveButton;
  final String? dialogNegetiveButton;
  final Color? dialogPositiveButtonColor;
  final Color? dialogNegetiveButtonColor;
  final VoidCallback dialogPositiveButtonClick;
  final VoidCallback? dialogNegetiveButtonClick;
  final Color? backgroundColor;
  final Color? overLayColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? height;

  @override
  Widget build(BuildContext context) {
    log('build///////////: ${loading}');
    return Container(
      height: height,
      color: backgroundColor,
      child: Stack(
        children: [
          Container(margin: margin, padding: padding, child: child),
          Visibility(
            visible: loading ?? false,
            child: Container(
                color: appColorTransparentGrey,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  color: appColorOrange,
                )),
          ),
          Visibility(
            visible: dialogMessage != null,
            child: Container(
                color: appColorTransparentGrey,
                alignment: Alignment.center,
                child: CustomDialog(
                  positiveButton: dialogPositiveButton,
                  negativeButton: dialogNegetiveButton,
                  message: dialogMessage ?? '',
                  positiveButtonClick: dialogPositiveButtonClick,
                )),
          )
        ],
      ),
    );
  }
}
