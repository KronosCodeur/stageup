import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:stage_up/config/theme/theme.dart';
import 'package:stage_up/features/interships/ui/manager/intership_manager.dart';
import 'package:stage_up/features/interships/ui/widgets/applied_internship_item.dart';
import 'package:stage_up/skeleton/widgets/decoration.dart';
import 'package:stage_up/skeleton/widgets/primary_button.dart';

class AppliedPage extends StatelessWidget {
  const AppliedPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<InternshipManager>(
        builder: (context, internShipsState, child) {
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
            Expanded(
              child: ListView(
                children: [
                  for (int index = 0; index < 2; index++)
                    AppliedInternshipItem(
                      sent: true,
                      status: true,
                      internship: internShipsState.internships[0],
                    ),
                  AppliedInternshipItem(
                    sent: true,
                    status: false,
                    internship: internShipsState.internships[0],
                  ),
                  AppliedInternshipItem(
                    sent: true,
                    status: false,
                    internship: internShipsState.internships[0],
                  ),
                  AppliedInternshipItem(
                    sent: false,
                    status: false,
                    internship: internShipsState.internships[0],
                  ),
                  AppliedInternshipItem(
                    sent: false,
                    status: false,
                    internship: internShipsState.internships[0],
                  ),
                ],
              ),
              /*ListView.builder(
                  itemCount: internShipsState.internships.length,
                  itemBuilder: (context, index) {
                    return AppliedInternshipItem(
                      internship: internShipsState.internships[index],
                    );
                  }),*/
            ),
          ],
        ),
      );
    });
  }
}
