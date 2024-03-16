import 'package:finac_mobile_app/Components/ClientComponent.dart';
import 'package:finac_mobile_app/Constants/constants.dart';
import 'package:finac_mobile_app/dummy.dart';
import 'package:flutter/material.dart';

class Reports extends StatelessWidget {
  final String clientName;
  final String clientInitials;

  const Reports(
      {super.key, required this.clientName, required this.clientInitials});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Reports'),
        leadingWidth: 24,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClientComponent(
                  clientInitials: clientInitials, clientName: clientName),
            ),
            ExpansionTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
                title: Text('Financials'),
                backgroundColor: Colors.white,
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                collapsedBackgroundColor: Colors.white,
                children: <Widget>[
                  ListTile(
                    title: Text('Ledger Statement'),
                    onTap: () {
                      Navigator.pushNamed(context, '/ledgerStatement');
                    },
                  ),
                  // Add more ListTiles here for other items under 'Financials'
                ],
              ),
          ]),
        ),
      ),
    );
  }
}
