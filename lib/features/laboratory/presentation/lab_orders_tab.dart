import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:healthy_cart_user/core/custom/app_bars/sliver_custom_appbar.dart';
import 'package:healthy_cart_user/features/laboratory/presentation/accepted_tab.dart';
import 'package:healthy_cart_user/features/laboratory/presentation/cancelled_tab.dart';
import 'package:healthy_cart_user/features/laboratory/presentation/completed_tab.dart';
import 'package:healthy_cart_user/features/laboratory/presentation/pending_tab.dart';
import 'package:healthy_cart_user/utils/constants/colors/colors.dart';

class LabOrdersTab extends StatelessWidget {
  const LabOrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: CustomScrollView(
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverCustomAppbar(
                  title: 'Lab Orders', onBackTap: () => Navigator.pop(context)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: ButtonsTabBar(
                     
                      unselectedLabelStyle: const TextStyle(
                          color: BColors.darkblue,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                      labelStyle: const TextStyle(
                          color: BColors.white,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500),
                      backgroundColor: BColors.darkblue,
                      unselectedBackgroundColor: BColors.white,
                      unselectedBorderColor: BColors.darkblue,
                      borderWidth: 1,
                   
                      contentPadding: const EdgeInsets.all(8),
                      radius: 12,
                      duration: 50,
                      buttonMargin: const EdgeInsets.symmetric(horizontal: 12),
                      tabs: const [
                        Tab(
                          text: 'Pending',
                        ),
                        Tab(
                          text: 'Approved',
                        ),
                        Tab(
                          text: 'Completed',
                        ),
                        Tab(
                          text: 'Cancelled',
                        ),
                      ]),
                ),
              ),
              const SliverFillRemaining(
                child: TabBarView(children: [
                  LabPendingTab(),
                  LabAccepted(),
                  LabCompleted(),
                  LabCancelledTab(),
                ]),
              )
            ]),
      ),
    );
  }
}
