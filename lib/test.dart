import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Center(
        child: Column(
          children: <Widget>[
            Text(_result ?? '', style: TextStyle(fontSize: 18)),
            ElevatedButton(
              onPressed: () async {
                var result = await showSearch<String>(
                  context: context,
                  delegate: CustomDelegate(),
                );
                setState(() => _result = result);
              },
              child: Text('Search'),
            ),
          ],
        ),
      ),
    );
  }
}

const nouns = ["salam", 'sagol', "hoho", "staring", "adam", "badam"];

class CustomDelegate extends SearchDelegate<String> {
  List<String> data = nouns.take(100).toList();

  @override
  List<Widget> buildActions(BuildContext context) =>
      [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      icon: Icon(Icons.chevron_left), onPressed: () => close(context, ''));

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    var listToShow;
    if (query.isNotEmpty)
      listToShow =
          data.where((e) => e.contains(query) && e.startsWith(query)).toList();
    else
      listToShow = data;

    return ListView.builder(
      itemCount: listToShow.length,
      itemBuilder: (_, i) {
        var noun = listToShow[i];
        return ListTile(
          title: Text(noun),
          onTap: () => close(context, noun),
        );
      },
    );
  }
}
