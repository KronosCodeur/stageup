import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stage_up/config/routing/app_routes.dart';
import 'package:stage_up/config/theme/theme.dart';
import 'package:stage_up/features/security/ui/manager/security_manager.dart';
import 'package:stage_up/skeleton/widgets/loading.dart';
import 'package:stage_up/skeleton/widgets/primary_button.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SecurityManager>(builder: (context, authProvider, child) {
      return Scaffold(
        backgroundColor: AppTheme.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: authProvider.loading
              ? const Loading()
              : Center(
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
                      Center(
                          child: Text(
                        "Créez votre compte",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.secondary.withOpacity(0.8)),
                      )),
                      const Gap(20),
                      TextFormField(
                        onChanged: (firstName) =>
                            authProvider.setFirstname(firstName),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                            color: AppTheme.secondary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                            hintText: "John DOE",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.person_2_rounded,
                                  color: AppTheme.primary,
                                  size: 20,
                                ),
                                Text(
                                  " Nom Complet",
                                  style: TextStyle(
                                      color: AppTheme.gray,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )),
                      ),
                      const Gap(15),
                      TextFormField(
                        onChanged: (phone) => authProvider.setPhone(phone),
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                            color: AppTheme.secondary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                            hintText: "70 00 00 00",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.phone_rounded,
                                  color: AppTheme.primary,
                                  size: 20,
                                ),
                                Text(
                                  "Téléphone",
                                  style: TextStyle(
                                      color: AppTheme.gray,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )),
                      ),
                      const Gap(15),
                      TextFormField(
                        onChanged: (password) =>
                            authProvider.setPassword(password),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        style: const TextStyle(
                            color: AppTheme.secondary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                        decoration: InputDecoration(
                            hintText: "Mot de passe",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.key_rounded,
                                  color: AppTheme.primary,
                                  size: 20,
                                ),
                                Text(
                                  " Mot de passe",
                                  style: TextStyle(
                                      color: AppTheme.gray,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            )),
                      ),
                      const Gap(20),
                      Center(
                        child: PrimaryButton(
                          onPressed: () {
                            if (authProvider.phoneIsValid &&
                                authProvider.passwordIsValid &&
                                authProvider.lastNameIsValid &&
                                authProvider.firstNameIsValid) {}
                          },
                          hPadding: 100,
                          radius: 50,
                          elevation: (authProvider.phoneIsValid &&
                                  authProvider.passwordIsValid &&
                                  authProvider.lastNameIsValid &&
                                  authProvider.firstNameIsValid)
                              ? 5
                              : 0,
                          vPadding: 15,
                          color: (authProvider.phoneIsValid &&
                                  authProvider.passwordIsValid &&
                                  authProvider.lastNameIsValid &&
                                  authProvider.firstNameIsValid)
                              ? AppTheme.primary
                              : AppTheme.gray,
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Continuer",
                                style: TextStyle(
                                    color: AppTheme.white, fontSize: 15),
                              ),
                              Gap(5),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: AppTheme.white,
                                size: 20,
                              )
                            ],
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
                      const Center(
                        child: SizedBox(
                          width: 200,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Le mot de passe doit contenir :",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "* une longueur >= à 8 charactères,",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "* au moin une majuscule,",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "* au moin une minuscule,",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "* au moin un chiffre.",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      );
    });
  }
}
