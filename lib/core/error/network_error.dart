import 'package:dio/dio.dart';
import 'package:rokus/core/snackbar/show_message.dart';

final Map<String, dynamic> errorMessages = {
  'tryAgain': {
    'tk': 'Täzeden synanyşyp görüň',
    'ru': 'Попробуйте еще раз',
    'en': 'Try again',
  },
};

showErrorMessageFromRes(Response? response) {
  String? errorMsg = response?.data['message'];
  if (errorMsg != null) {
    showSnackMessage(
      errorMsg,
      messageType: MessageType.error,
    );
  }
}
