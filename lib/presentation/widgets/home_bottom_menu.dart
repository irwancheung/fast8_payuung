import 'package:fast8_payuung/core/widgets/grabber.dart';
import 'package:fast8_payuung/exports.dart';

class HomeBottomMenu extends StatefulWidget {
  const HomeBottomMenu({super.key});

  @override
  State<HomeBottomMenu> createState() => _HomeBottomMenuState();
}

class _HomeBottomMenuState extends State<HomeBottomMenu> {
  static const _minChildSize = 0.16;
  static const _maxChildSize = 0.4;

  final _selectedItem = ValueNotifier<int>(0);
  final _sheetPosition = ValueNotifier<double>(0.25);
  final _dragSensitivity = 300;

  final _menuItems = <Map<String, IconData>>[
    {'Beranda': Icons.home_filled},
    {'Cari': Icons.search},
    {'Keranjang': Icons.shopping_cart},
    {'Daftar Transaksi': Icons.inventory},
    {'Voucher Saya': Icons.airplane_ticket},
    {'Alamat Penginapan': Icons.place},
    {'Daftar Teman': Icons.group},
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _sheetPosition,
      builder: (BuildContext context, double value, Widget? child) {
        return DraggableScrollableSheet(
          minChildSize: _minChildSize,
          maxChildSize: _maxChildSize,
          initialChildSize: _minChildSize,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                border: Border.fromBorderSide(BorderSide(color: Colors.grey.shade300)),
              ),
              child: Column(
                children: <Widget>[
                  Grabber(
                    isExpanded: value == _maxChildSize,
                    onTap: () {
                      switch (value) {
                        case _minChildSize:
                          _sheetPosition.value = _maxChildSize;
                        case _maxChildSize:
                          _sheetPosition.value = _minChildSize;
                      }
                    },
                    onVerticalDragUpdate: (DragUpdateDetails details) {
                      _sheetPosition.value -= details.delta.dy / _dragSensitivity;
                      if (_sheetPosition.value < _minChildSize) _sheetPosition.value = _minChildSize;
                      if (_sheetPosition.value > _maxChildSize) _sheetPosition.value = _maxChildSize;
                    },
                    onVerticalDragEnd: (DragEndDetails details) {
                      if (_sheetPosition.value < _maxChildSize) _sheetPosition.value = _minChildSize;
                      if (_sheetPosition.value >= _maxChildSize) _sheetPosition.value = _maxChildSize;
                    },
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: ValueListenableBuilder(
                      valueListenable: _selectedItem,
                      builder: (BuildContext context, int value, Widget? child) {
                        final menuItemWidgets = <Widget>[];

                        for (int index = 0; index < _menuItems.length; index++) {
                          menuItemWidgets.add(
                            _buildMenuItem(
                              icon: _menuItems[index].values.first,
                              title: _menuItems[index].keys.first,
                              isSelected: value == index,
                              onTap: () => _selectedItem.value = index,
                            ),
                          );
                        }

                        return GridView.count(
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                          crossAxisCount: 3,
                          childAspectRatio: 1.5,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: menuItemWidgets,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required bool isSelected,
    required Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: 32.r,
            color: isSelected ? const Color(0xfffbc73d) : null,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 11.sp,
              color: isSelected ? const Color(0xfffbc73d) : null,
            ),
          ),
        ],
      ),
    );
  }
}
