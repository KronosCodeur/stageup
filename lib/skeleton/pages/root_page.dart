import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stageup/config/routing/app_routes.dart';
import 'package:stageup/config/theme/theme.dart';
import 'package:stageup/core/constants/api_constants.dart';
import 'package:stageup/core/helpers/date_helper.dart';
import 'package:stageup/features/applications/ui/manager/application_manager.dart';
import 'package:stageup/features/interships/ui/manager/intership_manager.dart';
import 'package:stageup/features/security/ui/manager/security_manager.dart';
import 'package:stageup/skeleton/managers/routing_manager.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer2<RoutingManager, SecurityManager>(
        builder: (context, routing, security, child) {
      return RefreshIndicator(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size(size.width, 90),
              child: Padding(
                padding: const EdgeInsets.only(top: 55, left: 15, right: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: routing.currentPage == 0
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppTheme.primary,
                          backgroundImage: NetworkImage(
                            ApiConstants.profileBaseUrl +
                                security.user!.profile,
                          ),
                          radius: 25,
                        ),
                        const Gap(10),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            routing.currentPage == 0
                                ? Text(
                                    DateTimeHelper.getStringDate(
                                        DateTime.now()),
                                    style: const TextStyle(
                                      color: AppTheme.gray,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : const Gap(0),
                            Text(
                              routing.getCurrentTitle(),
                              style: const TextStyle(
                                color: AppTheme.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Gap(size.width * 0.15),
                        InkWell(
                          onTap: () {
                            GoRouter.of(context)
                                .pushNamed(AppRoutes.notificationRoute);
                          },
                          child: Stack(
                            children: [
                              const Icon(
                                Icons.notifications_none_sharp,
                                color: AppTheme.black,
                                size: 35,
                              ),
                              Positioned(
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.all(3),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        15,
                                      ),
                                      color: AppTheme.error),
                                  child: Text(
                                    '9+',
                                    style: TextStyle(
                                      color: AppTheme.white,
                                      fontSize: 8,
                                    ),
                                  ),
                                ),
                              )
                            ],
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
          ),
          onRefresh: () async {
            await Provider.of<InternshipManager>(context, listen: false)
                .fetchInternships();
            await Provider.of<ApplicationManager>(context, listen: false)
                .fetchApplications();
          });
    });
  }
}
