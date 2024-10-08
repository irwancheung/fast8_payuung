import 'package:fast8_payuung/core/handlers/exception_handler.dart';
import 'package:fast8_payuung/core/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final appSl = GetIt.instance;
final appScaffoldKey = GlobalKey<ScaffoldMessengerState>();
final appLogger = Logger();
const appException = ExceptionHandler();
