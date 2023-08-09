# GSStepper

GSStepper is a Flutter package that provides a custom stepper widget. It allows you to create a step-by-step process in your application, guiding users through multiple stages or tasks. The widget offers the flexibility to choose between scrolling or fixing the stepper based on your needs.

You can customize the stepper to fit your application's design by setting various properties such as colors, sizes, icons, and labels. Plus, you can easily track the user's progress by updating the status and progress values of each step.


## Installation   

To use this package, add `gsstepper` as a [dependency in your pubspec.yaml file](https://flutter.dev/docs/development/packages-and-plugins/using-packages).

```dart
flutter pub add gsstepper
```

```dart
dependencies:
  gsstepper: ^0.0.4
```

## Usage

Import the package into your Dart code:

```dart
import 'package:gsstepper/gsstepper.dart';
```

Create a `GSStepper` widget and pass a list of `GSStep` widgets to it:

```dart
stepper = GSStepper.scrollable(
                currentIndex: currentStep,
                style: StepperStyle(),
                steps: widget.stepperItemList,
                stepperData: GSStepperData(),
                stepWidth: 100,
                onComplete: () {
                  // on complete steps
                },
                onNextStep: (index) {
                  currentStep = index;
                  setState(() {});
                },
              ),
            )
```
![Alt Text](https://github.com/ritagroup/gsstepper/blob/main/step_done.gif)

Or you can use this way if you want fixed GSStepper:
```dart
stepper = GSStepper.fixed(
                currentIndex: currentStep,
                style: StepperStyle(),
                steps: widget.stepperItemList,
                stepperData: GSStepperData(),
                stepWidth: 100,
                onComplete: () {
                  // on complete steps
                },
                onNextStep: (index) {
                  currentStep = index;
                  setState(() {});
              },
            ),
          )
```

![Alt Text](https://github.com/ritagroup/gsstepper/blob/main/step_faild.gif)

## Customization

To create an instance of `GSStepModel`, you can pass the following parameters:

- `globalKey` (required): This is a `GlobalKey` used to identify the step.
- `icon` (optional): An `Icon` widget representing the icon for the step. 
- `status` (optional): An enum value of `GSStepStatusEnum` representing the status of the step. It has a default value of `inActive`.
- `progress` (optional): An integer representing the progress of the step. 
- `stepName` (optional): A string representing the name or description of the step. 
- `stepNumber` (optional): A string representing the step number.

Here's an example of how to create an instance of `GSStepModel`:

```dart
List<GSStepModel> stepperItemList = [
  GSStepModel(
    globalKey: GlobalKey(),
    icon: const Icon(Icons.store,
      color: Colors.white,
      size: 12,
    ),
    status: GSStepStatusEnum.inActive,
    progress: 0,
    stepName: 'User Information Step',
    stepNumber: 'Step 1',
  ),
  // Add more GSStepModel objects here...
];
```


## Conclusion

GSSTEPPER provides a simple and customizable way to create a step-by-step process in your Flutter application. It can be used for user onboarding, form submission, or any other multi-step tasks.

