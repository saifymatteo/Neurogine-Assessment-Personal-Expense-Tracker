import 'package:flutter/material.dart';

import '../../lib.dart';

class NeurogineSubmitButton extends StatelessWidget {
  const NeurogineSubmitButton({super.key, this.focusNode, this.onTap});

  final FocusNode? focusNode;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return InkWell(
      focusNode: focusNode,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          l10n.buttonSubmit,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
