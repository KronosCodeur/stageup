import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget(
      {super.key, required this.image, required this.description});
  final String image;
  final String description;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      alignment: Alignment.center,
      width: size.width * 0.9,
      height: size.height * 0.65,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: size.width * 0.9,
            height: size.height * 0.4,
          ),
          const Gap(10),
          Text(
            description,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
