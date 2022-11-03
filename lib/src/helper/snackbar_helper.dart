import 'package:flutter/material.dart';
import 'package:flutter_transisi/src/constants/constants.dart';

void showSuccessSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: AppThemes.text1,
      ),
      backgroundColor: Colors.green,
    ),
  );
}

void showErrorSnackbar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: AppThemes.text1,
      ),
      backgroundColor: Colors.red,
    ),
  );
}
