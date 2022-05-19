// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../buttons/button.dart';

class CustomAlertDialog extends StatelessWidget {
  final Color? bgColor;
  final String? title;
  final Widget? content;
  final String? message;
  final String? rightBtnText;
  final String? leftBtnText;
  Function()? onRightPressed;
  Function()? onLeftPressed;
  final bool? isBackButton;
  CustomAlertDialog(
      {Key? key,
      this.content,
      this.title,
      this.message,
      this.bgColor = Colors.white,
      this.rightBtnText,
      this.leftBtnText,
      this.onRightPressed,
      this.onLeftPressed,
      this.isBackButton = false})
      : assert(bgColor != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: message != null
          ? Text(
              message!,
              textAlign: TextAlign.center,

            )
          : content,
      contentPadding: EdgeInsets.all(45.sp),
      backgroundColor: bgColor,
      insetPadding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      actionsAlignment: isBackButton!
          ? MainAxisAlignment.spaceEvenly
          : MainAxisAlignment.center,
      actions: <Widget>[
        leftBtnText != null
            ? CustomButton(
                isActive: true,
                text: leftBtnText!,
                onPressed: onLeftPressed!,
              )
            : Visibility(visible: false, child: Container()),
        rightBtnText != null
            // ignore: deprecated_member_use
            ? Visibility(
                visible: isBackButton ?? true,
                child: CustomButton(
                  isActive: false,
                  text: rightBtnText!,
                  onPressed: onRightPressed!,
                ),
              )
            : Visibility(visible: false, child: Container())
      ],
    );
  }
}
