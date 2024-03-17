import 'package:finac_mobile_app/Components/StatementDetailComponent.dart';
import 'package:finac_mobile_app/Constants/constants.dart';
import 'package:finac_mobile_app/dummy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Statement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Sony Sound Bar'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Start Date: ',
                              style:
                                  TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '01-01-2022',
                              style:
                                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: RichText(
                      text: const TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'End Date: ',
                              style:
                              TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: '01-01-2022',
                              style:
                              TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<StatementDetail>>(
              future:
                  fetchStatementDetailsFromApi(), // This function is not implemented in this code.
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: StatementDetailComponent(
                            detail: snapshot.data![index]),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
