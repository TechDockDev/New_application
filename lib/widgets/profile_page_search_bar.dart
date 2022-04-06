import 'package:flutter/material.dart';

class ProfilePageSearchbar extends SearchDelegate {
  List<String> data = [
    "data",
    //todo add list
  ];

  List<String> recentSearch = [
    "recent",
    //todo add list
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = "";
            Navigator.of(context).pop();
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.keyboard_arrow_left_rounded),
        onPressed: () => Navigator.pop(context));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (data.contains(query.toLowerCase())) {
      return ListTile(
        title: Text(query),
        onTap: () {},
      );
    } else if (query == "") {
      return const Text("");
    } else {
      return ListTile(
        title: const Text("No results found"),
        onTap: () {},
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: recentSearch.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recentSearch[index]),
            trailing: const Icon(
              Icons.keyboard_arrow_right_rounded,
            ),
            onTap: () {},
          );
        });
  }
}
