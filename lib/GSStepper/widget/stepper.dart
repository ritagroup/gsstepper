import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsstepper/GSStepper/model/stepper_style.dart';
import 'package:gsstepper/GSStepper/widget/fixed_stepper.dart';
import 'package:gsstepper/GSStepper/widget/simple_stepper.dart';

import '../model/gs_steper_data.dart';
import '../model/step_model.dart';
import 'scrollable_stepper.dart';

// ignore: must_be_immutable
class GSStepper extends StatelessWidget {
  GSStepper.fixed({
    required this.steps,
    required this.onNextStep,
    this.style,
    required this.currentIndex,
    this.onComplete,
    required this.stepperData,
    Key? key,
  }) : super(key: key) {
    stepperBehavior = StepperBehavior.fixed;
  }
  GSStepper.simple({
    required this.steps,
    required this.onNextStep,
    this.style,
    this.stepWidth,
    required this.currentIndex,
    this.onComplete,
    required this.stepperData,
    Key? key,
  }) : super(key: key) {
    stepperBehavior = StepperBehavior.simple;
  }

  GSStepper.scrollable({
    Key? key,
    required this.steps,
    required this.stepWidth,
    required this.currentIndex,
    required this.onNextStep,
    required this.stepperData,
    this.style,
    this.onComplete,
  }) : super(key: key) {
    stepperBehavior = StepperBehavior.scrollable;
  }



  final List<GSStepModel> steps;
  StepperStyle? style;
  final GSStepperData stepperData;
  int currentIndex;
  double? stepWidth;
  VoidCallback? onComplete;
  ValueChanged<int> onNextStep;

  StepperBehavior? stepperBehavior;
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    style = style ?? StepperStyle();
    if (currentIndex == 0) {
      _configureFirstStep();
    }
    if (stepperBehavior == StepperBehavior.fixed) {
      return GSFixedStepper(
        steps: steps,
        style: style!,
        stepperData: stepperData,
      );
    } else if (stepperBehavior == StepperBehavior.scrollable) {
      return GSScrollableStepper(
        steps: steps,
        controller: _controller,
        stepWidth: stepWidth!,
        style: style!,
        stepperData: stepperData,
      );
    } else if(stepperBehavior == StepperBehavior.simple){
      return GSSimpleStepper(
        steps: steps,
        style: style!,
        stepperData: stepperData,
        stepWidth: stepWidth,

      );
    }else {
      return Container();
    }
  }

  GSStepModel _findStepByIndex(int index) {
    return steps.elementAt(index);
  }

  _configureFirstStep() {
    _findStepByIndex(0).status = GSStepStatusEnum.active;
    _findStepByIndex(0).progress = 100;
  }

  goToStep({
    required GSStepStatusEnum currentStatus,
    required int newIndex,
    double newStepProgress = 0,
    double oldStepProgress = 100,
  }) {
    if (newIndex >= 0) {
      if (newIndex >= steps.length) {
        onComplete?.call();
      } else {
        GSStepModel oldStep = _findStepByIndex(currentIndex);
        GSStepModel newStep = _findStepByIndex(newIndex);

        _configureOldStep(
          oldStep,
          currentStatus,
          oldStepProgress,
        );
        _configureNextStep(
          newStep,
          newStep.status != GSStepStatusEnum.success ? 100 : newStepProgress,
        );

        onNextStep(newIndex);
      }
    }
  }

  _configureNextStep(
    GSStepModel nextStep,
    double nextStepProgress,
  ) {
    nextStep.status = GSStepStatusEnum.active;
    nextStep.progress = nextStepProgress;
    if (stepperBehavior == StepperBehavior.scrollable) {
      _scrollToNewStep(nextStep);
    }
  }

  _configureOldStep(
    GSStepModel oldStep,
    GSStepStatusEnum oldStatus,
    double oldStepProgress,
  ) {
    oldStep.status = oldStatus;
    oldStep.progress = oldStepProgress;
  }

  _scrollToNewStep(GSStepModel newStep) {
    _controller.position.ensureVisible(
      newStep.globalKey!.currentContext!.findRenderObject()!,
      alignment: 0.5, // Aligns the image in the middle.
      duration: const Duration(milliseconds: 300), // So it does not jump.
    );
  }
}
