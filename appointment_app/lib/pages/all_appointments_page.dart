import 'package:appointment_app/app_constants.dart';
import 'package:appointment_app/pages/calendar.dart';
import 'package:appointment_app/pages/professor_detail.dart';
import 'package:flutter/material.dart';
import 'package:appointment_app/Professor.dart';
import 'package:intl/intl.dart'; // Yeni ekledik

class AllAppointmentsPage extends StatefulWidget {
  const AllAppointmentsPage({Key? key}) : super(key: key);

  @override
  State<AllAppointmentsPage> createState() => _AllAppointmentsPageState();
}

class _AllAppointmentsPageState extends State<AllAppointmentsPage> {
  late int selectedDayIndex;
  List<String> days = ["Mon", "Tue", "Wed", "Thu", "Fri"];

  @override
  void initState() {
    super.initState();
    selectedDayIndex = 0; // Varsayılan olarak ilk günü seçili yap
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Constants.appBarTitle("All Appointments"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDaySelector(),
                  _buildDayAppointments(
                      Professor(
                          4,
                          "Doç. Dr. Mert Özkaya",
                          "",
                          "Computer Engineering",
                          "Akademisyen",
                          "assets/images/mert_ozkaya.jpg",
                          false,
                          "mozkaya@cse.yeditepe.edu.tr",
                          "A-410",
                          ["CSE232", "CSE323", "CSE348", "CSE524", "CSE574"]),
                      "10.00-10.30",
                      2),
                  _buildDayAppointments(
                      Professor(
                        1,
                        "Prof. Dr. Gürhan Küçük",
                        "",
                        "Computer Engineering",
                        "Bölüm Başkanı",
                        "assets/images/gurhan_kucuk.jpg",
                        true,
                        "gkucuk@cse.yeditepe.edu.tr",
                        "A-402",
                        ["CSE232", "CSE323", "CSE348", "CSE524", "CSE574"],
                      ),
                      "14.00-14.30",
                      4),
                  _buildDayAppointments(
                      Professor(
                          3,
                          "Dr. Öğr. Üyesi Esin Onbaşığlu",
                          "",
                          "Computer Engineering",
                          "Akademisyen",
                          "assets/images/esin_onbasioglu.jpg",
                          false,
                          "esin@cse.yeditepe.edu.tr",
                          "A-405",
                          ["CSE232", "CSE323", "CSE348", "CSE524", "CSE574"]),
                      "15.00-15.30",
                      1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDaySelector() {
    final now = DateTime.now();
    final startOfWeek =
        now.add(Duration(days: 1 - now.weekday)); // Bu haftanın başlangıcı

    return Container(
      decoration: BoxDecoration(
          borderRadius: Constants.calendarBorder, color: Constants.mainColor2),
      margin: EdgeInsets.only(bottom: 13),
      padding: EdgeInsets.symmetric(vertical: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(5, (index) {
          final day = startOfWeek.add(Duration(days: index));
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDayIndex = index;
              });
            },
            child: Container(
              width: 60,
              decoration: BoxDecoration(
                color: selectedDayIndex == index
                    ? Constants.mainColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(18.0),
                border: Border.all(color: Constants.mainColor),
              ),
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
              child: Column(
                children: [
                  Text(
                    '${DateFormat('d').format(day)}',
                    style: TextStyle(
                      fontFamily: 'League_Spartan',
                      fontWeight: FontWeight.w300,
                      fontSize: 24.0,
                      color: selectedDayIndex == index
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  Text(
                    days[index],
                    style: TextStyle(
                      fontFamily: 'League_Spartan',
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                      color: selectedDayIndex == index
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDayAppointments(Professor professor, String hour, int dayIndex) {
    // Seçilen güne göre randevu kartlarını oluşturun veya "No Appointments" yazısını gösterin
    final today = DateTime.now().add(Duration(days: dayIndex));
    final appointmentDay = today.weekday; // Randevunun gününü alın

    if (selectedDayIndex == appointmentDay) {
      return appointmentInfo(
        professor,
        hour, // Örnek saat bilgisi
        dayIndex,
      );
    } else {
      return SizedBox(); // Eğer seçilen gün ile randevunun günü eşleşmiyorsa boş bir widget döndürün
    }
  }

  Container appointmentInfo(Professor professor, String hour, int dayIndex) {
    final today = DateTime.now().add(Duration(days: dayIndex));
    return Container(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200.0, // Düğmelerin yüksekliğini azalttık
        child: GestureDetector(
          onTap: () {
            // Navigator ile detay sayfasına git
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProfessorProfile(professor: professor)),
            );
          },
          child: Card(
            color: Constants.mainColor2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          professor.professorPictureUrl,
                          width: 80,
                          height: 80,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              professor.name,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue[600],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              professor.professorTitle,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                10.0), // Köşeleri yuvarlamak için
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 16.0),
                          child: Center(
                            child: Text(
                              '${DateFormat('EEEE, d MMMM').format(today)}', // Tüm tarih bilgisi
                              style: TextStyle(
                                fontSize: 16,
                                color: Constants.mainColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8), // Boşluk ekledik
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                                10.0), // Köşeleri yuvarlamak için
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 16.0),
                          child: Center(
                            child: Text(
                              hour, // Saat bilgisi
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF2260FF),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator ile detail sayfasına git
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Calendar(
                                        professor: professor,
                                      )),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Constants
                                .mainColor, // Düğme rengini mavi olarak ayarla
                            minimumSize:
                                Size(0, 30), // Düğmenin minimum boyutunu ayarla
                          ),
                          child: Text("Edit",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Are you sure?"),
                                  content: Text(
                                      "Do you want to cancel this appointment?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        // Popup'ı kapat ve işlemi iptal et
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("No"),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        // Popup'ı kapat ve işlemi gerçekleştir
                                        setState(() {
                                          // İşlemi burada gerçekleştir (örneğin, randevuyu sil)
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Yes"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Constants
                                .mainColor, // Düğme rengini kırmızı olarak ayarla
                            minimumSize:
                                Size(0, 30), // Düğmenin minimum boyutunu ayarla
                          ),
                          child: Text("Cancel",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
