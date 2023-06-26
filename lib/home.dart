import 'package:first_flutter_project/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Model/route.dart';

class MyHo extends StatelessWidget {
  const MyHo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<Route1>? routeList = [];
  late double latitude1 = 0;
  late double longitude1 = 0;
  late double latitude2 = 0;
  late double longitude2 = 0;

  void _getData2() async {
    routeList = (await ApiService().getPosts2());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(
          () {},
        ));
  }

  List<int> numbers = [1, 2, 3, 4, 5];

  var arr = ["jon", "irra", "tom", "Jery"];

  _loop() async {
    print('enter');
    print(" Length--- $routeList");
    print(routeList!.length);
    print(_searchController);
    print(_searchController2);
    for (var name in routeList!) {
      print("------------------------");
      print('name');

      print(_searchController);
      print(name.location);
      if (_searchController == name.location) {
        latitude1 = name.latitude!;
        longitude1 = name.longitude!;
      }
      if (_searchController2 == name.location) {
        latitude2 = name.latitude!;
        longitude2 = name.longitude!;
      }
    }

    double? dis = (await ApiService()
        .getDistance(latitude1, longitude1, latitude2, longitude2, "km"));
    print(dis);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData2();
  }

  List<String> dataList = [
    'Hazrat Shahjalal International Airport,Dhaka',
    'Khilgaon Railgate,Khilgaon,Dhaka',
    'Banani Graveyard',
    'Bashundhara Residential Area,Dhaka',
    'Abul Hotel,Malibagh,Dhaka',
    'Basabo',
    'Grape',
    'Honeydew',
    'Imbe',
    'Jackfruit',
  ];
  List<String> filteredList = [];
  List<String> filteredList2 = [];

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

  void filterData2(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredList2 = dataList
            .where((data) => data.toLowerCase().contains(query.toLowerCase()))
            .take(2) // Set the number of suggestions to show (e.g., 2 or 3)
            .toList();
      });
    } else {
      setState(() {
        filteredList2 = [];
      });
    }
  }

  void selectSuggestion(String suggestion) {
    setState(() {
      _searchController.text = suggestion;
      filteredList = [];
    });
  }

  void selectSuggestion2(String suggestion) {
    setState(() {
      _searchController2.text = suggestion;
      filteredList2 = [];
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
              padding: EdgeInsets.only(left: 10, right: 10, top: 40),
              child: TextField(
                controller: _searchController,
                onChanged: filterData,
                decoration: InputDecoration(
                  labelText: 'Set your Location',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 20),
              child: TextField(
                controller: _searchController2,
                onChanged: filterData2,
                decoration: InputDecoration(
                  labelText: 'Where to go ?',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                child: ElevatedButton(
                    onPressed: () {
                      print("---------------------Test--------------");
                      _loop();
                    },
                    child: Text('Search'))),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length > 0
                  ? filteredList.length
                  : filteredList2.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(filteredList.length > 0
                      ? filteredList[index]
                      : filteredList2[index]),
                  onTap: () {
                    if (filteredList.length > 0) {
                      selectSuggestion(filteredList[index]);
                    } else {
                      selectSuggestion2(filteredList2[index]);
                    }
                  },
                );
              },
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: filteredList>0 ? filteredList.length : filteredList2.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return ListTile(
          //         title: Text(filteredList.length>0 ? filteredList[index]:filteredList2[index]),
          //         onTap: () {
          //           if(filteredList>0){selectSuggestion(filteredList[index]);}

          //         },
          //       );
          //     },
          //   ),
          // ),
          // Center(
          //   child: Container(
          //     height: 200,
          //     width: 600,
          //     child: Center(
          //       child: ListView(
          //         scrollDirection: Axis.horizontal,
          //         children: [
          //           Container(
          //             height: 50,
          //             width: 50,
          //             decoration: BoxDecoration(
          //               color: Colors.blue, // Background color
          //               image: DecorationImage(
          //                 image:
          //                     AssetImage('assets/one.jpg'), // Background image
          //                 fit: BoxFit.cover, // Image fit type
          //               ),
          //             ),
          //           ),
          //           Container(
          //             height: 50,
          //             width: 50,
          //             decoration: BoxDecoration(
          //               color: Colors.blue, // Background color
          //               image: DecorationImage(
          //                 image:
          //                     AssetImage('assets/two.jpg'), // Background image
          //                 fit: BoxFit.cover, // Image fit type
          //               ),
          //             ),
          //           ),
          //           Container(
          //             height: 50,
          //             width: 50,
          //             decoration: BoxDecoration(
          //               color: Colors.blue, // Background color
          //               image: DecorationImage(
          //                 image: AssetImage(
          //                     'assets/three.jpg'), // Background image
          //                 fit: BoxFit.cover, // Image fit type
          //               ),
          //             ),
          //           ),
          //           Container(
          //             height: 50,
          //             width: 50,
          //             decoration: BoxDecoration(
          //               color: Colors.blue, // Background color
          //               image: DecorationImage(
          //                 image:
          //                     AssetImage('assets/four.jpg'), // Background image
          //                 fit: BoxFit.cover, // Image fit type
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(),
    );
  }
}

class _HomePageState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30))),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Find Your',
                      style: TextStyle(color: Colors.black87, fontSize: 25),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Inspiration',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(244, 243, 243, 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black87,
                            ),
                            hintText: "Search you're looking for",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 15)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'Promo Today',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          promoCard('assets/one.jpg'),
                          promoCard('assets/two.jpg'),
                          promoCard('assets/three.jpg'),
                          promoCard('assets/four.jpg'),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/three.jpg')),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              stops: [
                                0.3,
                                0.9
                              ],
                              colors: [
                                Colors.black.withOpacity(.8),
                                Colors.black.withOpacity(.2)
                              ]),
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'Best Design',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget promoCard(image) {
    return AspectRatio(
      aspectRatio: 2.62 / 3,
      child: Container(
        margin: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage(image)),
        ),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                0.1,
                0.9
              ], colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.1)
              ])),
        ),
      ),
    );
  }
}
