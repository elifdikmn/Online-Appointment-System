// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:appointment_app/Professor.dart';
import 'package:appointment_app/app_constants.dart';
import 'package:appointment_app/drawer_menu.dart';
import 'package:appointment_app/pages/professor_detail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerMenu(),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Constants.mainColor, // Change the icon color here
            size: 32, // Change the icon size here
          ),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: Constants.appBarTitle("Computer Engineering"),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          children: [
            profInfo(Professor(1, "Prof. Dr. Gürhan Küçük", "", "Computer Engineering", "Bölüm Başkanı", "assets/images/gurhan_kucuk.jpg", true, "gkucuk@cse.yeditepe.edu.tr", "A-402", ["CSE232", "CSE323", "CSE348", "CSE524", "CSE574"])),
            SizedBox(
              height: 12,
            ),
             profInfo(Professor(2, "Dr. Öğr. Üyesi Mustafa B. Mutluoğlu", "", "Computer Engineering", "Bölüm Başkan Yardımcısı", "assets/images/mustafa_bulent_mutluoglu.jpg", true, "mmutlu@cse.yeditepe.edu.tr", "A-411", ["CSE232", "CSE323", "CSE348", "CSE524", "CSE574"])),
             SizedBox(height: 12,),
             profInfo(Professor(3, "Dr. Öğr. Üyesi Esin Onbaşığlu", "", "Computer Engineering", "Akademisyen", "assets/images/esin_onbasioglu.jpg", false, "esin@cse.yeditepe.edu.tr", "A-405", ["CSE232", "CSE323", "CSE348", "CSE524", "CSE574"])),
             SizedBox(height: 12,),
             profInfo(Professor(4, "Doç. Dr. Mert Özkaya", "", "Computer Engineering", "Akademisyen", "assets/images/mert_ozkaya.jpg", false, "mozkaya@cse.yeditepe.edu.tr", "A-410", ["CSE232", "CSE323", "CSE348", "CSE524", "CSE574"])),
          ],
        )),
      ),
    );
  }

  Container profInfo(Professor professor) {
    return Container(
      height: 180, // Adjust the height as needed
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfessorProfile(professor: professor)));
        },
        child: Card(
          color: Colors.blue[100],
          shape: RoundedRectangleBorder(
            borderRadius: Constants.profCardBorder,
          ),
          child: Row(
            children: [
              SizedBox(width: 16), // Add some space to the left
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: ClipRRect(
                  borderRadius: Constants.profCardBorder,
                  child: Image.asset(
                    professor.professorPictureUrl,
                    fit: BoxFit.cover,
                    width: 100,
                    height: double
                        .infinity, // Make the image fill the height of the container
                  ),
                ),
              ),
              SizedBox(width: 16), // Add some space between the image and text
              Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 250,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: Constants.profCardBorder),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  professor.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.blue[600],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Text(
                                  professor.professorTitle,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: Constants.profCardBorder,
                            color: professor.isAvailable ? Colors.green : Colors.red,
                          ),
                          child: Center(
                            child: Text(
                              professor.isAvailable
                                  ? "Currently Available"
                                  : "Currently Not Available",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
