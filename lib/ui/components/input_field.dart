import 'package:flutter/material.dart';

class NeurogineInputField extends StatelessWidget {
  const NeurogineInputField({super.key, required this.child, this.errorText});

  final Widget child;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        child,
        if (errorText != null)
          Text(errorText!, style: const TextStyle(color: Colors.red)),
      ],
    );
  }
}
