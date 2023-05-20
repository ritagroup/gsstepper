import 'package:flutter/cupertino.dart';

class GSStepModel {
  GlobalKey? globalKey;

  Widget? icon;

  String? stepNumber;

  String? stepName;

  GSStepStatusEnum? status;

  double progress = 0;

  GSStepModel({
    this.globalKey,
    this.icon,
    this.stepNumber,
    this.stepName,
    this.status,
    this.progress = 0,
  });
}

enum GSStepStatusEnum { inActive, active, success, error }
