import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stageup/config/theme/theme.dart';
import 'package:stageup/core/helpers/date_helper.dart';
import 'package:stageup/features/applications/ui/manager/application_manager.dart';
import 'package:stageup/features/interships/domain/entities/intership.dart';
import 'package:stageup/features/interships/ui/manager/intership_manager.dart';
import 'package:stageup/features/security/ui/manager/security_manager.dart';
import 'package:stageup/skeleton/widgets/primary_button.dart';

class InternshipInfoPage extends StatelessWidget {
  const InternshipInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Consumer3<InternshipManager, ApplicationManager, SecurityManager>(
        builder:
            (context, internshipState, applicationsState, security, child) {
      Internship internship = internshipState.selectedInternship!;
      bool alreadyApplied = applicationsState.applications!
          .any((element) => element.internshipId == internship.id);
      return Scaffold(
        body: Stack(
          children: [
            Container(
              color: AppTheme.primary,
              alignment: Alignment.topCenter,
              width: size.width,
              padding: const EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
              ),
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 35,
                          color: AppTheme.white,
                        ),
                        onTap: () => GoRouter.of(context).pop(),
                      ),
                      Text(
                        internship.company.name,
                        style: const TextStyle(
                          color: AppTheme.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        child: const Icon(
                          Icons.more_vert_rounded,
                          size: 35,
                          color: AppTheme.white,
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.only(
                  top: size.height * 0.125,
                  left: 20,
                  right: 20,
                  bottom: size.height * 0.0875,
                ),
                decoration: const BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                width: size.width,
                height: size.height * 0.75,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        internship.title,
                        style: const TextStyle(
                          color: AppTheme.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Gap(10),
                      SizedBox(
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.location_city,
                                  size: 15,
                                  color: AppTheme.gray,
                                ),
                                const Gap(3),
                                Text(
                                  internship.company.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: AppTheme.gray,
                                  ),
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            const Gap(10),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 15,
                                  color: AppTheme.gray,
                                ),
                                const Gap(3),
                                Text(
                                  internship.company.address,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: AppTheme.gray,
                                  ),
                                  softWrap: true,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Gap(10),
                      Container(
                        width: size.width,
                        height: 100,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          border: Border.all(
                            color: AppTheme.gray,
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Text("Date limite"),
                                  Gap(5),
                                  Text(
                                    DateTimeHelper.getStringDate(
                                      DateTime.parse(
                                        internship.endAt,
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 75,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppTheme.gray,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                children: [
                                  Text(
                                    "Durée : 6 Mois",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                  Gap(5),
                                  Gap(5),
                                  Text(
                                    "6 Mois",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(10),
                      const Text(
                        "Description",
                        style: TextStyle(
                          color: AppTheme.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(5),
                      Text(
                        internship.description,
                        style: const TextStyle(
                          color: AppTheme.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const Gap(10),
                      const Text(
                        "Compétences réquises",
                        style: TextStyle(
                          color: AppTheme.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(5),
                      for (int index = 0;
                          index < internship.skills.split('.').length;
                          index++)
                        if (internship.skills.split('.')[index].length >= 5)
                          Text(
                            "* ${internship.skills.split('.')[index]}.",
                            style: const TextStyle(
                              color: AppTheme.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.start,
                          ),
                      const Gap(10),
                      const Text(
                        "Responsabilités",
                        style: TextStyle(
                          color: AppTheme.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(5),
                      for (int index = 0;
                          index < internship.responsibilities.split('.').length;
                          index++)
                        if (internship.responsibilities
                                .split('.')[index]
                                .length >=
                            5)
                          Text(
                            "* ${internship.responsibilities.split('.')[index]}.",
                            style: const TextStyle(
                              color: AppTheme.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            textAlign: TextAlign.start,
                          ),
                      const Gap(10),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: size.width * 0.15,
              right: size.width * 0.15,
              child: PrimaryButton(
                width: size.width * 0.7,
                vPadding: 10,
                elevation: alreadyApplied ? 0 : 5,
                onPressed: () async {
                  if (!alreadyApplied) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              internship.title,
                              style: const TextStyle(
                                color: AppTheme.black,
                              ),
                            ),
                            content: SizedBox(
                              height: size.height * 0.5,
                              width: size.width * 0.8,
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [],
                              ),
                            ),
                          );
                        });
                  }
                },
                color: alreadyApplied
                    ? AppTheme.primary.withOpacity(0.1)
                    : AppTheme.primary,
                child: Center(
                  child: Text(
                    alreadyApplied
                        ? 'Demande déja envoyée'
                        : 'Postuler pour ce stage',
                    style: TextStyle(
                      color: alreadyApplied ? AppTheme.primary : AppTheme.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.175,
              left: size.width * 0.35,
              child: Material(
                borderRadius: BorderRadius.circular(20),
                elevation: 5,
                child: Container(
                  width: size.width * 0.3,
                  height: size.width * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppTheme.white,
                    image: DecorationImage(
                      image: NetworkImage(
                        internship.company.logo,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
