import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stageup/config/routing/app_routing.dart';
import 'package:stageup/config/theme/theme.dart';
import 'package:stageup/features/applications/ui/manager/application_manager.dart';
import 'package:stageup/features/interships/ui/manager/intership_manager.dart';
import 'package:stageup/features/security/ui/manager/register_step_manager.dart';
import 'package:stageup/features/security/ui/manager/security_manager.dart';
import 'package:stageup/skeleton/managers/on_boarding_manager.dart';
import 'package:stageup/skeleton/managers/routing_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SecurityManager()),
        ChangeNotifierProvider(create: (_) => OnBoardingManager()),
        ChangeNotifierProvider(create: (_) => RoutingManager()),
        ChangeNotifierProvider(create: (_) => InternshipManager()),
        ChangeNotifierProvider(create: (_) => RegisterStepManager()),
        ChangeNotifierProvider(create: (_) => ApplicationManager()),
      ],
      child: const StageUp(),
    ),
  );
}

class StageUp extends StatelessWidget {
  const StageUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.mainTheme(),
      routerConfig: AppRouting.router,
    );
  }
}
