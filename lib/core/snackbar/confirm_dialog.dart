import 'package:flutter/material.dart';
import 'package:rokus/core/utils/dimens.dart';

Future<bool> confirm(
  BuildContext context, {
  String title = '',
  String content = '',
}) async {
  bool? res = await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimens.gBorder)),
      title: Text(title),
      content: Text(
        content.isEmpty
            // ? AppLocalizations.of(context).pushConfirmToDelete
            ? 'Push confirm to delete'
            : content,
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.sBorder),
            ),
            foregroundColor: Theme.of(context).colorScheme.secondary,
          ),
          child: const Text(
            // AppLocalizations.of(context).cancel,
            'Cancel',
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: const Text(
            // AppLocalizations.of(context).confirm,
            'Confirm',
          ),
        ),
      ],
    ),
  );
  if (res != null && res) {
    return true;
  }
  return false;
}
