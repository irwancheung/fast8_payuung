import 'package:fast8_payuung/exports.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppTextField extends StatelessWidget {
  final String name;
  final bool isRequired;

  final String? initialValue;
  final bool autofocus;
  final String? label;
  final String? caption;
  final String hintText;
  final String? errorText;
  final bool obscureText;
  final bool enabled;
  final Color fillColor;
  final bool showCounter;
  final int maxLength;
  final TextInputType? keyboardType;
  final int minLines;
  final int maxLines;
  final List<TextInputFormatter> inputFormatters;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.name,
    this.isRequired = false,
    this.initialValue,
    this.autofocus = false,
    this.label,
    this.caption,
    this.hintText = '',
    this.errorText,
    this.obscureText = false,
    this.enabled = true,
    this.fillColor = const Color(0xfff3f4f6),
    this.showCounter = false,
    required this.maxLength,
    this.keyboardType,
    this.minLines = 1,
    this.maxLines = 1,
    this.inputFormatters = const [],
    this.prefix,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
  });

  static final _errorStyle = TextStyle(
    fontSize: 12.sp,
    color: Colors.red,
    fontWeight: FontWeight.w400,
  );

  static final _border = OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xffd1d5db)),
    borderRadius: BorderRadius.circular(8.r),
  );

  static final _focusedBorder = _border.copyWith(
    borderSide: const BorderSide(color: Colors.grey, width: 2),
  );

  static final _errorBorder = _border.copyWith(
    borderSide: const BorderSide(color: Colors.red),
  );

  static final _focusedErrorBorder = _border.copyWith(
    borderSide: const BorderSide(color: Colors.red, width: 2),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isRequired) Text('* ', style: _errorStyle),
              Text(label!),
            ],
          ),
          5.h.height,
        ],
        FormBuilderTextField(
          key: key,
          name: name,
          initialValue: initialValue,
          autofocus: autofocus,
          obscureText: obscureText,
          obscuringCharacter: '*',
          enabled: enabled,
          maxLength: maxLength,
          keyboardType: keyboardType,
          minLines: minLines,
          maxLines: maxLines,
          inputFormatters: inputFormatters,
          buildCounter: (context, {required currentLength, maxLength, required isFocused}) {
            return null;
          },
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: !enabled,
            hintText: hintText,
            errorText: errorText,
            errorStyle: _errorStyle,
            errorMaxLines: 2,
            border: _border,
            enabledBorder: _border,
            focusedBorder: _focusedBorder,
            errorBorder: _errorBorder,
            focusedErrorBorder: _focusedErrorBorder,
            prefix: prefixIcon == null
                ? Padding(
                    padding: EdgeInsets.only(left: 16.r),
                    child: prefix,
                  )
                : null,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.fromLTRB(0, 16.r, 16.r, 16.r),
          ),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
