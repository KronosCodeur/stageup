import 'package:flutter/cupertino.dart';
import 'package:stageup/features/security/ui/widgets/connexion_infos_widget.dart';
import 'package:stageup/features/security/ui/widgets/personnal_infos_widget.dart';
import 'package:stageup/features/security/ui/widgets/references_widget.dart';

class RegisterStepManager extends ChangeNotifier {
  List<Widget> steps = [
    PersonalInfosWidget(),
    ReferencesInfosWidget(),
    ConnexionInfosWidget()
  ];
  int stepIndex = 0;

  setIndex(int value) {
    stepIndex = value;
    notifyListeners();
  }

  Widget getCurrentStep() {
    Widget currentStep = steps[stepIndex];
    notifyListeners();
    return currentStep;
  }
}
