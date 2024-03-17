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

class StatementDetail {
  final String date;
  final String name;
  final double debit;
  final double credit;
  final double balance;
  final String description;
  final String documentNumber;
  final String category;

  StatementDetail(
    this.date,
    this.name,
    this.debit,
    this.credit,
    this.balance,
    this.description,
    this.documentNumber,
    this.category,
  );
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

Future<List<StatementDetail>> fetchStatementDetailsFromApi() async {
  // await Future.delayed(const Duration(seconds: 2));

  return List<StatementDetail>.generate(
    20,
    (index) => StatementDetail(
      '2021-01-01',
      'Statement Detail $index',
      100.0,
      100.0,
      100.0,
      'This is a description of statement detail $index',
      '12345',
      'Sales',
    ),
  );
}