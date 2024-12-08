import 'package:appointment_app/user.dart';

class Student extends User {
  Student(super.userId, super.name, super.password, super.department, this.schoolId);
  final String schoolId;

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'schoolId': schoolId,
      'name': name,
      'password': password,
      'department': department
    };
  }

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(json['userId'] ?? 0,json['schoolId'] ?? '', json['name'] ?? '',
        json['password'] ?? '', json['department'] ?? '');
  }
}
