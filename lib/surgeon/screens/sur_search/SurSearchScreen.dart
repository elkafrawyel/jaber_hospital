import 'package:base_flutter/surgeon/models/patient_details_model.dart';
import 'package:flutter/material.dart';

import 'debouncer.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _debouncer = Debouncer(milliseconds: 500);
  String _searchTerm = '';
  List<Patient> _results = [];

  Future<void> _getSearchResults(String searchTerm) async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme.copyWith(
              color: Theme.of(context).primaryColor,
            ),
        titleSpacing: 0,
        title: TextField(
          decoration: InputDecoration(
              hintText: 'Search Patient...',
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none),
          onChanged: (value) {
            _debouncer.run(() {
              setState(() {
                _searchTerm = value;
              });
              _getSearchResults(value);
            });
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: _results.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterLogo(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'No Results',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 48),
                  child: Text(
                    'There are no search results for this till now, please try again later',
                    style: TextStyle(),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: _results.length,
              itemBuilder: (context, index) {
                final result = _results[index];
                return ListTile(
                  title: Text('Patient Name'),
                  subtitle: Text('01019744661'),
                );
              },
            ),
    );
  }
}
