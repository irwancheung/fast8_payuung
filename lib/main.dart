import 'package:fast8_payuung/core/service_locators/sl.dart';
import 'package:fast8_payuung/global_vars.dart';
import 'package:fast8_payuung/presentation/bloc/user_bloc.dart';
import 'package:fast8_payuung/presentation/bloc/voucher_bloc.dart';
import 'package:fast8_payuung/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Future.delayed(const Duration(seconds: 3));
  await initSl();
  FlutterNativeSplash.remove();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => appSl<UserBloc>()),
        BlocProvider(create: (context) => appSl<VoucherBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => child!,
        child: MaterialApp(
          title: 'Fast8 Payuung',
          scaffoldMessengerKey: appScaffoldKey,
          theme: ThemeData(
            fontFamily: GoogleFonts.inter().fontFamily,
            useMaterial3: true,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
