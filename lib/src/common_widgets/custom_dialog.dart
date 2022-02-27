import 'package:flutter/material.dart';
import 'package:astro_tak/res/app_colors.dart';
import 'package:astro_tak/res/app_strings.dart';
import 'package:astro_tak/res/app_styles.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {Key? key,
      required this.message,
      this.positiveButton,
      this.negativeButton,
      required this.positiveButtonClick,
      this.negativeButtonClick,
      this.title})
      : super(key: key);
  final String message;
  final String? title;
  final String? positiveButton;
  final String? negativeButton;
  final VoidCallback positiveButtonClick;
  final VoidCallback? negativeButtonClick;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding:
              const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 10),
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title ?? appStringAppName,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                message,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.start,
              ),
              const SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: (negativeButton!=null),
                      child: GestureDetector(
                        onTap: () => negativeButtonClick?.call(),
                        child: Container(
                            padding:
                                const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                            decoration: BoxDecoration(
                                color: appColorPrimary,
                                border: Border.all(
                                  color: appColorPrimary,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8))),
                            child: Text(
                              negativeButton ?? appStringOk,
                              style: appStyleDialogButton,
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => positiveButtonClick.call(),
                      child: Container(
                          padding:
                          const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                              color: appColorPrimary,
                              border: Border.all(
                                color: appColorPrimary,
                              ),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(8))),
                          child: Text(
                            positiveButton ?? appStringOk,
                            style: appStyleDialogButton,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
