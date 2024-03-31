import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stageup/config/routing/app_routes.dart';
import 'package:stageup/config/theme/theme.dart';
import 'package:stageup/core/helpers/shared_prefs_helper.dart';
import 'package:stageup/features/applications/ui/manager/application_manager.dart';
import 'package:stageup/features/interships/ui/manager/intership_manager.dart';
import 'package:stageup/features/security/domain/entities/user.dart';
import 'package:stageup/features/security/ui/manager/security_manager.dart';
import 'package:stageup/skeleton/widgets/loading.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).whenComplete(() {
      /*checkNewUser().then((value) {
        if (value) {
          GoRouter.of(context).pushReplacementNamed(AppRoutes.onBoarding);
        } else {*/
      getUser().then((value) {
        if (value != null) {
          Provider.of<SecurityManager>(context, listen: false).user = value;
          Provider.of<InternshipManager>(context, listen: false)
              .fetchInternships()
              .whenComplete(() {
            Provider.of<ApplicationManager>(context, listen: false)
                .fetchApplications()
                .whenComplete(
                  () => GoRouter.of(context)
                      .pushReplacementNamed(AppRoutes.rootRoute),
                );
          });
        } else {
          GoRouter.of(context).pushReplacementNamed(AppRoutes.onBoarding);
        }
      });
      /* }
      });*/
    });
    super.initState();
  }

  Future<User?> getUser() async {
    var token = await LocalStorageHelper.getStringData('token');
    if (token != null) {
      var userString = await LocalStorageHelper.getStringData('user');
      if (userString != null) {
        var user = User.fromJson(jsonDecode(userString));
        return user;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  /* Future<bool> checkNewUser() async {
    var isNewUser = await LocalStorageHelper.getBoolData('isNewUser');
    if (isNewUser == null) {
      return true;
    } else {
      await LocalStorageHelper.addBoolData('isNewUser', true);
      return false;
    }
  }*/

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Gap(size.height * 0.2),
            const Text(
              "Stage UP",
              style: TextStyle(
                color: AppTheme.primary,
                fontSize: 55,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(size.height * 0.1),
            const Loading(),
          ],
        ),
      ),
    );
  }
}
