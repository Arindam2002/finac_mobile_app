import 'package:flutter/material.dart';

class Client {
  final String name;

  Client(this.name);
}

class Report {
  final IconData icon;
  final String title;
  final String description;

  Report(this.icon, this.title, this.description);
}

class Ledger {
  final String name;

  Ledger(this.name);
}

Future<List<Client>> fetchClients() async {
  await Future.delayed(const Duration(seconds: 2));

  return List<Client>.generate(20, (index) => Client('Client $index'));
}

Future<List<Report>> fetchReportsFromApi() async {
  await Future.delayed(const Duration(seconds: 2));

  return List<Report>.generate(
    10,
    (index) => Report(
      Icons.account_balance,
      'Report $index',
      'This is a description of report $index',
    ),
  );
}

Future<List<Ledger>> fetchLedgersFromApi() async {
  await Future.delayed(const Duration(seconds: 2));

  return List<Ledger>.generate(20, (index) => Ledger('Ledger $index'));
}