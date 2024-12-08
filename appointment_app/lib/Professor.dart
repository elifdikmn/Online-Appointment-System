import 'package:appointment_app/user.dart';

class Professor extends User {
  Professor(
      super.userId,
      super.name,
      super.password,
      super.department,
      this.professorTitle,
      this.professorPictureUrl,
      this.isAvailable,
      this.email,
      this.office,
      this.classes);
  final String professorTitle;
  final bool isAvailable;
  final String email;
  final String office;
  final List<String> classes;
  final String professorPictureUrl;
}
