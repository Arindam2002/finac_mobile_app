import 'package:finac_mobile_app/Components/CustomElevatedButton.dart';
import 'package:finac_mobile_app/Components/DateBoxComponent.dart';
import 'package:finac_mobile_app/Constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectPeriod extends StatefulWidget {
  @override
  _SelectPeriodState createState() => _SelectPeriodState();
}

class _SelectPeriodState extends State<SelectPeriod> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ledger Statement'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'SELECT DATE',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black54),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DateBox(
                        label: 'Start Date',
                        date: startDate,
                        onDateChanged: (date) {
                          setState(() {
                            startDate = date!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: DateBox(
                        label: 'End Date',
                        date: endDate,
                        onDateChanged: (date) {
                          setState(() {
                            endDate = date!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                CustomElevatedButton(
                  text: 'Current Financial Year',
                  backgroundColor: Colors.white,
                  textColor: kPrimaryColor,
                  onPressed: () {
                    setState(() {
                      startDate = DateTime(DateTime.now().year, 4, 1);
                      endDate = DateTime(DateTime.now().year + 1, 3, 31);
                    });
                  },
                ),
                CustomElevatedButton(
                  text: 'Previous Financial Year',
                  backgroundColor: Colors.white,
                  textColor: kPrimaryColor,
                  onPressed: () {
                    setState(() {
                      startDate = DateTime(DateTime.now().year - 1, 4, 1);
                      endDate = DateTime(DateTime.now().year, 3, 31);
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: CustomElevatedButton(
                text: 'Get Statement',
                onPressed: () {
                  Navigator.pushNamed(context, '/statement');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}