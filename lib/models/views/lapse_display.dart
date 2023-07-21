import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:internship2/widgets/button.dart';
import 'package:internship2/widgets/bottom_circular_button.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:url_launcher/url_launcher.dart';

class lapse_data extends StatefulWidget {
  const lapse_data({
    super.key,
    required this.size,
    required this.date_open,
    required this.date_mature,
    required this.Account_No,
    required this.Member_Name,
    required this.Plan,
    required this.mode,
    required this.installment,
    required this.status,
    required this.Location,
    required this.Amount_Collected,
    required this.Amount_Remaining,
    required this.Monthly,
  });
  final String Member_Name;
  final String Plan;
  final String Account_No;
  final Timestamp date_open;
  final Timestamp date_mature;
  final Size size;
  final String mode;
  final int installment;
  final String status;
  final String Location;
  final Amount_Collected;
  final Amount_Remaining;
  final int Monthly;
  @override
  State<lapse_data> createState() => _lapse_dataState(
        size: size,
        Member_Name: Member_Name,
        Plan: Plan,
        Account_No: Account_No,
        date_mature: date_mature,
        date_open: date_open,
        mode: mode,
        installment: installment,
        status: status,
        Location: Location,
        Amount_Collected: Amount_Collected,
        Amount_Remaining: Amount_Remaining,
        Monthly: Monthly,
      );
}

class _lapse_dataState extends State<lapse_data> {
  _lapse_dataState({
    required this.size,
    required this.date_open,
    required this.date_mature,
    required this.Account_No,
    required this.Member_Name,
    required this.Plan,
    required this.mode,
    required this.installment,
    required this.status,
    required this.Location,
    required this.Amount_Collected,
    required this.Amount_Remaining,
    required this.Monthly,
  });
  String _toggleValue2 = 'cash';
  bool _toggleValue1 = false;
  final String Member_Name;
  final String Plan;
  final String Account_No;
  final Timestamp date_open;
  final Timestamp date_mature;
  final Size size;
  final Amount_Collected;
  final Amount_Remaining;
  int Monthly;
  String mode;
  int installment;
  String status;
  late int money = 0;
  final String Location;
  Color colour = Color(0xffD83F52);
  // String _toggleValue2 = 'cash';
  // bool _toggleValue1 = false;
  final _firestone = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
    if (now.day == 01) {
      status = 'Due';
      colour = Color(0xffD83F52);
      setState(() {});
    }
    int Daily = (Monthly / 30).floor();
    return Flexible(
        fit: FlexFit.tight,
        child: Container(
          child: Column(
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
                          style: TextStyle(
                              color: Color(0xffAF545F), fontSize: 13.0),
                        ),
                      ],
                    ),
                    button(
                        size: widget.size.width * 0.3,
                        text: 'Due',
                        color: Color(0xffD83F52))
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
                              'DOO',
                              style: TextStyle(
                                fontSize: 13.5,
                                color: Color(0xffAF545F),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              width: widget.size.width * 0.03,
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
                              width: widget.size.width * 0.03,
                            ),
                            Text('$yearm/$monthm/$daym')
                          ],
                        )
                      ],
                    ),
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
                              width: widget.size.width * 0.03,
                            ),
                            Text('$Monthly/-'),
                            SizedBox(
                              width: widget.size.width * 0.35,
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
                              width: widget.size.width * 0.01,
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
                            // Text(
                            //   '4/12',
                            //   style: TextStyle(
                            //     fontSize: 13.5,
                            //     color: Color(0xffAF545F),
                            //     fontWeight: FontWeight.w500,
                            //   ),
                            //   textAlign: TextAlign.left,
                            // ),
                          ],
                        ),
                      ],
                    ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Container(
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           IconButton(
                    //               onPressed: () {},
                    //               icon: Icon(
                    //                 Icons.remove,
                    //                 size: size.width * 0.05,
                    //               )),
                    //           Text(
                    //             "100",
                    //             style: TextStyle(
                    //               color: Color(0xaa000000),
                    //               fontSize: 12,
                    //               fontFamily: "Inter",
                    //               fontWeight: FontWeight.w500,
                    //             ),
                    //           ),
                    //           IconButton(
                    //               onPressed: () {},
                    //               icon: Icon(
                    //                 Icons.add,
                    //                 size: size.width * 0.05,
                    //               )),
                    //         ],
                    //       ),
                    //       width: size.width * 0.20,
                    //       height: size.height * 0.023,
                    //       color: Color(0x35979797),
                    //     )
                    //   ],
                    // ),
                  ],
                ),
              ),
              // Padding(
              // padding: const EdgeInsets.all(8.0),
              // child:
              Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      circular_button(
                        onpressed: () {
                          print("hello");
                          String phoneNo = ""; // Nullable variable

                          _firestone
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
                          setState(() {
                            _firestone
                                .collection('new_account')
                                .doc(Location)
                                .collection(Location)
                                .doc(Account_No)
                                .delete();
                          });
                        },
                        size: 20,
                        icon: Image.asset('assets/Acc/IC5.png'),
                      ),
                    ],
                  ),
                ),
              ),
              // ),
              Divider(
                thickness: 0.7,
                height: 0.02,
              )
            ],
          ),
        ));
  }
}
