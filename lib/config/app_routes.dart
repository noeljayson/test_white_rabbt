
import 'package:flutter/material.dart';
import 'package:new_machine_test/config/arguments_pass_file.dart';
import 'package:new_machine_test/home/EmployeeView.dart';
import 'package:new_machine_test/home/employee_screen.dart';
import 'package:new_machine_test/start_screens/Search.dart';
import 'package:new_machine_test/start_screens/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/splashScreen':
        return MaterialPageRoute(builder: (_) => StartScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => EmployeeScreen());

      case '/employeeview':
        Employeeargs arguments = args as Employeeargs;
        return MaterialPageRoute(
            builder: (_) => EmployeeView(
                arguments.image,
                arguments.name,
                arguments.username,
                arguments.email,
                arguments.street,
                arguments.suite,
                arguments.city,
                arguments.phone,
                arguments.website));

      case '/search':
        return MaterialPageRoute(builder: (_) => Search());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}

class NavKey {
  static final navKey = GlobalKey<NavigatorState>();
}
