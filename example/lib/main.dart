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
        home:  FixedStepperSampleScreen());
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
              child: stepper = GSStepper.simple(
                currentIndex: currentStep,
                style: StepperStyle(),
                steps: widget.stepperItemList,
                stepperData: GSStepperData(),
                stepWidth: 50,
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
                            currentStatus: GSStepStatusEnum.inActive,
                            newIndex: stepper.currentIndex - 1,
                            oldStepProgress: 0,
                            newStepProgress:100

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
                              newIndex: stepper.currentIndex + 1,
                              oldStepProgress: 100,
                              newStepProgress: 0);
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
