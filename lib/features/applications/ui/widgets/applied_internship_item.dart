import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stageup/config/theme/theme.dart';
import 'package:stageup/core/helpers/date_helper.dart';
import 'package:stageup/features/applications/domain/entities/application.dart';
import 'package:stageup/features/interships/domain/entities/intership.dart';
import 'package:stageup/res/assets_res.dart';
import 'package:stageup/skeleton/widgets/primary_button.dart';

class AppliedInternshipItem extends StatelessWidget {
  const AppliedInternshipItem(
      {super.key, required this.internship, required this.application});

  final Internship internship;
  final Application application;

  Color getStatusColor(String status) {
    switch (status) {
      case "Envoyer":
        return AppTheme.secondary;
      case "Accepter":
        return AppTheme.primary;
      case "Rejeter":
        return AppTheme.error;
      default:
        return AppTheme.secondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      width: size.width,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppTheme.gray,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: !(internship.company.logo.contains('https'))
                ? const CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      AssetsRes.ENTREPRISE,
                    ),
                  )
                : CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.transparent,
                    backgroundImage: NetworkImage(
                      internship.company.logo,
                    ),
                  ),
          ),
          const Gap(10),
          Expanded(
            flex: 10,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 10,
                      child: Text(
                        internship.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: true,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: AppTheme.black,
                            size: 20,
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_city,
                      size: 15,
                      color: AppTheme.gray,
                    ),
                    const Gap(8),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.timelapse_outlined,
                          size: 15,
                          color: AppTheme.gray,
                        ),
                        Gap(5),
                        Text(
                          DateTimeHelper.getStringDuration(
                            DateTime.parse(
                              application.appliedAt,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 12,
                            color: AppTheme.gray,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const Gap(20),
                    PrimaryButton(
                      elevation: 0,
                      onPressed: () {},
                      hPadding: 15,
                      vPadding: 10,
                      color:
                          getStatusColor(application.status).withOpacity(0.1),
                      child: Text(
                        application.status,
                        style: TextStyle(
                          color: getStatusColor(
                            application.status,
                          ),
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
