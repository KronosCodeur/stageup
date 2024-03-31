import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stageup/config/routing/app_routes.dart';
import 'package:stageup/config/theme/theme.dart';
import 'package:stageup/features/security/ui/manager/register_step_manager.dart';
import 'package:stageup/features/security/ui/manager/security_manager.dart';
import 'package:stageup/skeleton/widgets/loading.dart';
import 'package:stageup/skeleton/widgets/primary_button.dart';
import 'package:stageup/skeleton/widgets/toast.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<SecurityManager, RegisterStepManager>(
        builder: (context, security, stepManager, child) {
      return Scaffold(
        backgroundColor: AppTheme.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: security.loading
              ? const Loading()
              : Center(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                              child: Text(
                            "Stage Up",
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primary),
                          )),
                          const Center(
                            child: Text(
                              "Créez votre compte",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.gray),
                            ),
                          ),
                          const Gap(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => stepManager.setIndex(0),
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: security.stepOneIsValid
                                      ? AppTheme.primary
                                      : AppTheme.gray,
                                  child: const Icon(
                                    Icons.person_pin_rounded,
                                    color: AppTheme.white,
                                  ),
                                ),
                              ),
                              const Gap(10),
                              InkWell(
                                onTap: () {
                                  if (security.stepOneIsValid) {
                                    stepManager.setIndex(1);
                                  }
                                },
                                child: CircleAvatar(
                                  backgroundColor: security.stepTwoIsValid
                                      ? AppTheme.primary
                                      : AppTheme.gray,
                                  radius: 20,
                                  child: const Icon(
                                    Icons.my_location,
                                    color: AppTheme.white,
                                  ),
                                ),
                              ),
                              const Gap(10),
                              InkWell(
                                onTap: () {
                                  if (security.stepTwoIsValid) {
                                    stepManager.setIndex(2);
                                  }
                                },
                                child: CircleAvatar(
                                  backgroundColor: security.stepThreeIsValid
                                      ? AppTheme.primary
                                      : AppTheme.gray,
                                  radius: 20,
                                  child: const Icon(
                                    Icons.verified_user,
                                    color: AppTheme.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gap(10),
                          stepManager.steps[stepManager.stepIndex],
                          const Gap(20),
                          Center(
                            child: PrimaryButton(
                              onPressed: () async {
                                if (security.stepTwoIsValid &&
                                    security.stepOneIsValid &&
                                    security.stepThreeIsValid) {
                                  security.load();
                                  await security
                                      .register()
                                      .whenComplete(() async {
                                    if (security.response!.success) {
                                      await security.uploadProfile();
                                      security.unLoad();
                                      GoRouter.of(context).pushReplacementNamed(
                                          AppRoutes.loginRoute);
                                    }
                                    security.unLoad();
                                    toast(
                                        context: context,
                                        title: "Authentification",
                                        message: security.response!.message,
                                        success: security.response!.success);
                                  });
                                }
                              },
                              hPadding: 100,
                              radius: 50,
                              elevation: (security.stepTwoIsValid &&
                                      security.stepOneIsValid &&
                                      security.stepThreeIsValid)
                                  ? 5
                                  : 0,
                              vPadding: 15,
                              color: (security.stepTwoIsValid &&
                                      security.stepOneIsValid &&
                                      security.stepThreeIsValid)
                                  ? AppTheme.primary
                                  : AppTheme.gray,
                              child: const Text(
                                "Créer mon compte",
                                style: TextStyle(
                                    color: AppTheme.white, fontSize: 15),
                              ),
                            ),
                          ),
                          const Gap(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Vous avez déjá un compte?",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.right,
                              ),
                              const Gap(5),
                              InkWell(
                                  onTap: () {
                                    GoRouter.of(context)
                                        .goNamed(AppRoutes.loginRoute);
                                  },
                                  child: const Text(
                                    "Connectez-vous",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: AppTheme.primary,
                                        decoration: TextDecoration.underline),
                                    textAlign: TextAlign.right,
                                  )),
                              const Gap(5)
                            ],
                          ),
                          const Gap(5),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      );
    });
  }
}
