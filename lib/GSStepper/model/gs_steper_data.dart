class GSStepperData {
  String? activeStatusName;

  String? inActiveStatusName;

  String? successStatusName;

  String? errorStatusName;

  GSStepperData({
    String? activeStatusName,
    String? inActiveStatusName,
    String? successStatusName,
    String? errorStatusName,
  })  : activeStatusName = activeStatusName ?? 'processing',
        inActiveStatusName = inActiveStatusName ?? 'pending',
        successStatusName = successStatusName ?? 'completed',
        errorStatusName = successStatusName ?? 'failure';
}
