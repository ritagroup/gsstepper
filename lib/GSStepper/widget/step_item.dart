import 'package:flutter/cupertino.dart';
import 'package:gsstepper/GSStepper/model/gs_steper_data.dart';
import 'package:gsstepper/GSStepper/utils/utils.dart';
import 'package:gsstepper/GSStepper/widget/stepper_status.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../model/step_model.dart';
import '../model/stepper_style.dart';

// ignore: must_be_immutable
class StepperItem extends StatelessWidget {
  StepperItem({
    required this.step,
    required this.width,
    required this.style,
    required this.isLastStep,
    required this.data,
    Key? key,
  }) : super(key: key);

  StepperStyle style;
  GSStepperData data;
  GSStepModel step;
  double width;
  late Color iconBackground;
  late Color progressColor;
  late TextStyle stepNameTextStyle;
  late Color iconColor;
  late Widget icon;
  bool isLastStep;

  @override
  Widget build(BuildContext context) {
    _configurationItemByStatus();
    return SizedBox(
      key: step.globalKey,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 22.0,
                  height: 22.0,
                  decoration: BoxDecoration(
                    color: iconBackground,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: icon,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: RotatedBox(
                    quarterTurns: Utils.isRtl(context) ? 2 : 0,
                    child: Opacity(
                      opacity: style.showLastProgress
                          ? 1
                          : isLastStep
                              ? 0
                              : 1,
                      child: SfLinearGauge(
                          minimum: 0.0,
                          maximum: 100.0,
                          orientation: LinearGaugeOrientation.horizontal,
                          showLabels: false,
                          majorTickStyle: const LinearTickStyle(length: 0),
                          animateAxis: true,
                          barPointers: [
                            LinearBarPointer(
                              value: step.progress,
                              edgeStyle: LinearEdgeStyle.bothCurve,
                              color: progressColor,
                              thickness: 5,
                            )
                          ],
                          animationDuration: 300,
                          minorTickStyle: const LinearTickStyle(length: 0),
                          axisTrackStyle: LinearAxisTrackStyle(
                            color: style.inActiveProgressBarColor,
                            edgeStyle: LinearEdgeStyle.bothCurve,
                            thickness: 5,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              step.stepNumber!,
              style: style.activeStepNumberStyle,
            ),
            const SizedBox(height: 3),
            Text(
              '${step.stepName} \n',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: stepNameTextStyle,
            ),
            const SizedBox(height: 5),
            StepperStatues(step.status!, style, data)
          ],
        ),
      ),
    );
  }

  _configurationItemByStatus() {
    switch (step.status!) {
      case GSStepStatusEnum.success:
        iconBackground = style.successIconBackgroundColor;
        progressColor = style.successProgressBarColor;
        stepNameTextStyle = style.activeStepNameStyle;
        iconColor = style.activeIconColor;
        icon = style.successIconWidget;

        break;
      case GSStepStatusEnum.error:
        iconBackground = style.errorIconBackgroundColor;
        progressColor = style.errorProgressBarColor;
        stepNameTextStyle = style.activeStepNameStyle;
        iconColor = style.activeIconColor;
        icon = style.errorIconWidget;
        break;
      case GSStepStatusEnum.inActive:
        iconBackground = style.inActiveIconBackgroundColor;
        progressColor = style.inActiveProgressBarColor;
        stepNameTextStyle = style.inActiveStepNameStyle;
        iconColor = style.inActiveIconColor;
        icon = step.icon!;
        break;
      case GSStepStatusEnum.active:
        iconBackground = style.activeIconBackgroundColor;
        progressColor = style.activeProgressBarColor;
        stepNameTextStyle = style.activeStepNameStyle;
        iconColor = style.activeIconColor;
        icon = step.icon!;
        break;
    }
  }
}
