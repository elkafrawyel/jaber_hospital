import 'package:flutter/material.dart';

import 'CustomModal.dart';

class ModalHelper {
  static void showModal({
    required BuildContext context,
    required String title,
    required Widget content,
    bool expand = false,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (context) => CustomModal(
        content: content,
        title: title,
      ),
    );
  }
}
