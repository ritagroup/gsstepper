import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gsstepper/GSStepper/model/stepper_style.dart';
import 'package:gsstepper/GSStepper/widget/fixed_stepper.dart';

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
    } else {
      return Container();
    }
  }

  GSStepModel _findStepByIndex(int index) {
    return steps.elementAt(index);
  }

  _configureFirstStep() {
    _findStepByIndex(0).status = GSStepStatusEnum.active;
    _findStepByIndex(0).progress = 50;
  }

  goToStep({
    required GSStepStatusEnum currentStatus,
    required int nextIndex,
    double nextStepProgress = 50,
    double currentStepProgress = 100,
  }) {
    if (nextIndex >= 0) {
      if (nextIndex >= steps.length) {
        onComplete?.call();
      } else {
        GSStepModel currentStep = _findStepByIndex(currentIndex);
        GSStepModel nextStep = _findStepByIndex(nextIndex);

        _configureCurrentStep(
          currentStep,
          currentStatus,
          currentStepProgress,
        );
        _configureNextStep(
          nextStep,
          nextStep.status != GSStepStatusEnum.success ? 30 : nextStepProgress,
        );

        onNextStep(nextIndex);
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
      _scrollToNexStep(nextStep);
    }
  }

  _configureCurrentStep(
    GSStepModel currentStep,
    GSStepStatusEnum currentStatus,
    double currentStepProgress,
  ) {
    currentStep.status = currentStatus;
    currentStep.progress = currentStepProgress;
  }

  _scrollToNexStep(GSStepModel nextStep) {
    _controller.position.ensureVisible(
      nextStep.globalKey!.currentContext!.findRenderObject()!,
      alignment: 0.5, // Aligns the image in the middle.
      duration: const Duration(milliseconds: 300), // So it does not jump.
    );
  }
}
