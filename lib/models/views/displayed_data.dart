import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:internship2/widgets/bottom_circular_button.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class displayeddata extends StatelessWidget {
  displayeddata({
    super.key,
    required this.size,
    required this.date_open,
    required this.Location,
    required this.date_mature,
    required this.Account_No,
    required this.Member_Name,
    required this.Plan,
    required this.mode,
    required this.installment,
    required this.status,
    required this.Amount_Collected,
    required this.Amount_Remaining,
    required this.Monthly,
    required this.cif,
  });
  final String Member_Name;
  final String Plan;
  final String Account_No;
  final Timestamp date_open;
  final Timestamp date_mature;
  final String Location;
  final Size size;
  final String mode;
  final int installment;
  final String status;
  final Amount_Collected;
  final Amount_Remaining;
  final int Monthly;
  final String cif;
  @override
  Widget build(BuildContext context) {
    final dateo =
        DateTime.fromMillisecondsSinceEpoch(date_open.millisecondsSinceEpoch);
    final yearo = dateo.year;
    final montho = dateo.month;
    final dayo = dateo.day;
    final datem =
        DateTime.fromMillisecondsSinceEpoch(date_mature.millisecondsSinceEpoch);
    final yearm = datem.year;
    final monthm = datem.month;
    final daym = datem.day;
    DateTime now = DateTime.now();
    final monthFormat = DateFormat.MMMM();
    final yearFormat = DateFormat.y();

    DateTime dateTime = DateTime(DateTime.now().year, monthm);
    String monthName = DateFormat('MMMM').format(dateTime);

    final currentMonth = monthFormat.format(now);
    final currentYear = yearFormat.format(now);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 10, bottom: 10.0, left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    '$Member_Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    '$Account_No',
                    style: TextStyle(color: Color(0xffAF545F), fontSize: 13.0),
                  ),
                ],
              ),
              Container(
                width: size.width * 0.3,
                decoration: BoxDecoration(
                  color: Color(0xff29756F),
                  borderRadius: BorderRadius.all(
                    Radius.circular(40),
                  ),
                  border: Border.all(
                    width: 2,
                    color: Color(0xff29756F),
                    style: BorderStyle.solid,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Center(
                    child: Text(
                      '$monthName $currentYear',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 10, bottom: 10.0, left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'DOO',
                        style: TextStyle(
                          fontSize: 13.5,
                          color: Color(0xffAF545F),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Text('$yearo/$montho/$dayo')
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'DOM',
                        style: TextStyle(
                          fontSize: 13.5,
                          color: Color(0xffAF545F),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Text('$yearm/$monthm/$daym')
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 10, bottom: 10.0, left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'CIF',
                style: TextStyle(
                  fontSize: 13.5,
                  color: Color(0xffAF545F),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                width: size.width * 0.03,
              ),
              Text('$cif')
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 0, bottom: 10.0, left: 20.0, right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Monthly',
                        style: TextStyle(
                          fontSize: 13.5,
                          color: Color(0xffAF545F),
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        width: size.width * 0.03,
                      ),
                      Text('$Monthly/-'),
                      SizedBox(
                        width: size.width * 0.37,
                      ),
                      SizedBox(
                        child: Wrap(
                          children: [
                            Text(
                              'Installments',
                              style: TextStyle(
                                fontSize: 13.5,
                                color: Color(0xffAF545F),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        '$installment/60',
                        style: TextStyle(
                          fontSize: 13.5,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  circular_button(
                    onpressed: () {
                      print("hello");
                      String phoneNo = ""; // Nullable variable

                      FirebaseFirestore.instance
                          .collection('new_account')
                          .doc(Location)
                          .collection(Location)
                          .doc(Account_No)
                          .get()
                          .then((DocumentSnapshot<Map<String, dynamic>>
                              documentSnapshot) {
                        if (documentSnapshot.exists) {
                          var data = documentSnapshot.data();
                          if (data != null) {
                            phoneNo = data['Phone_No'];
                            print(phoneNo);

                            if (phoneNo.isNotEmpty) {
                              launchUrl(Uri.parse("tel:+91$phoneNo"));
                            } else {
                              print('Phone number is empty');
                            }
                          }
                        } else {
                          print('Document does not exist in the database');
                        }
                      }).catchError((error) {
                        print('Error retrieving document: $error');
                      });
                    },
                    size: 20,
                    icon: Image.asset('assets/Acc/IC2.png'),
                  ),
                  // circular_button(
                  //   size: 20,
                  //   icon: Image.asset('assets/Acc/IC4.png'),
                  // ),
                  circular_button(
                    onpressed: () {
                      print("hello");

                      FirebaseFirestore.instance
                          .collection('new_account')
                          .doc(Location)
                          .collection(Location)
                          .doc(Account_No)
                          .delete();
                    },
                    size: 20,
                    icon: Image.asset('assets/Acc/IC5.png'),
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(
          thickness: 0.7,
          height: 0.02,
        )
      ],
    );
  }
}
