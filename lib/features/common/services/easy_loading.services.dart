import 'package:flutter_easyloading/flutter_easyloading.dart';

class EasyLoadingHelper {
  static final EasyLoadingHelper instance = EasyLoadingHelper._internal();

  factory EasyLoadingHelper() {
    return instance;
  }

  EasyLoadingHelper._internal();

  void show(String message, {Duration duration = const Duration(seconds: 2)}) {
    EasyLoading.show(status: message, maskType: EasyLoadingMaskType.black);
  }

  void success(String message,
      {Duration duration = const Duration(milliseconds: 1200)}) {
    EasyLoading.showSuccess(message, duration: duration);
  }

  void dismiss() {
    EasyLoading.dismiss();
  }

  void error(String message, {Duration duration = const Duration(seconds: 2)}) {
    EasyLoading.showError(message,
        duration: duration, maskType: EasyLoadingMaskType.black);
  }
}
