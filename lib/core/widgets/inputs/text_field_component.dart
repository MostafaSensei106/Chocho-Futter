import 'package:flutter/material.dart';
import '../../utils/theme/app_theme.dart';

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent({
    required this.label,
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onChanged,
    this.controller,
    this.initialValue,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType,
    this.errorText,
  });

  final String label;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? initialValue;
  final bool enabled;
  final bool readOnly;
  final TextInputType? keyboardType;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final cosmosTheme = Theme.of(context).extension<CosmosThemeExtension>()!;

    return TextFormField(
      controller: controller,
      initialValue: initialValue,
      onChanged: onChanged,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,
      keyboardType: keyboardType,
      style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        labelText: label,
        errorText: errorText,
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant.withValues(alpha: 0.6)),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Theme.of(context).colorScheme.onSurfaceVariant)
            : null,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: cosmosTheme.textFieldFillColor.withValues(alpha: 0.5),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: cosmosTheme.textFieldBorderColor, width: 0.8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: cosmosTheme.textFieldFocusedBorderColor, width: 1.2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2), width: 0.8),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.error, width: 0.8),
        ),
      ),
    );
  }
}
