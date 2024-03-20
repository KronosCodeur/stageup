// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stage_up/config/routing/app_routes.dart';
import 'package:stage_up/config/theme/theme.dart';
import 'package:stage_up/features/security/ui/manager/security_manager.dart';
import 'package:stage_up/skeleton/widgets/decoration.dart';
import 'package:stage_up/skeleton/widgets/loading.dart';
import 'package:stage_up/skeleton/widgets/primary_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<SecurityManager>(
        builder: (context, securityManager, child) {
      return Scaffold(
        backgroundColor: AppTheme.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: securityManager.loading
              ? const Loading()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                        child: Text(
                      "StageUp",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primary),
                    )),
                    Center(
                        child: Text(
                      "connectez-vous á votre compte",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.gray),
                    )),
                    const Gap(40),
                    TextFormField(
                      onChanged: (phone) => securityManager.setPhone(phone),
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(
                          color: AppTheme.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                      decoration: AppWidgetDecoration.inputDecoration(
                        hint: '70 00 00 00',
                        borderColor: AppTheme.gray,
                        borderWidth: 2,
                        icon: Icons.phone,
                        label: 'Téléphone',
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                        onChanged: (password) =>
                            securityManager.setPassword(password),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        style: const TextStyle(
                            color: AppTheme.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                        decoration: AppWidgetDecoration.inputDecoration(
                          hint: '********',
                          borderColor: AppTheme.gray,
                          borderWidth: 2,
                          icon: Icons.lock,
                          label: 'Password',
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: const Text(
                              "Mot de passe oublié?",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: AppTheme.primary,
                                  decoration: TextDecoration.underline),
                              textAlign: TextAlign.right,
                            )),
                        const Gap(5)
                      ],
                    ),
                    const Gap(30),
                    Center(
                      child: PrimaryButton(
                        color: (securityManager.phoneIsValid &&
                                securityManager.passwordIsValid)
                            ? AppTheme.primary
                            : AppTheme.gray,
                        onPressed: () {
                          if (securityManager.phoneIsValid &&
                              securityManager.passwordIsValid) {
                            securityManager.login();
                            GoRouter.of(context)
                                .pushReplacementNamed(AppRoutes.rootRoute);
                          }
                        },
                        vPadding: 15,
                        hPadding: size.width * 0.25,
                        child: Text(
                          "Se Connecter",
                          style: TextStyle(
                            color: AppTheme.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const Gap(5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Vous n’avez pas de compte?",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: AppTheme.gray,
                          ),
                          textAlign: TextAlign.right,
                        ),
                        const Gap(5),
                        InkWell(
                            onTap: () {
                              GoRouter.of(context).pushReplacementNamed(
                                AppRoutes.registerRoute,
                              );
                            },
                            child: const Text(
                              "Créez un compte",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.primary,
                                decoration: TextDecoration.underline,
                              ),
                              textAlign: TextAlign.right,
                            )),
                        const Gap(5)
                      ],
                    ),
                  ],
                ),
        ),
      );
    });
  }
}
