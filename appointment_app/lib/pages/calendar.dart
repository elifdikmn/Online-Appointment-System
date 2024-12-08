import 'package:appointment_app/Professor.dart';
import 'package:appointment_app/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:appointment_app/pages/detail_page.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key, required this.professor});
  final Professor professor;
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Container(
        color: Colors.white, // Set the background color
        padding: EdgeInsets.all(10.0), // Add padding to the container
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Align items to the start of the column
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF164F94), // Use hex color
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              width: 200.0,
              child: Text(
                widget.professor.name,
                style: TextStyle(
                  fontFamily: 'League_Spartan',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFCAD6FF), // Use hex color
                borderRadius: BorderRadius.circular(18.0),
              ),
              margin: EdgeInsets.only(bottom: 13.0),
              padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDay('22', 'Mon', Colors.white, Color(0xFFA9BCFE)),
                  _buildDay('23', 'Tue', Colors.white, Color(0xFFA9BCFE)),
                  _buildDay('24', 'Wed', Colors.white,
                      Color.fromARGB(255, 90, 125, 249)),
                  _buildDay('25', 'Thu', Colors.white, Color(0xFFA9BCFE)),
                  _buildDay('26', 'Fri', Colors.white, Color(0xFFA9BCFE)),
                  _buildDay('27', 'Sat', Colors.white, Color(0xFFA9BCFE)),
                ],
              ),
            ),
            Text(
              'Available Time',
              style: TextStyle(
                fontFamily: 'League_Spartan',
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                color: Color(0xFF2260FF),
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFCAD6FF), // Use hex color
                borderRadius: BorderRadius.circular(18.0),
              ),
              margin: EdgeInsets.only(bottom: 13.0),
              padding: EdgeInsets.symmetric(vertical: 13.0, horizontal: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildTimeRow(['9:00 am', '9:30 am', '10:00 am', '11:00 am']),
                  _buildTimeRow(['12:00 m', '12:30 m', '1:00 pm', '1:30 pm']),
                  _buildTimeRow(['2:30 pm', '3:00 pm', '3:30 pm', '4:00 pm']),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              color: Color(0xFF2260FF),
              height: 1.0,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(bottom: 47.0),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFCAD6FF)), // Use hex color
                borderRadius: BorderRadius.circular(16.0),
              ),
              margin: EdgeInsets.only(bottom: 19.0),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20.0, 11.0, 20.0, 85.0),
              child: Text(
                'Notes: ...',
                style: TextStyle(
                  fontFamily: 'League_Spartan',
                  fontWeight: FontWeight.w300, // Use font-light
                  fontSize: 12.0,
                  color: Colors.black, // Capitalize text
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 22, 79, 148),
                  fixedSize: Constants.buttonSize,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        AppointmentPage(professor: widget.professor),
                  ));
                },
                child: Text(
                  'Save Changes',
                  style: TextStyle(
                    fontFamily: 'League_Spartan',
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDay(String day, String label, Color textColor, Color bgColor) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(18.0),
        border: Border.all(color: Color(0xFF2260FF)), // Use hex color
      ),
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              fontFamily: 'League_Spartan',
              fontWeight: FontWeight.w500,
              fontSize: 24.0,
              color: textColor,
            ),
          ),
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontFamily: 'League_Spartan',
              fontWeight: FontWeight.w300,
              fontSize: 12.0,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeRow(List<String> times) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: times.map((time) {
        return Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 106, 103, 103), // Use hex color
            borderRadius: BorderRadius.circular(18.0),
            border: Border.all(color: Color(0xFFFFFFFF)), // Use hex color
          ),
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
          child: Text(
            time,
            style: TextStyle(
              fontFamily: 'League_Spartan',
              fontWeight: FontWeight.w300,
              fontSize: 12.0,
              color: Color.fromARGB(255, 242, 243, 247), // Use hex color
            ),
          ),
        );
      }).toList(),
    );
  }
}