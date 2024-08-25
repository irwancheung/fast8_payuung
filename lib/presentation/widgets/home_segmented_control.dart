import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:fast8_payuung/exports.dart';

class HomeSegmentedControl extends StatefulWidget {
  const HomeSegmentedControl({super.key});

  @override
  State<HomeSegmentedControl> createState() => _HomeSegmentedControlState();
}

class _HomeSegmentedControlState extends State<HomeSegmentedControl> {
  final _selectedTab = ValueNotifier<int>(1);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ValueListenableBuilder(
        valueListenable: _selectedTab,
        builder: (context, selectedTab, _) {
          return CustomSlidingSegmentedControl(
            children: {
              1: Text(
                'Payuung Pribadi',
                style: TextStyle(color: selectedTab == 1 ? Colors.white : Colors.grey),
              ),
              2: Text(
                'Payuung Karyawan',
                style: TextStyle(color: selectedTab == 2 ? Colors.white : Colors.grey),
              ),
            },
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(24),
            ),
            thumbDecoration: BoxDecoration(
              color: const Color(0xfffbc73d),
              borderRadius: BorderRadius.circular(24),
            ),
            onValueChanged: (val) {},
          );
        },
      ),
    );
  }
}
