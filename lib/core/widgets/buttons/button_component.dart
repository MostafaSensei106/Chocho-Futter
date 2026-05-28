import 'package:flutter/material.dart';
import 'package:m3e_collection/m3e_collection.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent({
    required this.label,
    required this.onPressed,
    super.key,
    this.style = ButtonM3EStyle.filled,
    this.size = ButtonM3ESize.md,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final ButtonM3EStyle style;
  final ButtonM3ESize size;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    }
    return ButtonM3E(
      onPressed: onPressed,
      style: style,
      size: size,
      label: Text(label),
    );
  }
}
