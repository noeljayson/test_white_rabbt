import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_machine_test/config/app_routes.dart';
import 'package:new_machine_test/presentation/bloc.dart';
import 'package:new_machine_test/presentation/event.dart';

import 'config/theme.dart';

void main() {
  runZonedGuarded(() {
    runApp(EmployeeApp());
  }, (dynamic error, dynamic stack) {
    print(error);
    print(stack);
  });
}

class EmployeeApp extends StatefulWidget {
  const EmployeeApp({Key? key}) : super(key: key);

  @override
  _EmployeeAppState createState() => _EmployeeAppState();
}

class _EmployeeAppState extends State<EmployeeApp> {
  final navigatorKey = NavKey.navKey;

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StartScreenBloc()..add(FetchEmployeeEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Employee App',
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: '/splashScreen',
        navigatorKey: NavKey.navKey,
        theme: ThemeData(
          fontFamily: AppFonts.mFont,
          primarySwatch: MaterialColor(0xff19aabb, AppColors().color),
        ),
        darkTheme: ThemeData(
          fontFamily: AppFonts.mFont,
          primarySwatch: MaterialColor(0xff19aabb, AppColors().color),
        ),
      ),
    );
  }
}
