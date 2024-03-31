import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:stageup/config/theme/theme.dart';
import 'package:stageup/features/security/ui/manager/security_manager.dart';
import 'package:stageup/skeleton/widgets/decoration.dart';

class ReferencesInfosWidget extends StatelessWidget {
  const ReferencesInfosWidget({super.key});

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
            Icon(
              Icons.my_location,
              size: 40,
              color: AppTheme.primary,
            ),
            const Text(
              "Vos références",
              style: TextStyle(
                  color: AppTheme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Gap(30),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: TextFormField(
                      onChanged: (value) => security.setNeighborhood(value),
                      initialValue: security.neighborhood,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                      decoration: AppWidgetDecoration.inputDecoration(
                        hint: "",
                        label: "Quartier",
                        icon: Icons.location_on,
                        borderColor: AppTheme.gray,
                        borderWidth: 1,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: TextFormField(
                      onChanged: (value) => security.setCity(value),
                      initialValue: security.city,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                      decoration: AppWidgetDecoration.inputDecoration(
                        hint: "",
                        label: "Ville",
                        icon: Icons.location_city,
                        borderColor: AppTheme.gray,
                        borderWidth: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(10),
            TextFormField(
              onChanged: (value) => security.setSchool(value),
              initialValue: security.paramsRegister.school,
              style: const TextStyle(
                fontSize: 12,
              ),
              decoration: AppWidgetDecoration.inputDecoration(
                hint: "",
                label: " Université",
                icon: Icons.school,
                borderColor: AppTheme.gray,
                borderWidth: 1,
              ),
            ),
            const Gap(10)
          ],
        ),
      );
    });
  }
}
