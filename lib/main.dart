import 'package:finac_mobile_app/Constants/constants.dart';
import 'package:finac_mobile_app/dummy.dart';
import 'package:finac_mobile_app/routes.dart';
import 'package:flutter/material.dart';

import 'Components/ClientCard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromView(WidgetsBinding.instance.window)
          .copyWith(textScaler: const TextScaler.linear(1.0)),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
          useMaterial3: true,
        ),
        initialRoute: '/splashScreen', // This is the route that the app opens on.
        routes: getRoutes(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: kPrimaryColor,
              ),
              child: Text('This is just an example drawer for demo purposes with temporary routes'),
            ),
            ListTile(
              title: const Text('Client Dashboard'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/clientDashboard',
                    arguments: Client('Client 1'));
              },
            ),
            ListTile(
              title: const Text('Reports'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/reports',
                    arguments: {'clientName': 'Client 1', 'clientInitials': 'C1'});
              },
            ),
            ListTile(
              title: const Text('Ledger Statement'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/ledgerStatement');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: FutureBuilder<List<Client>>(
          future: fetchClients(),
          builder: (BuildContext context, AsyncSnapshot<List<Client>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return ClientCard(
                      clientName: snapshot.data![index].name,
                      onPressed: () {
                        Navigator.pushNamed(context, '/clientDashboard',
                            arguments: snapshot.data![index]);
                      });
                },
              );
            }
          },
        ),
      ),
    );
  }
}
