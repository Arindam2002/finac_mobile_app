import 'package:finac_mobile_app/Components/SearchBarComponent.dart';
import 'package:finac_mobile_app/Constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:finac_mobile_app/dummy.dart';

class LedgerStatement extends StatefulWidget {
  const LedgerStatement({super.key});

  @override
  _LedgerStatementState createState() => _LedgerStatementState();
}

class _LedgerStatementState extends State<LedgerStatement> {
  final TextEditingController _searchController = TextEditingController();
  late Future<List<Ledger>> _ledgersFuture;
  final ValueNotifier<List<Ledger>> _filteredLedgers =
      ValueNotifier<List<Ledger>>([]);

  @override
  void initState() {
    super.initState();
    _ledgersFuture = fetchLedgersFromApi();
    _ledgersFuture.then((_) => _filterLedgers(''));
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    _filterLedgers(_searchController.text);
  }

  Future<void> _filterLedgers(String query) async {
    final ledgers = await _ledgersFuture;
    if (query.isEmpty) {
      _filteredLedgers.value = ledgers;
    } else {
      _filteredLedgers.value = ledgers
          .where((ledger) =>
          ledger.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Ledger Statement'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SearchBarComponent(
                controller: _searchController,
                onSearchChanged: _filterLedgers,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Text(
                'SELECT LEDGER',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black54),
              ),
            ),
            Divider(height: 0, color: Colors.grey,),
            FutureBuilder(future: _ledgersFuture, builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return ValueListenableBuilder(
                  valueListenable: _filteredLedgers,
                  builder: (context, List<Ledger> ledgers, child) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: ledgers.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Divider(height: 0, color: Colors.grey,),
                              ListTile(
                                title: Text(ledgers[index].name),
                                onTap: () {
                                  Navigator.pushNamed(context, '/selectPeriod',
                                      arguments: ledgers[index]);
                                },
                                dense: true,
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  },
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
