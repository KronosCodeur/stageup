import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stage_up/config/theme/theme.dart';
import 'package:stage_up/features/interships/data/models/intership_model.dart';
import 'package:stage_up/res/assets_res.dart';
import 'package:stage_up/skeleton/widgets/primary_button.dart';

class AppliedInternshipItem extends StatelessWidget {
  const AppliedInternshipItem(
      {super.key,
      required this.internship,
      required this.status,
      required this.sent});
  final InternshipModel internship;
  final bool status;
  final bool sent;
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
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.timelapse_outlined,
                          size: 15,
                          color: AppTheme.gray,
                        ),
                        Gap(5),
                        Text(
                          'il y a 4 jours',
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
                      onPressed: () {},
                      elevation: 0,
                      hPadding: 20,
                      vPadding: 10,
                      color: (status && sent)
                          ? AppTheme.primary.withOpacity(0.1)
                          : (!sent && !status)
                              ? AppTheme.error.withOpacity(0.1)
                              : AppTheme.warning.withOpacity(0.1),
                      child: Text(
                        (status && sent)
                            ? "Accepter"
                            : (!sent && !status)
                                ? "Rejeter"
                                : "En cours",
                        style: TextStyle(
                            color: (status && sent)
                                ? AppTheme.primary
                                : (!sent && !status)
                                    ? AppTheme.error
                                    : AppTheme.warning,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
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
