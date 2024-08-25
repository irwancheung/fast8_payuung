import 'package:easy_localization/easy_localization.dart';
import 'package:fast8_payuung/exports.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppDateTimePicker extends StatelessWidget {
  final String name;
  final bool isRequired;
  final String? label;
  final String? caption;
  final Widget? suffixIcon;
  final DateTime? initialValue;
  final InputType inputType;
  final DateFormat? format;
  final void Function(DateTime?)? onChanged;
  final String? Function(DateTime?)? validator;

  const AppDateTimePicker({
    super.key,
    this.isRequired = false,
    required this.name,
    this.label,
    this.caption,
    this.suffixIcon,
    this.initialValue,
    this.inputType = InputType.date,
    this.format,
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
        FormBuilderDateTimePicker(
          key: key,
          name: name,
          initialValue: initialValue,
          inputType: inputType,
          format: format ?? DateFormat('dd MMMM yyyy'),
          decoration: InputDecoration(
            errorStyle: _errorStyle,
            border: _border,
            enabledBorder: _border,
            focusedBorder: _focusedBorder,
            errorBorder: _errorBorder,
            focusedErrorBorder: _focusedErrorBorder,
            prefix: Padding(padding: EdgeInsets.only(left: 16.r)),
            suffixIcon: suffixIcon ??
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 8.r),
                  child: Icon(Icons.calendar_month, size: 20.r),
                ),
            contentPadding: EdgeInsets.symmetric(vertical: 16.r),
          ),
          onChanged: onChanged,
          validator: validator,
        ),
      ],
    );
  }
}
