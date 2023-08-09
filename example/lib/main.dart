import 'package:flutter/material.dart';
import 'package:gsstepper/GSStepper/model/gs_steper_data.dart';
import 'package:gsstepper/GSStepper/model/step_model.dart';
import 'package:gsstepper/GSStepper/model/stepper_style.dart';
import 'package:gsstepper/GSStepper/widget/stepper.dart';

void main() {
  runApp(const MainWidget());
}

class MainWidget extends StatelessWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        locale: const Locale('en', 'US'),
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('fa', 'IR'),
        ],
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue,
          textTheme: null,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.blueAccent, brightness: Brightness.light),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.blueAccent, brightness: Brightness.dark),
        ),
        home: const MainScreen());
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Fixed Stepper'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(builder: (BuildContext context) => FixedStepperSampleScreen()),
                    (route) => true, //if you want to disable back feature set to false
                  );
                },
              ),
              ElevatedButton(
                child: const Text('Scrollable Stepper'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(builder: (BuildContext context) => ScrollableStepperSampleScreen()),
                    (route) => true, //if you want to disable back feature set to false
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class FixedStepperSampleScreen extends StatefulWidget {
  FixedStepperSampleScreen({Key? key}) : super(key: key);

  List<GSStepModel> stepperItemList = [
    GSStepModel(
      globalKey: GlobalKey(),
      icon: const Icon(
        Icons.store,
        color: Colors.white,
        size: 12,
      ),
      status: GSStepStatusEnum.inActive,
      progress: 0,
      stepName: 'User Information Step',
      stepNumber: 'Step One',
    ),
    GSStepModel(
        globalKey: GlobalKey(),
        icon: const Icon(
          Icons.store,
          color: Colors.white,
          size: 12,
        ),
        status: GSStepStatusEnum.inActive,
        progress: 0,
        stepName: 'Information',
        stepNumber: 'Step two'),
    GSStepModel(
        globalKey: GlobalKey(),
        icon: const Icon(
          Icons.store,
          color: Colors.white,
          size: 12,
        ),
        status: GSStepStatusEnum.inActive,
        progress: 0,
        stepName: 'Shop Information',
        stepNumber: 'Step tree'),
    GSStepModel(
        globalKey: GlobalKey(),
        icon: const Icon(
          Icons.store,
          color: Colors.white,
          size: 12,
        ),
        status: GSStepStatusEnum.inActive,
        progress: 0,
        stepName: 'Photos',
        stepNumber: 'Step four'),
  ];

  @override
  State<FixedStepperSampleScreen> createState() => _FixedStepperSampleScreenState();
}

class _FixedStepperSampleScreenState extends State<FixedStepperSampleScreen> {
  int currentStep = 0;
  late GSStepper stepper;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: stepper = GSStepper.fixed(
                currentIndex: currentStep,
                style: StepperStyle(),
                steps: widget.stepperItemList,
                stepperData: GSStepperData(),
                onComplete: () {
                  // on complete steps
                },
                onNextStep: (index) {
                  currentStep = index;
                  setState(() {});
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: const Text('Previous'),
                      onPressed: () {
                        if (currentStep > 0) {
                          stepper.goToStep(
                            currentStatus: widget.stepperItemList[stepper.currentIndex].status!,
                            nextIndex: stepper.currentIndex - 1,
                            currentStepProgress: widget.stepperItemList[stepper.currentIndex].progress,
                            nextStepProgress: widget.stepperItemList[stepper.currentIndex - 1].progress,
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: const Text('Next'),
                      onPressed: () {
                        if (currentStep < widget.stepperItemList.length) {
                          stepper.goToStep(
                              currentStatus: GSStepStatusEnum.success,
                              nextIndex: stepper.currentIndex + 1,
                              currentStepProgress: 100,
                              nextStepProgress: 30);
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ScrollableStepperSampleScreen extends StatefulWidget {
  ScrollableStepperSampleScreen({Key? key}) : super(key: key);

  List<GSStepModel> stepperItemList = [
    GSStepModel(
      globalKey: GlobalKey(),
      icon: const Icon(
        Icons.store,
        color: Colors.white,
        size: 12,
      ),
      status: GSStepStatusEnum.inActive,
      progress: 0,
      stepName: 'User Information Step',
      stepNumber: 'Step One',
    ),
    GSStepModel(
        globalKey: GlobalKey(),
        icon: const Icon(
          Icons.store,
          color: Colors.white,
          size: 12,
        ),
        status: GSStepStatusEnum.inActive,
        progress: 0,
        stepName: 'Information',
        stepNumber: 'Step two'),
    GSStepModel(
        globalKey: GlobalKey(),
        icon: const Icon(
          Icons.store,
          color: Colors.white,
          size: 12,
        ),
        status: GSStepStatusEnum.inActive,
        progress: 0,
        stepName: 'Shop Information',
        stepNumber: 'Step tree'),
    GSStepModel(
        globalKey: GlobalKey(),
        icon: const Icon(
          Icons.store,
          color: Colors.white,
          size: 12,
        ),
        status: GSStepStatusEnum.inActive,
        progress: 0,
        stepName: 'Photos',
        stepNumber: 'Step four'),
    GSStepModel(
        globalKey: GlobalKey(),
        icon: const Icon(
          Icons.store,
          color: Colors.white,
          size: 12,
        ),
        status: GSStepStatusEnum.inActive,
        progress: 0,
        stepName: 'Photos',
        stepNumber: 'Step four'),
    GSStepModel(
        globalKey: GlobalKey(),
        icon: const Icon(
          Icons.store,
          color: Colors.white,
          size: 12,
        ),
        status: GSStepStatusEnum.inActive,
        progress: 0,
        stepName: 'Photos',
        stepNumber: 'Step four'),
    GSStepModel(
        globalKey: GlobalKey(),
        icon: const Icon(
          Icons.store,
          color: Colors.white,
          size: 12,
        ),
        status: GSStepStatusEnum.inActive,
        progress: 0,
        stepName: 'Photos',
        stepNumber: 'Step four'),
    GSStepModel(
        globalKey: GlobalKey(),
        icon: const Icon(
          Icons.store,
          color: Colors.white,
          size: 12,
        ),
        status: GSStepStatusEnum.inActive,
        progress: 0,
        stepName: 'Photos',
        stepNumber: 'Step four'),
    GSStepModel(
        globalKey: GlobalKey(),
        icon: const Icon(
          Icons.store,
          color: Colors.white,
          size: 12,
        ),
        status: GSStepStatusEnum.inActive,
        progress: 0,
        stepName: 'Photos',
        stepNumber: 'Step four'),
    GSStepModel(
        globalKey: GlobalKey(),
        icon: const Icon(
          Icons.store,
          color: Colors.white,
          size: 12,
        ),
        status: GSStepStatusEnum.inActive,
        progress: 0,
        stepName: 'Photos',
        stepNumber: 'Step four'),
  ];

  @override
  State<ScrollableStepperSampleScreen> createState() => _ScrollableStepperSampleScreenState();
}

class _ScrollableStepperSampleScreenState extends State<ScrollableStepperSampleScreen> {
  int currentStep = 0;
  late GSStepper stepper;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: stepper = GSStepper.scrollable(
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: const Text('Previous'),
                      onPressed: () {
                        if (currentStep > 0) {
                          stepper.goToStep(
                            currentStatus: widget.stepperItemList[stepper.currentIndex].status!,
                            nextIndex: stepper.currentIndex - 1,
                            currentStepProgress: widget.stepperItemList[stepper.currentIndex].progress,
                            nextStepProgress: widget.stepperItemList[stepper.currentIndex - 1].progress,
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      child: const Text('Next'),
                      onPressed: () {
                        if (currentStep < widget.stepperItemList.length) {
                          stepper.goToStep(
                              currentStatus: GSStepStatusEnum.success,
                              nextIndex: stepper.currentIndex + 1,
                              currentStepProgress: 100,
                              nextStepProgress: 30);
                        }
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
