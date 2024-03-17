import 'package:finac_mobile_app/Components/ClientComponent.dart';
import 'package:finac_mobile_app/Components/DashboardCardComponent.dart';
import 'package:finac_mobile_app/Constants/constants.dart';
import 'package:finac_mobile_app/dummy.dart';
import 'package:flutter/material.dart';

class ClientDashboard extends StatelessWidget {
  final String clientName;
  final String clientInitials;

  ClientDashboard({
    required this.clientName,
    required this.clientInitials,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Client Dashboard'),
        leadingWidth: 24,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClientComponent(clientInitials: clientInitials, clientName: clientName),
              ),
              FutureBuilder<List<Report>>(
                future: fetchReportsFromApi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 14.0),
                          child: GradientCard(
                            icon: snapshot.data![index].icon,
                            title: snapshot.data![index].title,
                            description: snapshot.data![index].description,
                            onPressed: () {
                              Navigator.pushNamed(context, '/reports', arguments: {
                                'clientName': clientName,
                                'clientInitials': clientInitials,
                              });
                            },
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}