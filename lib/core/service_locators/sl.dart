import 'package:fast8_payuung/core/handlers/exception_handler.dart';
import 'package:fast8_payuung/core/storages/local_storage.dart';
import 'package:fast8_payuung/data/data_sources/user_local_data_source_impl.dart';
import 'package:fast8_payuung/data/data_sources/voucher_local_data_source_impl.dart';
import 'package:fast8_payuung/data/repositories/user_repository_impl.dart';
import 'package:fast8_payuung/data/repositories/voucher_repository_impl.dart';
import 'package:fast8_payuung/domain/data_sources/user_local_data_source.dart';
import 'package:fast8_payuung/domain/data_sources/voucher_local_data_source.dart';
import 'package:fast8_payuung/domain/repositories/user_repository.dart';
import 'package:fast8_payuung/domain/repositories/voucher_repository.dart';
import 'package:fast8_payuung/domain/use_cases/get_user_details.dart';
import 'package:fast8_payuung/domain/use_cases/get_vouchers.dart';
import 'package:fast8_payuung/domain/use_cases/update_user_address.dart';
import 'package:fast8_payuung/domain/use_cases/update_user_address_employment_or_business.dart';
import 'package:fast8_payuung/domain/use_cases/update_user_profile.dart';
import 'package:fast8_payuung/global_vars.dart';
import 'package:fast8_payuung/presentation/bloc/user_bloc.dart';
import 'package:fast8_payuung/presentation/bloc/voucher_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initSl() async {
  //! Bloc
  appSl.registerFactory(
    () => UserBloc(
      getUserDetails: appSl(),
      updateUserProfile: appSl(),
      updateUserAddress: appSl(),
      updateUserEmploymentOrBusiness: appSl(),
    ),
  );

  appSl.registerFactory(() => VoucherBloc(getVouchers: appSl()));

  //! UseCases
  appSl.registerLazySingleton(() => GetUserDetails(appSl()));
  appSl.registerLazySingleton(() => UpdateUserProfile(appSl()));
  appSl.registerLazySingleton(() => UpdateUserAddress(appSl()));
  appSl.registerLazySingleton(() => UpdateUserEmploymentOrBusiness(appSl()));
  appSl.registerLazySingleton(() => GetVouchers(appSl()));

  //! Repository
  appSl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(appSl()));
  appSl.registerLazySingleton<VoucherRepository>(() => VoucherRepositoryImpl(appSl()));

  //! Data sources
  appSl.registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSourceImpl(appSl()));
  appSl.registerLazySingleton<VoucherLocalDataSource>(() => VoucherLocalDataSourceImpl(appSl()));

  //! Core
  appSl.registerLazySingleton(() => LocalStorage(appSl()));
  appSl.registerLazySingleton(() => const ExceptionHandler());

  final sharedPreferences = await SharedPreferences.getInstance();
  appSl.registerLazySingleton(() => sharedPreferences);
}
