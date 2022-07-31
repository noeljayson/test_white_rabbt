import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_machine_test/config/arguments_pass_file.dart';
import 'package:new_machine_test/data/models/employee_list.dart';
import 'package:new_machine_test/network.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Employee> _employees = <Employee>[];
  List<Employee> _employeesdisplay = <Employee>[];

  bool _isLoading = true;

  @override
  void initState() {
    fetchEmployees().then((value) {
      setState(() {
        _isLoading = false;
        _employees.addAll(value);
        _employeesdisplay = _employees;
      });
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Search employees"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  decoration:
                      const InputDecoration(hintText: 'Search employees'),
                  onChanged: (text) {
                    setState(() {
                      _employeesdisplay = _employees.where((_employees) {
                        var employeeTitle = _employees.name.toLowerCase();
                        return employeeTitle.contains(text);


                      }).toList();
                    });
                  },
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _employeesdisplay.length,
                  itemBuilder: (context, index) {
                    return _listitem(index);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  _listitem(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/employeeview',
              arguments: Employeeargs(
                  _employeesdisplay[index].profileImage,
                  _employeesdisplay[index].name,
                  _employeesdisplay[index].username.toString(),
                  _employeesdisplay[index].email,
                  _employeesdisplay[index].address.street.toString(),
                  _employeesdisplay[index].address.suite.toString(),
                  _employeesdisplay[index].address.city.toString(),
                  _employeesdisplay[index].phone.toString(),
                  _employeesdisplay[index].website.toString()));
        },
        child: ListTile(
          title: Text(
            _employeesdisplay[index].name,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            _employeesdisplay[index].email,
            style: GoogleFonts.poppins(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
          leading: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                    _employeesdisplay[index].profileImage ?? ""),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
