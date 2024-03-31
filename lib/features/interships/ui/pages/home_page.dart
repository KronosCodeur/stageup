import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stageup/config/routing/app_routes.dart';
import 'package:stageup/config/theme/theme.dart';
import 'package:stageup/core/errors/failure.dart';
import 'package:stageup/features/interships/domain/entities/intership.dart';
import 'package:stageup/features/interships/ui/manager/intership_manager.dart';
import 'package:stageup/features/interships/ui/widgets/internship_item.dart';
import 'package:stageup/skeleton/widgets/decoration.dart';
import 'package:stageup/skeleton/widgets/loading.dart';
import 'package:stageup/skeleton/widgets/primary_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<InternshipManager>(
        builder: (context, internShipsState, child) {
      Failure? failure = internShipsState.failure;
      List<Internship>? internships = internShipsState.internships;
      late Widget widget;
      if (failure == null && internships == null) {
        widget = const Loading();
      } else if (internships != null && failure == null) {
        List<Internship> filteredInternships =
            internShipsState.searchText.trim().isNotEmpty
                ? internships
                    .where((element) => element.title
                        .toLowerCase()
                        .contains(internShipsState.searchText.toLowerCase()))
                    .toList()
                : internships;
        widget = Expanded(
          child: ListView.builder(
              itemCount: filteredInternships.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    internShipsState.setSelectedInternship(internships[index]);
                    GoRouter.of(context)
                        .pushNamed(AppRoutes.internshipInfoRoute);
                  },
                  child: InternshipItem(
                    internship: filteredInternships[index],
                  ),
                );
              }),
        );
      } else if (failure != null && internships == null) {
        widget = Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                failure.errorMessage,
                style: TextStyle(
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
