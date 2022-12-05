import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gs_stepper/gs_stepper/model/gs_steper_data.dart';
import 'package:gs_stepper/gs_stepper/model/step_model.dart';
import 'package:gs_stepper/gs_stepper/model/stepper_style.dart';
import 'package:gs_stepper/gs_stepper/widget/stepper.dart';

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
          backgroundColor: const Color(0xfff5f5f5),
          textTheme: null,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          backgroundColor: const Color(0xff3c3c3c),
        ),
        home: SampleWidget());
  }
}

class SampleWidget extends StatefulWidget {
  SampleWidget({Key? key}) : super(key: key);

  List<GSStepModel> stepperItemList = [
    GSStepModel(
      globalKey: GlobalKey(),
      icon: SvgPicture.asset(
        'assets/ic_user.svg',
        color: Colors.white,
        height: 12,
        width: 12,
      ),
      status: GSStepStatusEnum.inActive,
      progress: 0,
      stepName: 'User Information Step',
      stepNumber: 'Step One',
    ),
    GSStepModel(
        globalKey: GlobalKey(),
        icon: SvgPicture.asset(
          'assets/ic_information.svg',
          color: Colors.white,
          height: 12,
          width: 12,
        ),
        status: GSStepStatusEnum.inActive,
        progress: 0,
        stepName: 'Information',
        stepNumber: 'Step two'),
    GSStepModel(
        globalKey: GlobalKey(),
        icon: SvgPicture.asset(
          'assets/ic_location.svg',
          color: Colors.white,
          height: 5,
          width: 5,
        ),
        status: GSStepStatusEnum.inActive,
        progress: 0,
        stepName: 'Shop Information',
        stepNumber: 'Step tree'),
    GSStepModel(
        globalKey: GlobalKey(),
        icon: SvgPicture.asset(
          'assets/ic_store.svg',
          color: Colors.white,
          height: 12,
          width: 12,
        ),
        status: GSStepStatusEnum.inActive,
        progress: 0,
        stepName: 'Photos',
        stepNumber: 'Step four'),
  ];

  @override
  State<SampleWidget> createState() => _SampleWidgetState();
}

class _SampleWidgetState extends State<SampleWidget> {
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
