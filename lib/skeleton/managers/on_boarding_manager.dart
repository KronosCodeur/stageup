import 'package:flutter/material.dart';
import 'package:stage_up/res/assets_res.dart';

class OnBoardingManager extends ChangeNotifier {
  final List<Map<String, String>> screensInfos = [
    {
      'image': AssetsRes.IMAGE_INCREASE,
      'description':
          "Connectez-vous facilement avec des entreprises de premier plan et maximisez vos opportunités professionnelles grâce à notre application mobile intuitive et conviviale."
    },
    {
      'image': AssetsRes.IMAGE_SEARCH,
      'description':
          "Découvrez une multitude de stages passionnants grâce à notre application, offrant un accès élargi à des opportunités enrichissantes pour votre parcours étudiant"
    },
    {
      'image': AssetsRes.IMAGE_INCREASE,
      'description':
          "Simplifiez votre processus de recherche de stages avec notre application, réduisant efficacement les délais de recrutement pour une expérience fluide et dynamique."
    },
  ];
  int currentInfoIndex = 0;

  bool canGo = false;

  incrementInfoIndex() {
    if (currentInfoIndex < screensInfos.length - 1) {
      currentInfoIndex++;
      notifyListeners();
    } else {
      canGo = true;
    }
    notifyListeners();
  }

  decrementInfoIndex() {
    if (currentInfoIndex > 0) {
      currentInfoIndex--;
      notifyListeners();
    }
    notifyListeners();
  }
}
