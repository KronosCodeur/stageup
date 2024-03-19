import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:stage_up/config/routing/app_routes.dart';
import 'package:stage_up/config/theme/theme.dart';
import 'package:stage_up/skeleton/widgets/loading.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
    ).whenComplete(() {
      GoRouter.of(context).pushReplacementNamed(AppRoutes.onBoarding);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Gap(size.height * 0.2),
            Text(
              "Stage UP",
              style: TextStyle(
                color: AppTheme.primary,
                fontSize: 55,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(size.height * 0.1),
            Loading(),
          ],
        ),
      ),
    );
  }
}
