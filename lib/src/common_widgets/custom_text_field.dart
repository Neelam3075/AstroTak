import 'package:astro_tak/res/app_colors.dart';
import 'package:astro_tak/res/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomRectTextField extends StatelessWidget {
  final IconData? icon;
  final String? iconAsset;
  final String title;
  final String? hintText;

  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final bool isPassword;
  final bool? isEmail;
  final bool? enable;
  final bool showHintText;
  final bool readOnly;
  final int? minLines;
  final int? maxLines;
  final GestureTapCallback? onTap;
  final TextInputType? keyboardType;
  TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputAction? textInputAction;

  CustomRectTextField(
      {Key? key,
      this.hintText,
      this.icon,
      this.title = "",
      this.isEmail = false,
      this.validator,
      this.onSaved,
      this.onChanged,
      this.isPassword = false,
      this.keyboardType,
      this.controller,
      this.enable,
      this.minLines = 1,
      this.maxLines = 1,
      this.readOnly = false,
      this.showHintText = true,
      this.initialValue,
      this.onTap,
      this.inputFormatter,
      this.iconAsset = '',
      this.textInputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: showHintText,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              title,
              style: appStyleAddProfileText,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black38.withOpacity(0.1),
                blurRadius: 35,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: TextFormField(
            textInputAction: textInputAction,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            autofocus: false,
            readOnly: readOnly,
            controller: controller,
            enabled: enable,
            minLines: minLines,
            maxLines: maxLines,
            initialValue: initialValue,
            onTap: onTap,
            inputFormatters: inputFormatter,
            decoration: InputDecoration(
              /* prefixIcon: iconAsset != null
                  ? Transform.scale(
                      scale: 0.6,
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(iconAsset!),
                      ),
                    )
                  : Icon(
                      icon,
                      color: appColorPrimary,
                    ),*/
              hintText: hintText,
              hintStyle: appStyleAddProfileText,
              errorMaxLines: 4,
              contentPadding: const EdgeInsets.all(15),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: appColorGrey, width: 2),
              ),
              fillColor: Colors.white,
            ),
            obscureText: isPassword ? true : false,
            validator: validator,
            onSaved: onSaved,
            onChanged: onChanged,
            keyboardType: keyboardType,
            autocorrect: false,
          ),
        ),
      ],
    );
  }
}
