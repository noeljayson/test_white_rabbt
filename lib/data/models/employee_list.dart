import 'dart:convert';

List<Employee> employeeFromMap(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromMap(x)));

String employeeToMap(List<Employee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Employee {
  Employee({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.profileImage,
    required this.address,
    required this.phone,
    required this.website,
  });

  int id;
  String name;
  String username;
  String email;
  String profileImage;

  Address address;
  String phone;
  String website;

  factory Employee.fromMap(Map<String, dynamic> json) => Employee(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        profileImage: json["profile_image"] ?? "",
        address: Address.fromJson(json["address"]),
        phone: json["phone"] ?? "",
        website: json["website"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "profile_image": profileImage ?? "",
        "address": address.toJson(),
        "phone": phone,
        "website": website,
      };
}

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });

  String street;
  String suite;
  String city;
  String zipcode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
      };
}
