import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:stageup/config/theme/theme.dart';
import 'package:stageup/features/security/ui/manager/security_manager.dart';
import 'package:stageup/skeleton/widgets/decoration.dart';

class PersonalInfosWidget extends StatelessWidget {
  const PersonalInfosWidget({super.key});

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
              Icons.person_pin_rounded,
              size: 40,
              color: AppTheme.primary,
            ),
            const Text(
              "Informations Personnelles",
              style: TextStyle(
                  color: AppTheme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Gap(15),
            CircleAvatar(
              radius: 40,
              backgroundColor: AppTheme.gray,
              backgroundImage: security.profile != null
                  ? FileImage(security.profile!)
                  : null,
              child: InkWell(
                onTap: () async {
                  if (security.profile == null) {
                    final ImagePicker picker = ImagePicker();
                    await picker
                        .pickImage(
                          source: ImageSource.gallery,
                          maxWidth: 300,
                          maxHeight: 300,
                          requestFullMetadata: true,
                        )
                        .then(
                          (value) => security.setProfile(
                            File(value!.path),
                          ),
                        );
                  } else {
                    security.resetProfile();
                  }
                },
                child: Icon(
                  security.profile == null ? Icons.add_a_photo : Icons.delete,
                  color: security.profile == null
                      ? AppTheme.secondary
                      : AppTheme.error,
                ),
              ),
            ),
            const Gap(20),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: TextFormField(
                      onChanged: (value) => security.setLastname(value),
                      initialValue: security.paramsRegister.lastname,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                      decoration: AppWidgetDecoration.inputDecoration(
                        hint: "",
                        label: "Nom",
                        icon: Icons.person,
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
                      onChanged: (value) => security.setFirstname(value),
                      initialValue: security.paramsRegister.firstname,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                      decoration: AppWidgetDecoration.inputDecoration(
                        hint: "",
                        label: "Prénom",
                        icon: Icons.person,
                        borderColor: AppTheme.gray,
                        borderWidth: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppTheme.gray,
                          width: 1,
                        ),
                      ),
                      child: DropdownButton<int>(
                        borderRadius: BorderRadius.circular(10),
                        value: security.paramsRegister.gender,
                        hint: const Text(
                          "Genre",
                          style: TextStyle(
                              color: AppTheme.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                        items: [
                          const DropdownMenuItem(
                            value: 0,
                            child: Text(
                              "Homme",
                              style: TextStyle(
                                  color: AppTheme.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const DropdownMenuItem(
                            value: 1,
                            child: Text(
                              "Femme",
                              style: TextStyle(
                                  color: AppTheme.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                        onChanged: (value) => security.setGender(value!),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: TextFormField(
                      onChanged: (value) => security.setDateOfBirth(value),
                      initialValue: security.paramsRegister.dateOfBirth,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                      decoration: AppWidgetDecoration.inputDecoration(
                        hint: "AAAA-MM-JJ",
                        label: "Date Naissance",
                        icon: Icons.calendar_month,
                        borderColor: AppTheme.gray,
                        borderWidth: 1,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(10)
          ],
        ),
      );
    });
  }
}
