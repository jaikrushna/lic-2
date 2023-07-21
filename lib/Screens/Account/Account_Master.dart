import 'package:flutter/material.dart';
import 'package:internship2/Providers/scheme_selector.dart';
import 'package:internship2/Providers/_buildBottomBar.dart';
import 'package:internship2/widgets/customnavbar.dart';
import '../../models/views/displayed_data.dart';
import 'package:internship2/Screens/Menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class acc_master extends StatefulWidget {
  static const id = '/acc_master';
  acc_master(this.Location, {super.key});
  String Location;
  @override
  State<acc_master> createState() => _acc_masterState(Location);
}

class _acc_masterState extends State<acc_master> {
  _acc_masterState(
    this.Location,
  );
  String Location;
  int _currentIndex = 1;
  final int _currentscheme = 0;
  late String Member_Name;
  late String Plan;
  late String Account_No;
  late Timestamp date_open;
  late Timestamp date_mature;
  late Size size;
  late String mode;
  late int installment;
  late String status;
  late int Amount_Collected;
  late int Amount_Remaining;
  late int Monthly;
  late String cif;
  final _isloading = false;
  late final _firestone = FirebaseFirestore.instance;
  final _inactiveColor = const Color(0xffEBEBEB);
  void addData(List<Widget> Memberlist, size) {
    Memberlist.add(
      displayeddata(
        Location: Location,
        size: size,
        Member_Name: Member_Name,
        Plan: Plan,
        Account_No: Account_No,
        date_mature: date_mature,
        date_open: date_open,
        Monthly: Monthly,
        Amount_Collected: Amount_Collected,
        Amount_Remaining: Amount_Remaining,
        status: status,
        installment: installment,
        mode: mode,
        cif: cif,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CustomNavBar()),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xff144743),
          ),
        ),
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              width: size.width * 0.60,
              height: size.height * 0.05,
              decoration: BoxDecoration(
                  color: const Color(0XFFEBEBEB),
                  borderRadius: BorderRadius.circular(18)),
              child: const TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0XFF999999),
                    ),
                    hintText: 'Search',
                    border: InputBorder.none),
              ),
            ),
            IconButton(
                iconSize: 50,
                onPressed: () {},
                // height: size.height * 0.09,
                // width: size.width * 0.09,
                icon: Image.asset('assets/Acc/trailing.png'))
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(40),
                ),
                border: Border.all(
                  width: 3,
                  color: Colors.grey,
                  style: BorderStyle.solid,
                ),
              ),
              child: _buildAboveBar(),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 12.0),
          //   child: Row(
          //     children: [
          //       Text(
          //         'Chiran Road',
          //         style: TextStyle(
          //           fontSize: 13.5,
          //           color: Color(0xff205955),
          //           fontWeight: FontWeight.w500,
          //         ),
          //         textAlign: TextAlign.left,
          //       ),
          //     ],
          //   ),
          // ),
          StreamBuilder(
              stream: _firestone
                  .collection('new_account')
                  .doc(Location)
                  .collection(Location)
                  .orderBy('Member_Name')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.lightBlueAccent,
                    ),
                  );
                }
                final tiles = snapshot.data!.docs;
                List<Widget> Memberlist = [];
                for (var tile in tiles) {
                  Member_Name = tile.get('Member_Name');
                  Plan = tile.get('Plan');
                  Account_No = tile.get('Account_No').toString();
                  date_open = tile.get('Date_of_Opening');
                  date_mature = tile.get('Date_of_Maturity');
                  mode = tile.get('mode');
                  status = tile.get('status');
                  installment = tile.get('installment');
                  Amount_Remaining = tile.get('Amount_Remaining');
                  Amount_Collected = tile.get('Amount_Collected');
                  Monthly = tile.get('monthly');
                  cif = tile.get('CIF_No');
                  if (_currentIndex == 1) {
                    if (Plan == 'A') addData(Memberlist, size);
                  } else if (_currentIndex == 2) {
                    if (Plan == 'B') addData(Memberlist, size);
                  } else {
                    addData(Memberlist, size);
                  }
                }
                return _isloading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          SizedBox(
                              height: size.height * 0.68,
                              child: ListView.builder(
                                itemCount: Memberlist.length,
                                itemBuilder: (context, i) => Memberlist[i],
                              )),
                        ],
                      );
              })
        ],
      ),
    );
  }

  Widget _buildAboveBar() {
    Size size = MediaQuery.of(context).size;
    return CustomAnimatedAboveBar(
      containerHeight: size.height * 0.07,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <AboveNavyBarItem>[
        AboveNavyBarItem(
          alpha: 'All',
          activeColor: Colors.grey,
          inactiveColor: _inactiveColor,
        ),
        AboveNavyBarItem(
          alpha: 'A',
          activeColor: Colors.grey,
          inactiveColor: _inactiveColor,
        ),
        AboveNavyBarItem(
          alpha: 'B',
          activeColor: Colors.grey,
          inactiveColor: _inactiveColor,
        ),
      ],
    );
  }
}
