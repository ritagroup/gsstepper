import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsstepper/GSStepper/model/gs_steper_data.dart';
import 'package:gsstepper/GSStepper/utils/utils.dart';
import 'package:gsstepper/GSStepper/widget/stepper_status.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../model/step_model.dart';
import '../model/stepper_style.dart';

// ignore: must_be_immutable
class StepperSimpleItem extends StatelessWidget {
  StepperSimpleItem({
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
  late double borderWidth ;
  late double  thickness ;

  bool isLastStep;

  @override
  Widget build(BuildContext context) {
    _configurationItemByStatus();
    return SizedBox(
      key: step.globalKey,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: RotatedBox(
                    quarterTurns: Utils.isRtl(context) ? 2 : 0,
                    child: Opacity(
                      opacity: 1,
                      child: SfLinearGauge(
                          minimum: 0.0,
                          maximum: 100.0,
                          orientation: LinearGaugeOrientation.horizontal,
                          showLabels: false,
                          majorTickStyle: const LinearTickStyle(length: 0),
                          animateAxis: true,
                          animateRange: true ,
                          barPointers: [
                            LinearBarPointer(
                              enableAnimation: true,
                              value: step.progress,
                              edgeStyle: LinearEdgeStyle.bothCurve,
                              color: progressColor,
                              thickness: thickness,
                            )
                          ],
                          animationDuration: 300,
                          minorTickStyle: const LinearTickStyle(length: 0),
                          axisTrackStyle: LinearAxisTrackStyle(
                            color: Colors.white,
                            borderColor: Colors.black,
                            borderWidth: borderWidth,
                            edgeStyle: LinearEdgeStyle.bothCurve,
                            thickness: 5,
                          )),
                    ),
                  ),
                ),
              ],
            ),
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
        thickness = 5 ;
        borderWidth = 0.0 ;


        break;
      case GSStepStatusEnum.error:
        iconBackground = style.errorIconBackgroundColor;
        progressColor = style.errorProgressBarColor;
        thickness = 5 ;
        borderWidth = 0.0 ;

        break;
      case GSStepStatusEnum.inActive:
        iconBackground = style.inActiveIconBackgroundColor;
        progressColor = style.inActiveProgressBarColor;
        thickness = 5 ;
        borderWidth = 1 ;
        break;
      case GSStepStatusEnum.active:
        iconBackground = style.activeIconBackgroundColor;
        progressColor = style.activeProgressBarColor;
        thickness = 20 ;
        borderWidth = 0.0 ;
        width = 40 ;
        break;
    }
  }
}
