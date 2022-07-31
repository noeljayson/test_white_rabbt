import 'dart:convert';


import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:new_machine_test/config/server_addresses.dart';
import 'package:new_machine_test/data/models/employee_list.dart';

List<Employee> parseEmployee(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  var empl = list.map((model) => Employee.fromMap(model)).toList();
  return empl;
}

Future<List<Employee>> fetchEmployees() async {
  final response = await http.get(Uri.parse(ServerAddresses.employeelist));
  if (response.statusCode == 200) {
    return compute(parseEmployee, response.body);
  } else {
    throw Exception("Request Api error");
  }
}
