import 'package:flutter/cupertino.dart';
import 'package:gsstepper/GSStepper/model/gs_steper_data.dart';
import 'package:gsstepper/GSStepper/widget/simple_step_item.dart';
import 'package:gsstepper/GSStepper/widget/step_item.dart';

import '../model/step_model.dart';
import '../model/stepper_style.dart';

class GSSimpleStepper extends StatelessWidget {
  const GSSimpleStepper({required this.steps, Key? key, required this.style, required this.stepperData , this.stepWidth})
      : super(key: key);

  final List<GSStepModel> steps;
  final StepperStyle style;
  final GSStepperData stepperData;
  final double? stepWidth ;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return Row(
                children: List.generate(
                    steps.length,
                    (index) => StepperSimpleItem(
                          step: steps[index],
                          width: stepWidth??constraints.maxWidth / steps.length,
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
