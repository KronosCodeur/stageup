import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stage_up/config/routing/app_routing.dart';
import 'package:stage_up/config/theme/theme.dart';
import 'package:stage_up/features/interships/ui/manager/intership_manager.dart';
import 'package:stage_up/features/security/ui/manager/security_manager.dart';
import 'package:stage_up/skeleton/managers/on_boarding_manager.dart';
import 'package:stage_up/skeleton/managers/routing_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => SecurityManager()),
      ChangeNotifierProvider(create: (_) => OnBoardingManager()),
      ChangeNotifierProvider(create: (_) => RoutingManager()),
      ChangeNotifierProvider(create: (_) => InternshipManager()),
    ], child: const StageUp()),
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
