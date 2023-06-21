import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHo extends StatelessWidget {
  const MyHo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
          child: Column(
        children: [SearchPage(), SearchPage2()],
      )),
    );
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> dataList = [
    'Khilgaon Police Fari',
    'Khilgaon Model College',
    'Airport',
    'Basabo',
    'Mohammadpurmo',
    'Fig',
    'Grape',
    'Honeydew',
    'Imbe',
    'Jackfruit',
  ];
  List<String> filteredList = [];
  TextEditingController _searchController = TextEditingController();
  TextEditingController _searchController2 = TextEditingController();

  void filterData(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredList = dataList
            .where((data) => data.toLowerCase().contains(query.toLowerCase()))
            .take(2) // Set the number of suggestions to show (e.g., 2 or 3)
            .toList();
      });
    } else {
      setState(() {
        filteredList = [];
      });
    }
  }

  void selectSuggestion(String suggestion) {
    setState(() {
      _searchController.text = suggestion;
      filteredList = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dako'),
      ),
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 50),
              child: SizedBox(
                height: 50,
                child: TextField(
                  onChanged: filterData,
                  controller: _searchController,
                  decoration: InputDecoration(
                    labelText: 'Where From',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: SizedBox(
                height: 50,
                child: TextField(
                  onChanged: filterData,
                  controller: _searchController2,
                  decoration: InputDecoration(
                    labelText: 'Where to',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(filteredList[index]),
                  onTap: () {
                    selectSuggestion(filteredList[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SearchPage2 extends StatefulWidget {
  @override
  _SearchPageState2 createState() => _SearchPageState2();
}

class _SearchPageState2 extends State<SearchPage2> {
  List<String> dataList = [
    'Khilgaon Police Fari',
    'Khilgaon Model College',
    'Airport',
    'Basabo',
    'Mohammadpurmo',
    'Fig',
    'Grape',
    'Honeydew',
    'Imbe',
    'Jackfruit',
  ];
  List<String> filteredList = [];

  void filterData(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredList = dataList
            .where((data) => data.toLowerCase().contains(query.toLowerCase()))
            .take(2) // Set the number of suggestions to show (e.g., 2 or 3)
            .toList();
      });
    } else {
      setState(() {
        filteredList = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dako'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 50),
            child: SizedBox(
              height: 50,
              child: TextField(
                onChanged: filterData,
                decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(filteredList[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
