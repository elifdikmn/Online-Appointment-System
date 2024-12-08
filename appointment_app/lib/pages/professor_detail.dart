import 'package:appointment_app/Professor.dart';
import 'package:appointment_app/pages/calendar.dart';
import 'package:appointment_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfessorProfile extends StatefulWidget {
  const ProfessorProfile({super.key, required this.professor});
  final Professor professor;

  @override
  State<ProfessorProfile> createState() => _ProfessorProfileState();
}

class _ProfessorProfileState extends State<ProfessorProfile> {
  bool isMeetingRequested = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Professor Profile',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 20, 93, 160)),
        ),
        //leading: IconButton(
         // icon: Icon(Icons.arrow_back),
         // onPressed: () {
         //   Navigator.of(context).pop(MaterialPageRoute(
         //     builder: (context) => HomePage(),
         //   ));
         // },
        ),
      
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.only(bottom: 450.0, top: 350.0),
            padding: EdgeInsets.symmetric(vertical: 200.0, horizontal: 200.0),
          ),
      

          // Center the remaining content of the body
          Positioned(
            top: -170,
            left: 0,
            right: 0,
            bottom: -180,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      margin: EdgeInsets.only(bottom: 0.0, top: 20.0),
                      padding:
                          EdgeInsets.symmetric(vertical: 15.0, horizontal: .0),

                      // Space after avatar
                      child: Text(
                        widget.professor.name,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 20, 93, 160)),
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[100], // Use hex color
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    margin: EdgeInsets.only(bottom: 5.0),
                    padding:
                        EdgeInsets.symmetric(vertical: 40.0, horizontal: 0),
                    child: Text(
                      '  E-mail: ${widget.professor.email}\n\n'
                      '  Office: ${widget.professor.office}\n\n'
                      '  Classes: ${widget.professor.classes.join(', ')}\n',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Add functionality for Request Instant Meeting button
                              setState(() {
                                isMeetingRequested = !isMeetingRequested;
                              });
                            },

                            child: Text(
                              isMeetingRequested
                                  ? 'Cancel Meeting Request'
                                  : 'Request Instant Meeting',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isMeetingRequested
                                  ? Colors.red
                                  : Color.fromARGB(255, 20, 93, 160),
                            ), // Set button background color to blue
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          // Add functionality for Currently Available button
                          // For example: Change the status to "Available"
                        },
                        child: Text(
                          widget.professor.isAvailable
                              ? 'Currently Available'
                              : 'Currently Not Available',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: widget.professor.isAvailable
                              ? Colors.green
                              : Colors
                                  .red, // Change button color based on availability
                        ),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                Calendar(professor: widget.professor),
                          ));
                        },
                        child: Text(
                          'Weekly Schedule',
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 20, 93, 160),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Position the CircleAvatar on top center
          Positioned(
            top: 20.0, // Adjust top padding as needed
            left: MediaQuery.of(context).size.width / 2 -
                75, // Center horizontally
            child: Container(
              width: 150,
              height: 150,
              child: CircleAvatar(
                  backgroundImage:
                      AssetImage(widget.professor.professorPictureUrl)),
            ),
          ),
        ],
      ),
    );
  }
}
