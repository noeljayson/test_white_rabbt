import 'dart:convert';
import 'dart:io';


import 'package:new_machine_test/config/server_addresses.dart';
import 'package:new_machine_test/data/models/employee_list.dart';
import 'package:new_machine_test/domain/entites/RestAPI.dart';
import 'package:new_machine_test/domain/entites/app_exceptions.dart';
import 'package:path_provider/path_provider.dart';

class Provider {
  /// Employee list
  Future<List<Employee>> getEmployees() async {
    String fileName = "userdata.json";

    var dir = await getTemporaryDirectory();

    File file = new File(dir.path + "/" + fileName);
    if (file.existsSync()) {
      print("Loading from cache");
      var jsonData = file.readAsStringSync();

      /// for offline caching in case of apis in list type
      List<Employee> response = List<Employee>.from(
          json.decode(jsonData).map((x) => Employee.fromMap(x)));
      return response;
    } else {
      try {
        print("Loading from api");
        var res = await RestAPI().post(ServerAddresses.employeelist);

        file.writeAsStringSync(res, flush: true, mode: FileMode.write);

        print(res);
        return employeeFromMap(res);
      } on RestException catch (e) {
        throw e.message;
      }
    }
  }
}
