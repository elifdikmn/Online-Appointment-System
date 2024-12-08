// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:appointment_app/Professor.dart';
import 'package:appointment_app/app_constants.dart';
import 'package:flutter/material.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key, required this.professor});
  final Professor professor;
  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Your Appointment',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Constants.mainColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 40),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage(widget.professor.professorPictureUrl),
                    ),
                    SizedBox(width: 20),
                    Text(
                      widget.professor.name,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 2,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 40),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 40),
              TextButton(
                onPressed: () {
                  // Add functionality for button press
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: Text(
                  'Month 24, Year',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: IconButton(
                  onPressed: () {
                    // Add functionality for check button press
                  },
                  icon: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
              ),
              SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: IconButton(
                  onPressed: () {
                    // Add functionality for cross button press
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(10.0),
                ),
              ),
              SizedBox(width: 40),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              SizedBox(width: 40),
              Text(
                'WED, 10:00 AM',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 2,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 40),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Booking For: Another Person\n'
                    'Full Name: Ahmet Yılmaz\n'
                    'Age: 20\n'
                    'Gender: Male',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            height: 2,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 40),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              SizedBox(width: 40),
              Text(
                'Problem: The student\'s problem',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 150),
          Row(
            children: [
              SizedBox(width: 100),
              ElevatedButton(
                onPressed: () {
                  // Add functionality for Confirm Appointment button press
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: Text(
                  'Confirm Appointment',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
