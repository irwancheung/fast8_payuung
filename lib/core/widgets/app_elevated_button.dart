import 'package:fast8_payuung/exports.dart';

class AppElevatedButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final Function()? onPressed;

  const AppElevatedButton({
    super.key,
    this.text,
    this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.zero,
        elevation: 0,
        minimumSize: Size(double.infinity, 56.h),
        maximumSize: Size(double.infinity, 56.h),
        backgroundColor: const Color(0xfffbc73d),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      ),
      child: child ??
          Text(
            text ?? '',
            style: const TextStyle(color: Colors.white),
          ),
    );
  }
}
