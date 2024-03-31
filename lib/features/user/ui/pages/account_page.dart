import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stage_up/config/routing/app_routes.dart';
import 'package:stage_up/config/theme/theme.dart';
import 'package:stage_up/core/constants/api_constants.dart';
import 'package:stage_up/core/helpers/date_helper.dart';
import 'package:stage_up/core/helpers/shared_prefs_helper.dart';
import 'package:stage_up/features/security/ui/manager/security_manager.dart';
import 'package:stage_up/skeleton/widgets/decoration.dart';
import 'package:stage_up/skeleton/widgets/loading.dart';
import 'package:stage_up/skeleton/widgets/primary_button.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SecurityManager>(builder: (context, security, child) {
      return Scaffold(
        body: security.loading
            ? const Loading()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: AppTheme.primary,
                          backgroundImage: NetworkImage(
                            ApiConstants.profileBaseUrl +
                                security.user!.profile,
                          ),
                          radius: 50,
                        ),
                        const Gap(30),
                        TextFormField(
                          initialValue: security.user!.lastname,
                          readOnly: true,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          decoration: AppWidgetDecoration.inputDecoration(
                            hint: "",
                            label: "Nom",
                            icon: Icons.person,
                            borderColor: AppTheme.primary,
                            borderWidth: 1,
                          ),
                        ),
                        const Gap(10),
                        TextFormField(
                          initialValue: security.user!.firstname,
                          readOnly: true,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          decoration: AppWidgetDecoration.inputDecoration(
                            hint: "",
                            label: "Prénom",
                            icon: Icons.person,
                            borderColor: AppTheme.primary,
                            borderWidth: 1,
                          ),
                        ),
                        const Gap(10),
                        TextFormField(
                          initialValue: security.user!.address,
                          readOnly: true,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          decoration: AppWidgetDecoration.inputDecoration(
                            hint: "",
                            label: "Adresse",
                            icon: Icons.location_on,
                            borderColor: AppTheme.primary,
                            borderWidth: 1,
                          ),
                        ),
                        const Gap(10),
                        TextFormField(
                          initialValue: security.user!.school,
                          readOnly: true,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          decoration: AppWidgetDecoration.inputDecoration(
                            hint: "",
                            label: "Université",
                            icon: Icons.school,
                            borderColor: AppTheme.primary,
                            borderWidth: 1,
                          ),
                        ),
                        const Gap(10),
                        TextFormField(
                          initialValue: security.user!.phone,
                          readOnly: true,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          decoration: AppWidgetDecoration.inputDecoration(
                            hint: "",
                            label: "Numéro de téléphone",
                            icon: Icons.phone,
                            borderColor: AppTheme.primary,
                            borderWidth: 1,
                          ),
                        ),
                        const Gap(10),
                        TextFormField(
                          initialValue: security.user!.gender,
                          readOnly: true,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          decoration: AppWidgetDecoration.inputDecoration(
                            hint: "",
                            label: "Genre",
                            icon: Icons.transgender_rounded,
                            borderColor: AppTheme.primary,
                            borderWidth: 1,
                          ),
                        ),
                        const Gap(10),
                        TextFormField(
                          initialValue: DateTimeHelper.getStringDate(
                              DateTime.parse(security.user!.dateOfBirth)),
                          readOnly: true,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                          decoration: AppWidgetDecoration.inputDecoration(
                            hint: "",
                            label: "Genre",
                            icon: Icons.calendar_month,
                            borderColor: AppTheme.primary,
                            borderWidth: 1,
                          ),
                        ),
                        const Gap(30),
                        PrimaryButton(
                          onPressed: () async {
                            security.load();
                            await LocalStorageHelper.removeData('token')
                                .then((value) async {
                              if (value) {
                                await LocalStorageHelper.removeData('token')
                                    .then((value) {
                                  if (value) {
                                    GoRouter.of(context).pushReplacementNamed(
                                        AppRoutes.loginRoute);
                                  }
                                });
                              }
                            });
                            security.unLoad();
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Déconnexion",
                                style: TextStyle(
                                  color: AppTheme.error,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gap(5),
                              Icon(
                                Icons.logout_outlined,
                                size: 20,
                                color: AppTheme.error,
                              )
                            ],
                          ),
                          elevation: 0,
                          hPadding: 50,
                          vPadding: 10,
                          color: AppTheme.error.withOpacity(0.2),
                        ),
                        const Gap(30),
                      ],
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
