import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:stage_up/config/theme/theme.dart';
import 'package:stage_up/core/helpers/date_helper.dart';
import 'package:stage_up/skeleton/managers/routing_manager.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<RoutingManager>(builder: (context, routing, child) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(size.width, 90),
          child: Padding(
            padding: const EdgeInsets.only(top: 65, left: 15, right: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: routing.currentPage == 0
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      backgroundColor: AppTheme.primary,
                      radius: 25,
                      child: Icon(
                        Icons.person,
                        color: AppTheme.black,
                        size: 30,
                      ),
                    ),
                    const Gap(10),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        routing.currentPage == 0
                            ? Text(
                                DateTimeHelper.getStringDate(DateTime.now()),
                                style: const TextStyle(
                                  color: AppTheme.gray,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const Gap(0),
                        Text(
                          routing.getCurrentTitle(),
                          style: const TextStyle(
                            color: AppTheme.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.notifications_none_sharp,
                        color: AppTheme.black,
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: routing.getCurrentPage(),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppTheme.gray,
          selectedItemColor: AppTheme.primary,
          selectedLabelStyle: const TextStyle(
            color: AppTheme.primary,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
          unselectedLabelStyle: const TextStyle(
            color: AppTheme.gray,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          showUnselectedLabels: true,
          currentIndex: routing.currentPage,
          onTap: (index) {
            routing.setCurrentPage(index);
          },
          items: routing.pages
              .map(
                (page) => BottomNavigationBarItem(
                  icon: Icon(
                    page['icon'],
                  ),
                  backgroundColor: AppTheme.white,
                  label: page['name'],
                ),
              )
              .toList(),
        ),
      );
    });
  }
}
