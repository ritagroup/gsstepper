import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsstepper/GSStepper/model/step_model.dart';
import 'package:gsstepper/GSStepper/model/stepper_style.dart';
import 'package:gsstepper/GSStepper/values/gs_stepper_colors.dart';

import '../model/gs_steper_data.dart';

// ignore: must_be_immutable
class StepperStatues extends StatelessWidget {
  final GSStepStatusEnum status;
  final StepperStyle style;
  final GSStepperData data;
  late BoxDecoration decoration;
  late String text;
  late TextStyle textStyle;

  StepperStatues(
    this.status,
    this.style,
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setStatusConfiguration();
    return Container(
      decoration: decoration,
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0, right: 6.0, top: 2, bottom: 2),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }

  setStatusConfiguration() {
    switch (status) {
      case GSStepStatusEnum.active:
        text = data.activeStatusName ?? '';
        textStyle = style.activeStatusTextStyle;
        decoration = BoxDecoration(
          color: style.activeStatusBackgroundColor,
          borderRadius: BorderRadius.circular(
            15.0,

          ),
          border: Border.all(
            width: 0.5,
            color: style.activeStatusBackgroundColor,
          ),
        );

        break;
      case GSStepStatusEnum.inActive:
        text = data.inActiveStatusName ?? '';
        textStyle = style.inActiveStatusTextStyle;
        decoration = BoxDecoration(
            color: style.inActiveStatusBackgroundColor,
            borderRadius: BorderRadius.circular(
              15.0,

            ),
            border: Border.all(width: 0.5, color: GSStepperColor.textColor2));
        break;
      case GSStepStatusEnum.success:
        text = data.successStatusName ?? '';
        textStyle = style.successStatusTextStyle;
        decoration = BoxDecoration(
          color: style.successStatusBackgroundColor,
          borderRadius: BorderRadius.circular(
            15.0,

          ),
          border: Border.all(
            width: 0.5,
            color: style.successStatusBackgroundColor,
          ),
        );
        break;
      case GSStepStatusEnum.error:
        text = data.errorStatusName ?? '';
        textStyle = style.errorStatusTextStyle;
        decoration = BoxDecoration(
          color: style.errorStatusBackgroundColor,
          borderRadius: BorderRadius.circular(
            15.0,

          ),
          border: Border.all(
            width: 0.5,
            color: style.errorStatusBackgroundColor,
          ),
        );
        break;
    }
  }
}
