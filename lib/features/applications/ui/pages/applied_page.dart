import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:stageup/config/theme/theme.dart';
import 'package:stageup/core/errors/failure.dart';
import 'package:stageup/features/applications/ui/manager/application_manager.dart';
import 'package:stageup/features/applications/ui/widgets/applied_internship_item.dart';
import 'package:stageup/features/interships/domain/entities/intership.dart';
import 'package:stageup/features/interships/ui/manager/intership_manager.dart';
import 'package:stageup/skeleton/widgets/decoration.dart';
import 'package:stageup/skeleton/widgets/loading.dart';
import 'package:stageup/skeleton/widgets/primary_button.dart';

class AppliedPage extends StatelessWidget {
  const AppliedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<InternshipManager, ApplicationManager>(
        builder: (context, internShipsState, applicationsState, child) {
      var applications = applicationsState.applications;
      Failure? failure = internShipsState.failure;
      List<Internship>? internships = internShipsState.internships;
      late Widget widget;
      if ((failure == null && applications == null) || internships == null) {
        widget = const Loading();
      } else if (applications != null && failure == null) {
        widget = Expanded(
          child: ListView.builder(
              itemCount: applications.length,
              itemBuilder: (context, index) {
                var application = applications[index];
                var internship = internships
                    .firstWhere((i) => i.id == application.internshipId);
                return InkWell(
                  child: AppliedInternshipItem(
                    internship: internship,
                    application: application,
                  ),
                );
              }),
        );
      } else if (failure != null && applications == null) {
        widget = Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                failure.errorMessage,
                style: const TextStyle(
                  color: AppTheme.primary,
                ),
              )
            ],
          ),
        );
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        child: Column(
          children: [
            TextFormField(
              initialValue: internShipsState.searchText,
              onChanged: (value) => internShipsState.setSearchText(value),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              decoration: AppWidgetDecoration.inputDecoration(
                hint: "Rechercher une offre",
                borderColor: AppTheme.gray,
                suffixIcon: PrimaryButton(
                  onPressed: () {},
                  elevation: 0,
                  child: const Icon(Icons.search),
                ),
              ),
            ),
            const Gap(20),
            const Text(
              "Trouver des offres qui correspondent à vos compétences",
              style: TextStyle(
                color: AppTheme.gray,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(15),
            widget
          ],
        ),
      );
    });
  }
}
