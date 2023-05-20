import 'package:flutter/cupertino.dart';
import 'package:gsstepper/GSStepper/model/gs_steper_data.dart';
import 'package:gsstepper/GSStepper/widget/step_item.dart';

import '../model/step_model.dart';
import '../model/stepper_style.dart';

class GSFixedStepper extends StatelessWidget {
  const GSFixedStepper({required this.steps, Key? key, required this.style, required this.stepperData})
      : super(key: key);

  final List<GSStepModel> steps;
  final StepperStyle style;
  final GSStepperData stepperData;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return Row(
                children: List.generate(
                    steps.length,
                    (index) => StepperItem(
                          step: steps[index],
                          width: constraints.maxWidth / steps.length,
                          style: style,
                          data: stepperData,
                          isLastStep: _isLastStep(index),
                        )).toList());
          },
        ),
      ],
    );
  }

  _isLastStep(int index) {
    return index == steps.length - 1;
  }
}
