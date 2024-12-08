import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Constants {
  static const mainColor = Color(0xFF145DA0);
  static const String titleText = "Akademik Randevu\nSistemi";

  static Text appBarTitle(String departmentName) {
    return Text(
      departmentName,
      style: TextStyle(fontSize: 24, color: mainColor),
    );
  }

  static final TextStyle titleStyle = TextStyle(
      color: Constants.mainColor,
      fontSize: 34,
      fontWeight: FontWeight.w900,
      fontStyle: FontStyle.italic);
  static final TextStyle loginStyle =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: mainColor);

  static final TextStyle buttonTextStyle =
      TextStyle(color: Colors.white, fontSize: 18);

  static final Size buttonSize = Size(350, 50);

  static final OutlineInputBorder textFormFielEnabledBorder =
      OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10));

  static final OutlineInputBorder textFormFieldFocusedBorder =
      OutlineInputBorder(
    borderSide: BorderSide(
        color: Colors.white), // Optional: Set border color when focused
    borderRadius: BorderRadius.circular(10),
  );

  static final OutlineInputBorder textFormFieldErrorBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(10));

  static final OutlineInputBorder textFormFieldFocusedErrorBorder =
      OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(10));

  static BorderRadius profCardBorder = BorderRadius.circular(20);

  static Container notificationInfo(
      String notificationTitle, String notificationSubtitle) {
    return Container(
      height: 80,
      child: Card(
        color: Colors.blue[100],
        shape: RoundedRectangleBorder(borderRadius: Constants.profCardBorder),
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(
              Icons.notifications_active_rounded,
              color: Constants.mainColor,
            ),
          ),
          title: Text(
            notificationTitle,
            style: TextStyle(fontSize: 18),
          ),
          subtitle: Text(notificationSubtitle),
        ),
      ),
    );
  }
}
