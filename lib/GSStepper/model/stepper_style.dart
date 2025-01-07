import 'package:flutter/material.dart';

import '../values/gs_stepper_colors.dart';

enum StepperBehavior { fixed, scrollable , simple }

class StepperStyle {
  Color inActiveIconColor;
  Color activeIconColor;
  Color activeIconBackgroundColor;
  Color inActiveIconBackgroundColor;
  Color errorIconBackgroundColor;
  Color successIconBackgroundColor;
  Color inActiveProgressBarColor;
  Color errorProgressBarColor;
  Color successProgressBarColor;
  Color activeProgressBarColor;
  Color activeStatusBackgroundColor;
  Color errorStatusBackgroundColor;
  Color successStatusBackgroundColor;
  Color inActiveStatusBackgroundColor;
  Color borderColor;
  TextStyle activeStatusTextStyle;
  TextStyle inActiveStatusTextStyle;
  TextStyle successStatusTextStyle;
  TextStyle errorStatusTextStyle;
  TextStyle activeStepNameStyle;
  TextStyle inActiveStepNameStyle;
  TextStyle activeStepNumberStyle;
  TextStyle inActiveStepNumberStyle;
  Widget successIconWidget;
  Widget errorIconWidget;
  bool showLastProgress;

  StepperStyle({
    Color? inActiveIconColor,
    Color? activeIconColor,
    Color? activeIconBackgroundColor,
    Color? inActiveIconBackgroundColor,
    Color? inActiveProgressBarColor,
    Color? activeProgressBarColor,
    Color? activeStatusBackgroundColor,
    Color? inActiveStatusBackgroundColor,
    Color? errorIconBackgroundColor,
    Color? successIconBackgroundColor,
    Color? errorProgressBarColor,
    Color? successProgressBarColor,
    Color? errorStatusBackgroundColor,
    Color? successStatusBackgroundColor,
    TextStyle? successStatusTextStyle,
    TextStyle? activeStatusTextStyle,
    TextStyle? inActiveStatusTextStyle,
    TextStyle? activeStepNameStyle,
    TextStyle? inActiveStepNameStyle,
    TextStyle? activeStepNumberStyle,
    TextStyle? inActiveStepNumberStyle,
    TextStyle? errorStatusTextStyle,
    Widget? successIconAssets,
    Widget? errorIconAssets,
    bool? showLastProgress,
    Color? borderColor ,
  })  : inActiveIconColor = inActiveIconColor ?? GSStepperColor.textColor2,
        activeIconColor = activeIconColor ?? GSStepperColor.white,
        activeIconBackgroundColor = activeIconBackgroundColor ?? GSStepperColor.blue,
        inActiveIconBackgroundColor = inActiveIconBackgroundColor ?? GSStepperColor.divider,
        inActiveProgressBarColor = inActiveProgressBarColor ?? GSStepperColor.divider,
        activeProgressBarColor = activeProgressBarColor ?? GSStepperColor.green,
        activeStatusBackgroundColor = activeStatusBackgroundColor ?? GSStepperColor.fadeBlue,
        inActiveStatusBackgroundColor = inActiveStatusBackgroundColor ?? Colors.transparent,
        errorIconBackgroundColor = errorIconBackgroundColor ?? GSStepperColor.red,
        errorProgressBarColor = errorProgressBarColor ?? GSStepperColor.red,
        successProgressBarColor = successProgressBarColor ?? GSStepperColor.green,
        successStatusBackgroundColor = successProgressBarColor ?? GSStepperColor.fadeGreen,
        errorStatusBackgroundColor = successProgressBarColor ?? GSStepperColor.fadeRed,
        borderColor = borderColor ?? GSStepperColor.black,
        successIconBackgroundColor = successIconBackgroundColor ?? GSStepperColor.green,
        activeStatusTextStyle = activeStatusTextStyle ??
            const TextStyle(color: GSStepperColor.blue, fontWeight: FontWeight.w500, fontSize: 10.0),
        successStatusTextStyle = successStatusTextStyle ??
            const TextStyle(color: GSStepperColor.green, fontWeight: FontWeight.w500, fontSize: 12.0),
        errorStatusTextStyle = errorStatusTextStyle ??
            const TextStyle(color: GSStepperColor.red, fontWeight: FontWeight.w500, fontSize: 10.0),
        inActiveStatusTextStyle = inActiveStatusTextStyle ??
            const TextStyle(color: GSStepperColor.textColor2, fontWeight: FontWeight.w500, fontSize: 10.0),
        activeStepNameStyle = activeStepNameStyle ??
            const TextStyle(color: GSStepperColor.textColor1, fontWeight: FontWeight.w600, fontSize: 10.0),
        inActiveStepNameStyle = inActiveStepNameStyle ??
            const TextStyle(color: GSStepperColor.textColor2, fontWeight: FontWeight.w800, fontSize: 10.0),
        activeStepNumberStyle = activeStepNumberStyle ??
            const TextStyle(color: GSStepperColor.textColor2, fontWeight: FontWeight.w500, fontSize: 10.0),
        inActiveStepNumberStyle = inActiveStepNumberStyle ??
            const TextStyle(color: GSStepperColor.textColor2, fontWeight: FontWeight.w500, fontSize: 10.0),
        successIconWidget = successIconAssets ??
            const Icon(
              Icons.check,
              color: GSStepperColor.white,
              size: 16,
            ),
        errorIconWidget = errorIconAssets ??
            const Icon(
              Icons.cancel_outlined,
              color: GSStepperColor.white,
              size: 10,
            ),
        showLastProgress = showLastProgress ?? false;
}
