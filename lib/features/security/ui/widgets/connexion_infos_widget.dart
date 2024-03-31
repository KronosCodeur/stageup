import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:stageup/config/theme/theme.dart';
import 'package:stageup/core/validators/textfield_validator.dart';
import 'package:stageup/features/security/ui/manager/security_manager.dart';
import 'package:stageup/skeleton/widgets/decoration.dart';

class ConnexionInfosWidget extends StatelessWidget {
  const ConnexionInfosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SecurityManager>(builder: (context, security, child) {
      return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Gap(5),
            const Icon(
              Icons.verified_user,
              size: 40,
              color: AppTheme.primary,
            ),
            const Text(
              "Informations de connexion",
              style: TextStyle(
                  color: AppTheme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Gap(30),
            TextFormField(
              onChanged: (value) => security.setRegisterPhone(value),
              initialValue: security.paramsRegister.phone,
              style: const TextStyle(
                fontSize: 12,
              ),
              decoration: AppWidgetDecoration.inputDecoration(
                hint: "",
                label: " Numéro de téléphone",
                icon: Icons.phone,
                borderColor: AppTheme.gray,
                borderWidth: 1,
              ),
            ),
            const Gap(10),
            TextFormField(
              onChanged: (value) => security.setRegisterPassword(value),
              initialValue: security.paramsRegister.password,
              obscureText: security.obscure,
              style: const TextStyle(
                fontSize: 12,
              ),
              decoration: AppWidgetDecoration.inputDecoration(
                  hint: "",
                  label: " Mot de passe",
                  icon: Icons.lock,
                  borderColor: AppTheme.gray,
                  borderWidth: 1,
                  suffixIcon: InkWell(
                    onTap: () => security.obscureText(),
                    child: Icon(
                      security.obscure
                          ? Icons.visibility_rounded
                          : Icons.visibility_off_rounded,
                      color: AppTheme.gray,
                    ),
                  )),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Le mot de passe doit contenir :",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "  * une longueur >= à 8 charactères,",
                        style: TextStyle(
                          fontSize: 10,
                          color: security.paramsRegister.password.length >= 8
                              ? AppTheme.primary
                              : AppTheme.error,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "  * au moin une majuscule,",
                        style: TextStyle(
                          fontSize: 10,
                          color: TextFieldValidator.containUppercase(
                                  security.paramsRegister.password)
                              ? AppTheme.primary
                              : AppTheme.error,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "  * au moin une minuscule,",
                        style: TextStyle(
                          fontSize: 10,
                          color: TextFieldValidator.containLowercase(
                                  security.paramsRegister.password)
                              ? AppTheme.primary
                              : AppTheme.error,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "  * au moin un chiffre.",
                        style: TextStyle(
                          fontSize: 10,
                          color: TextFieldValidator.containNumber(
                                  security.paramsRegister.password)
                              ? AppTheme.primary
                              : AppTheme.error,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
