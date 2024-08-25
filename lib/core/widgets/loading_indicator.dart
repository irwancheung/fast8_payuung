import 'package:fast8_payuung/exports.dart';

class LoadingIndicator extends StatelessWidget {
  final double? size;
  final double? strokeWidth;
  const LoadingIndicator({super.key, this.size, this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth ?? 4.r,
      ),
    );
  }
}
