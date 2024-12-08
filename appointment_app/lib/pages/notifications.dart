// ignore_for_file: prefer_const_constructors

import 'package:appointment_app/app_constants.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Constants.appBarTitle("Notifications")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Constants.notificationInfo("Notification 1", "Notification 1"),
            SizedBox(
              height: 8,
            ),
            Constants.notificationInfo("Notification 2", "Notification 2"),
            SizedBox(
              height: 8,
            ),
            Constants.notificationInfo("Notification 3", "Notification 3"),
            SizedBox(
              height: 8,
            ),
            Constants.notificationInfo("Notification 4", "Notification 4"),
          ],
        ),
      ),
    );
  }
}
