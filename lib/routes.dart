import 'package:finac_mobile_app/Screens/Authentication/login_screen.dart';
import 'package:finac_mobile_app/Screens/ClientReports/SelectPeriod.dart';
import 'package:finac_mobile_app/Screens/ClientReports/ledger_statement_screen.dart';
import 'package:finac_mobile_app/Screens/ClientReports/statement.dart';
import 'package:finac_mobile_app/Screens/SplashScreen/splash_screen.dart';
import 'package:finac_mobile_app/main.dart';
import 'package:flutter/material.dart';
import 'package:finac_mobile_app/Screens/ClientDashboard/client_dashboard.dart';
import 'package:finac_mobile_app/Screens/ClientReports/reports_screen.dart';
import 'package:finac_mobile_app/dummy.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    '/': (context) => const MyHomePage(title: 'Client List'),
    '/splashScreen': (context) => SplashScreen(),
    '/loginScreen': (context) => LoginScreen(),
    '/clientDashboard': (context) {
      final Client client =
      ModalRoute.of(context)!.settings.arguments as Client;
      final clientName = client.name;
      final clientInitials = client.name.substring(0, 2).toUpperCase();

      return ClientDashboard(
          clientName: clientName, clientInitials: clientInitials);
    },
    '/reports': (context) {
      final Map<String, String> args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      final clientName = args['clientName'];
      final clientInitials = args['clientInitials'];

      return Reports(clientName: clientName!, clientInitials: clientInitials!);
    },
    '/ledgerStatement': (context) => LedgerStatement(),
    '/selectPeriod': (context) => SelectPeriod(),
    '/statement': (context) => Statement(),
  };
}