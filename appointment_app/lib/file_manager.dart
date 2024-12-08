import 'dart:convert';

import 'package:flutter/services.dart';

class FileManager {
  static Future<bool> isUserRegistered(String schoolId, String password) async {
    try {
      final jsonString = await _loadJsonFromFile('assets/users.json');
      final jsonData = json.decode(jsonString);
      final List<dynamic> usersJson = jsonData['users'];
      final user = usersJson.firstWhere(
        (userJson) =>
            userJson['schoolId'] == schoolId &&
            userJson['password'] == password,
        orElse: () => null,
      );
      return user != null;
    } catch (e) {
      print("Error reading JSON file: $e");
      return false;
    }
  }

  static Future<String> _loadJsonFromFile(String path) async {
    return await rootBundle.loadString(path);
  }
}
