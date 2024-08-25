import 'package:fast8_payuung/exports.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AppDropdownMenu extends StatelessWidget {
  final String name;
  final bool isRequired;
  final String? label;
  final String? caption;
  final String? helper;
  final String? value;
  final List<DropdownMenuItem> items;
  final Function()? onTap;
  final String? Function(dynamic)? validator;

  const AppDropdownMenu({
    super.key,
    required this.name,
    this.isRequired = false,
    this.label,
    this.caption,
    this.helper,
    this.value,
    this.items = const [],
    this.onTap,
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

  static final _errorBorder = _border.copyWith(
    borderSide: const BorderSide(color: Colors.red),
  );

  static final _focusedErrorBorder = _border.copyWith(
    borderSide: const BorderSide(color: Colors.red, width: 2),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
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
        InkWell(
          onTap: onTap,
          child: FormBuilderDropdown(
            name: name,
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.transparent,
            ),
            initialValue: value,
            decoration: InputDecoration(
              suffixIcon: RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.grey,
                  size: 24.r,
                ),
              ),
              errorStyle: _errorStyle,
              errorMaxLines: 2,
              border: _border,
              enabledBorder: _border,
              focusedBorder: _border,
              errorBorder: _errorBorder,
              focusedErrorBorder: _focusedErrorBorder,
            ),
            items: items,
            validator: validator,
          ),
        ),
      ],
    );
  }
}
