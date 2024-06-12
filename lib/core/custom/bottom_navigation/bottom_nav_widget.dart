import 'package:flutter/material.dart';
import 'package:healthy_cart_user/features/home/presentation/home_main.dart';
import 'package:healthy_cart_user/features/hospital/presentation/hospital_main.dart';
import 'package:healthy_cart_user/features/laboratory/presentation/lab_main.dart';
import 'package:healthy_cart_user/features/pharmacy/presentation/pharmacy_main.dart';
import 'package:healthy_cart_user/features/profile/presentation/profile_main.dart';
import 'package:healthy_cart_user/utils/constants/colors/colors.dart';
import 'package:healthy_cart_user/utils/constants/icons/icons.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({
    super.key,
  });

  @override
  State<BottomNavigationWidget> createState() => _BottonNavTabState();
}

class _BottonNavTabState extends State<BottomNavigationWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: const TabBarView(
            clipBehavior: Clip.antiAlias,
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeMain(),
              HospitalMain(),
              LabMain(),
              PharmacyMain(),
              ProfileMain(),
            ]),
        bottomNavigationBar: PhysicalModel(
          color: Colors.white,
          elevation: 10,
          child: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: UnderlineTabIndicator(
                borderSide:
                    BorderSide(color: BColors.mainlightColor, width: 8.0),
                insets: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 66.0),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              ),
              unselectedLabelStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Montserrat'),
              labelStyle: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat'),
              labelColor: BColors.mainlightColor,
              unselectedLabelColor: BColors.black,
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              tabs: [
                Tab(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: selectedIndex == 0
                        ? Image.asset(
                            BIcon.homeColor,
                            height: 24,
                            width: 24,
                          )
                        : Image.asset(
                            BIcon.homeBlack,
                            height: 22,
                            width: 22,
                          ),
                  ),
                  text: 'Home',
                ),
                Tab(
                  text: 'Hospital',
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: selectedIndex == 1
                        ? Image.asset(
                            BIcon.hospitalColor,
                            height: 24,
                            width: 24,
                          )
                        : Image.asset(
                            BIcon.hospitalBlack,
                            height: 22,
                            width: 22,
                          ),
                  ),
                ),
                Tab(
                  text: 'Lab',
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: selectedIndex == 2
                        ? Image.asset(
                            BIcon.labColor,
                            height: 24,
                            width: 24,
                          )
                        : Image.asset(
                            BIcon.labBlack,
                            height: 22,
                            width: 22,
                          ),
                  ),
                ),
                Tab(
                  text: 'Medicine',
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: selectedIndex == 3
                        ? Image.asset(
                            BIcon.medicineColor,
                            height: 24,
                            width: 24,
                          )
                        : Image.asset(
                            BIcon.medicineBlack,
                            height: 22,
                            width: 22,
                          ),
                  ),
                ),
                Tab(
                  text: 'Profile',
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: selectedIndex == 4
                        ? Image.asset(
                            BIcon.profileColor,
                            height: 26,
                            width: 26,
                          )
                        : Image.asset(
                            BIcon.profileBlack,
                            height: 24,
                            width: 24,
                          ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
