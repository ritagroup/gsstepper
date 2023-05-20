import 'package:flutter/cupertino.dart';
import 'package:gsstepper/GSStepper/model/gs_steper_data.dart';
import 'package:gsstepper/GSStepper/model/stepper_style.dart';
import 'package:gsstepper/GSStepper/widget/step_item.dart';

import '../model/step_model.dart';

class GSScrollableStepper extends StatelessWidget {
  const GSScrollableStepper({
    required this.steps,
    required this.controller,
    Key? key,
    required this.stepWidth,
    required this.style,
    required this.stepperData,
  }) : super(key: key);

  final List<GSStepModel> steps;
  final ScrollController controller;
  final double stepWidth;
  final StepperStyle style;
  final GSStepperData stepperData;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SingleChildScrollView(
          controller: controller,
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              steps.length,
              (index) => StepperItem(
                step: steps[index],
                width: stepWidth,
                style: style,
                data: stepperData,
                isLastStep: _isLastStep(index),
              ),
            ).toList(),
          ),
        ),
      ],
    );
  }

  _isLastStep(int index) {
    return index == steps.length - 1;
  }
}
