import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:stage_up/config/theme/theme.dart';
import 'package:stage_up/features/interships/data/models/intership_model.dart';
import 'package:stage_up/res/assets_res.dart';

class InternshipItem extends StatelessWidget {
  const InternshipItem({super.key, required this.internship});

  final InternshipModel internship;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        width: size.width,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppTheme.gray,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  flex: 9,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        internship.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.location_city,
                            size: 20,
                            color: AppTheme.gray,
                          ),
                          const Gap(8),
                          Text(
                            internship.company.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
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
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.bookmark_outline_rounded,
                      color: AppTheme.black,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
            const Gap(10),
            Text(
              internship.description,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              softWrap: true,
              textAlign: TextAlign.start,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const Gap(10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                      'il y a 4 jours',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.gray,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Gap(20),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.person_outline_rounded,
                      size: 15,
                      color: AppTheme.gray,
                    ),
                    Gap(5),
                    Text(
                      '24 Postulants',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.gray,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
