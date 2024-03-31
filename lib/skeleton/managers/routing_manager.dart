import 'package:flutter/material.dart';
import 'package:stageup/features/applications/ui/pages/applied_page.dart';
import 'package:stageup/features/interships/ui/pages/home_page.dart';
import 'package:stageup/features/interships/ui/pages/notifications_page.dart';
import 'package:stageup/features/user/ui/pages/account_page.dart';

class RoutingManager extends ChangeNotifier {
  final List<Map<String, dynamic>> pages = [
    {
      'title': 'Rechercher, Trouver et Postuler',
      'name': 'Accueil',
      'icon': Icons.home,
      'page': const HomePage(),
    },
    {
      'title': 'Demandes',
      'icon': Icons.assignment_ind,
      'name': 'Demandes',
      'page': const AppliedPage(),
    },
    {
      'title': 'Notifications',
      'icon': Icons.notifications,
      'name': 'Notifications',
      'page': const NotificationsPage(),
    },
    {
      'title': 'Mon Compte',
      'name': 'Compte',
      'icon': Icons.person,
      'page': const AccountPage(),
    }
  ];
  int currentPage = 0;

  setCurrentPage(int index) {
    currentPage = index;
    notifyListeners();
  }

  Widget getCurrentPage() {
    return pages[currentPage]['page'];
  }

  String getCurrentTitle() {
    return pages[currentPage]['title'];
  }

  IconData getCurrentIcon() {
    return pages[currentPage]['icon'];
  }

  String getCurrentName() {
    return pages[currentPage]['name'];
  }
}
