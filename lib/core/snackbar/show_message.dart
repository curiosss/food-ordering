import 'package:flutter/material.dart';
import 'package:rokus/core/snackbar/home_context.dart';
import 'package:rokus/core/utils/dimens.dart';

enum MessageType {
  ddefault,
  error,
  success,
}

showSnackMessage(String message,
    {double bottomPadd = 0, MessageType? messageType}) {
  messageType ?? MessageType.ddefault;
  Color backColor = Colors.grey;
  switch (messageType) {
    case MessageType.error:
      backColor = Colors.red;
      break;
    case MessageType.success:
      backColor = Colors.green;
      break;
    default:
      return;
  }
  if (homeContext != null) {
    ScaffoldMessenger.of(homeContext!).removeCurrentSnackBar();
    ScaffoldMessenger.of(homeContext!).showSnackBar(
      SnackBar(
        // elevation: 3,
        elevation: 0,
        margin: EdgeInsets.only(
          bottom: 20 + bottomPadd,
          left: Dimens.gBorder,
          right: Dimens.gMargin,
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        // backgroundColor: Colors.red,
        duration: const Duration(milliseconds: 2000),
        padding: EdgeInsets.zero,
        content: Container(
          constraints: const BoxConstraints(maxHeight: 70),
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimens.sMargin,
              vertical: Dimens.hMargin,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: backColor,
            ),
            child: Text(
              message,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
