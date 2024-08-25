import 'package:fast8_payuung/domain/entities/voucher.dart';
import 'package:fast8_payuung/domain/use_cases/get_vouchers.dart';
import 'package:fast8_payuung/exports.dart';
import 'package:fast8_payuung/presentation/bloc/user_bloc.dart';
import 'package:fast8_payuung/presentation/bloc/voucher_bloc.dart';
import 'package:fast8_payuung/presentation/widgets/home_app_bar.dart';
import 'package:fast8_payuung/presentation/widgets/home_bottom_menu.dart';
import 'package:fast8_payuung/presentation/widgets/home_segmented_control.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, VouchersSortBy> _sortByOptions = {
    'Terpopuler': VouchersSortBy.popularity,
    'A to Z': VouchersSortBy.nameAsc,
    'Z to A': VouchersSortBy.nameDesc,
    'Harga Terendah': VouchersSortBy.priceAsc,
    'Harga Tertinggi': VouchersSortBy.priceDesc,
  };

  List<Voucher> _vouchers = [];
  final _sortBy = ValueNotifier<VouchersSortBy>(VouchersSortBy.popularity);

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(const GetUserDetailsEvent());

    _getVouchers(_sortBy.value);
  }

  void _getVouchers(VouchersSortBy sortBy) {
    context.read<VoucherBloc>().add(GetVouchersEvent(GetVouchersParams(sortBy: sortBy)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffbc73d),
      appBar: const HomeAppBar(),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
            child: RefreshIndicator(
              onRefresh: () async => _getVouchers(_sortBy.value),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.fromLTRB(20.r, 16.r, 20.r, 60.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeSegmentedControl(),
                    16.h.height,
                    ..._buildFinanceProductSection(),
                    ..._buildCategorySection(),
                    ..._buildVoucherSection(),
                  ],
                ),
              ),
            ),
          ),
          const HomeBottomMenu(),
        ],
      ),
    );
  }

  List<Widget> _buildVoucherSection() {
    return [
      _buildSectionHeader(
        title: 'Explore Wellness',
        additionalWidget: Container(
          height: 25.r,
          padding: EdgeInsets.symmetric(horizontal: 8.r),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: ValueListenableBuilder(
            valueListenable: _sortBy,
            builder: (BuildContext context, VouchersSortBy value, Widget? child) {
              return DropdownButton<VouchersSortBy>(
                underline: shrinkBox,
                value: value,
                items: [
                  ..._sortByOptions.entries.map(
                    (e) => DropdownMenuItem(
                      value: e.value,
                      child: Text(
                        e.key,
                        style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
                onChanged: (val) {
                  if (val != null) {
                    _sortBy.value = val;
                    _getVouchers(val);
                  }
                },
              );
            },
          ),
        ),
      ),
      16.h.height,
      BlocBuilder<VoucherBloc, VoucherState>(
        builder: (context, state) {
          if (state is GetVouchersState && state.isLoaded) {
            _vouchers = state.vouchers!;
          }

          if (_vouchers.isEmpty) {
            return Container(
              height: 100,
              alignment: Alignment.center,
              child: const Text('Tidak ada voucher'),
            );
          }

          return GridView.count(
            crossAxisSpacing: 30,
            mainAxisSpacing: 30,
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ..._vouchers.map(
                (e) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        e.imageUrl,
                        height: 100.r,
                      ),
                    ),
                    8.h.height,
                    Text(
                      e.name,
                      style: TextStyle(fontSize: 11.sp),
                    ),
                    8.h.height,
                    if (e.discountPercentage > 0)
                      Row(
                        children: [
                          Text(
                            e.amount.toCurrency(),
                            style: TextStyle(
                              fontSize: 11.sp,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          8.w.width,
                          Text(
                            '${e.discountPercentage}% OFF',
                            style: TextStyle(fontSize: 11.sp, color: Colors.red),
                          ),
                        ],
                      ),
                    Text(
                      e.price.toCurrency(),
                      style: TextStyle(fontSize: 11.sp),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ];
  }

  List<Widget> _buildFinanceProductSection() {
    final menu = {
      'urun': 'Urun',
      'haji': 'Pembiayaan Porsi Haji',
      'financial': 'Financial Check Up',
      'mobil': 'Asuransi Mobil',
      'properti': 'Asuransi Properti',
    };

    return [
      _buildSectionHeader(title: 'Produk Keuangan'),
      16.h.height,
      GridView.count(
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ...menu.entries.map(
            (e) => _buildGridIcon(
              iconName: e.key,
              title: e.value,
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> _buildCategorySection() {
    final menu = {
      'hobi': 'Hobi',
      'merchandise': 'Merchandise',
      'sehat': 'Gaya Hidup Sehat',
      'rohani': 'Konseling & Rohani',
      'self_development': 'Self Development',
      'rencana_keuangan': 'Perencanaan Keuangan',
      'medis': 'Konsultasi Medis',
      'semua': 'Lihat Semua',
    };

    return [
      _buildSectionHeader(
        title: 'Kategori Pilihan',
        additionalWidget: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 4.r),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              const Text('Wishlist '),
              CircleAvatar(
                maxRadius: 10.r,
                backgroundColor: const Color(0xfffbc73d),
                child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      16.h.height,
      GridView.count(
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ...menu.entries.map(
            (e) => _buildGridIcon(
              iconName: e.key,
              title: e.value,
            ),
          ),
        ],
      ),
    ];
  }

  Widget _buildSectionHeader({
    required String title,
    Widget? additionalWidget,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        spacer,
        additionalWidget ?? shrinkBox,
      ],
    );
  }

  Widget _buildGridIcon({
    required String iconName,
    required String title,
  }) {
    return Column(
      children: [
        SvgPicture.asset('assets/icons/$iconName.svg'),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 11.sp),
        ),
      ],
    );
  }
}
