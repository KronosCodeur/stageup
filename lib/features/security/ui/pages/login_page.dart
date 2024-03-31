// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stageup/config/routing/app_routes.dart';
import 'package:stageup/config/theme/theme.dart';
import 'package:stageup/features/interships/ui/manager/intership_manager.dart';
import 'package:stageup/features/security/ui/manager/security_manager.dart';
import 'package:stageup/skeleton/widgets/decoration.dart';
import 'package:stageup/skeleton/widgets/loading.dart';
import 'package:stageup/skeleton/widgets/primary_button.dart';
import 'package:stageup/skeleton/widgets/toast.dart';

import '../../../applications/ui/manager/application_manager.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<SecurityManager>(builder: (context, security, child) {
      return Scaffold(
        backgroundColor: AppTheme.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: security.loading
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
                    const Center(
                        child: Text(
                      "connectez-vous á votre compte",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.gray),
                    )),
                    const Gap(40),
                    TextFormField(
                      onChanged: (phone) => security.setLoginPhone(phone),
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(
                        color: AppTheme.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: AppWidgetDecoration.inputDecoration(
                        hint: '70 00 00 00',
                        borderColor: AppTheme.gray,
                        borderWidth: 2,
                        icon: Icons.phone,
                        label: 'Numéro de Téléphone',
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                      onChanged: (password) =>
                          security.setLoginPassword(password),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: security.obscure,
                      style: const TextStyle(
                        color: AppTheme.black,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: AppWidgetDecoration.inputDecoration(
                        hint: '********',
                        borderColor: AppTheme.gray,
                        borderWidth: 2,
                        icon: Icons.lock,
                        label: 'Mot de passe',
                        suffixIcon: InkWell(
                          onTap: () => security.obscureText(),
                          child: Icon(
                            security.obscure
                                ? Icons.visibility_rounded
                                : Icons.visibility_off_rounded,
                            color: AppTheme.gray,
                          ),
                        ),
                      ),
                    ),
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
                        color: (security.phoneIsValid &&
                                security.paramsLogin.password.isNotEmpty)
                            ? AppTheme.primary
                            : AppTheme.gray,
                        onPressed: () async {
                          if (security.phoneIsValid &&
                              security.paramsLogin.password.isNotEmpty) {
                            security.load();
                            await security.login().whenComplete(
                              () async {
                                if (security.response!.success) {
                                  await Provider.of<InternshipManager>(context,
                                          listen: false)
                                      .fetchInternships()
                                      .whenComplete(() {
                                    Provider.of<ApplicationManager>(context,
                                            listen: false)
                                        .fetchApplications()
                                        .whenComplete(() {
                                      security.unLoad();
                                      GoRouter.of(context).pushReplacementNamed(
                                          AppRoutes.rootRoute);
                                    });
                                  });
                                }
                                security.unLoad();
                                toast(
                                  context: context,
                                  title: "Authentification",
                                  message: security.response!.message,
                                  success: security.response!.success,
                                );
                              },
                            );
                          }
                        },
                        vPadding: 15,
                        hPadding: size.width * 0.25,
                        child: const Text(
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
