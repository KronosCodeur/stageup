import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:stageup/config/routing/app_routes.dart';
import 'package:stageup/config/theme/theme.dart';
import 'package:stageup/skeleton/managers/on_boarding_manager.dart';
import 'package:stageup/skeleton/widgets/onboarding_widget.dart';
import 'package:stageup/skeleton/widgets/primary_button.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<OnBoardingManager>(
        builder: (context, onBoardingState, child) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OnboardingWidget(
                  image: onBoardingState
                      .screensInfos[onBoardingState.currentInfoIndex]['image']!,
                  description: onBoardingState
                          .screensInfos[onBoardingState.currentInfoIndex]
                      ['description']!),
              Gap(size.height * 0.005),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int index = 0;
                      index < onBoardingState.screensInfos.length;
                      index++)
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor:
                            index == onBoardingState.currentInfoIndex
                                ? AppTheme.primary
                                : AppTheme.gray,
                      ),
                    ),
                ],
              ),
              Gap(size.height * 0.1),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PrimaryButton(
                    onPressed: () {
                      onBoardingState.decrementInfoIndex();
                    },
                    color: AppTheme.white,
                    elevation: 0,
                    height: 50,
                    width: size.width * 0.35,
                    borderWidth: 2,
                    borderColor: AppTheme.primary,
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.arrow_back_rounded,
                          color: AppTheme.primary,
                          size: 25,
                        ),
                        Gap(10),
                        Text(
                          "Précédent",
                          style: TextStyle(
                            color: AppTheme.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(size.width * 0.1),
                  PrimaryButton(
                    onPressed: () {
                      onBoardingState.incrementInfoIndex();
                      if (onBoardingState.canGo) {
                        GoRouter.of(context)
                            .pushReplacementNamed(AppRoutes.loginRoute);
                      }
                    },
                    height: 50,
                    width: size.width * 0.35,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (onBoardingState.currentInfoIndex ==
                                  onBoardingState.screensInfos.length - 1)
                              ? "Continuer"
                              : "Suivant",
                          style: const TextStyle(
                            color: AppTheme.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const Gap(10),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: AppTheme.white,
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
