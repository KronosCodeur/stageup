import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stageup/features/security/ui/manager/security_manager.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SecurityManager>(builder: (context, security, child) {
      return const Scaffold(
        body: Center(
          child: Text("Change Password Page"),
        ),
      );
    });
  }
}
