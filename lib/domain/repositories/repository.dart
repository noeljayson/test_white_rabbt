
import 'package:http/http.dart' as http;
import 'package:new_machine_test/data/data_sources/provider.dart';
import 'package:new_machine_test/data/models/employee_list.dart';

class Repository {
  Provider startScreenProviders = Provider();

  Future<List<Employee>> getEmployees() =>
      startScreenProviders.getEmployees();
}
