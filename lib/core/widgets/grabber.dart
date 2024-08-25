import 'package:fast8_payuung/exports.dart';

class Grabber extends StatelessWidget {
  final bool isExpanded;
  final Function() onTap;
  final ValueChanged<DragUpdateDetails> onVerticalDragUpdate;
  final ValueChanged<DragEndDetails> onVerticalDragEnd;

  const Grabber({
    super.key,
    required this.isExpanded,
    required this.onTap,
    required this.onVerticalDragUpdate,
    required this.onVerticalDragEnd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      child: Container(
        height: 30.r,
        width: 120.r,
        color: Colors.white,
        alignment: Alignment.topCenter,
        child: Icon(
          isExpanded ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up,
          size: 32.r,
          color: Colors.grey,
        ),
      ),
    );
  }
}
