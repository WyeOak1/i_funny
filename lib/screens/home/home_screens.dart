import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:i_funny/screens/favorite/favorite_screens.dart';
import 'package:i_funny/screens/home/components/PostSection.dart';
import 'package:i_funny/screens/home/components/Story.dart';

class KekFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var images = [];
  // var data;
  @override
  void initState() {
    super.initState();
    // var data = ImagesApiClient().fetchPhotos();
    // print(data.asStream().forEach((element) {element.forEach((element) {element.id;});}));

    // print(data.asStream().forEach((element) {print(element.first.pic);}));
    getData();

    // getJSONData();
  }

  String data;
  var superheros_length;
  int _selectedItemIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kek",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[500]),
            ),
            
            Container(
              height: 2,
              color: Colors.grey[300],
              margin: EdgeInsets.symmetric(horizontal: 30),
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    superheros_length == null ? 0 : superheros_length.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostSection(
                    urlPost: jsonDecode(data)['data']['content']['items'][index]
                        ['url'], urlProfilePhoto: jsonDecode(data)['data']['content']['items'][index]['url'],
                        smile: jsonDecode(data)['data']['content']['items'][index]
                        ['num']['smiles'],
                        views: jsonDecode(data)['data']['content']['items'][index]
                        ['num']['views'],
                  );
                  Card(
                    child: ListTile(
                      leading: Image.network(
                        jsonDecode(data)['data']['content']['items'][index]
                            ['url'],
                        fit: BoxFit.fill,
                        width: 100,
                        height: 500,
                        alignment: Alignment.center,
                      ),
                      title: Text(jsonDecode(data)['data']['content']['items']
                          [index]['url']),
                      subtitle: Text(jsonDecode(data)['data']['content']
                          ['items'][index]['id']),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 60,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.add,
            ),
            backgroundColor: Colors.grey[900],
            elevation: 15,
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
              )
            ],
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            buildNavBarItem(Icons.home, 0),
            buildNavBarItem(Icons.search, 1),
            buildNavBarItem(null, -1),
            buildNavBarItem(Icons.notifications, 2),
            buildNavBarItem(Icons.person, 3),
          ],
        ),
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedItemIndex = index;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 5,
        height: 45,
        child: icon != null
            ? Icon(
                icon,
                size: 25,
                color: index == _selectedItemIndex
                    ? Colors.black
                    : Colors.grey[700],
              )
            : Container(),
      ),
    );
  }

  void getData() async {
    http.Response response =
        await http.get("$baseUrl", headers: requestHeaders);
    if (response.statusCode == 200) {
      data = response.body; //store response as string
      setState(() {
        superheros_length = jsonDecode(data)['data']['content']
            ['items']; //get all the data from json string superheros
        print(superheros_length.length); // just printed length of data
      });
      var venam = jsonDecode(data)['data']['content']['items'][4]['link'];
      print(venam);
    } else {
      print(response.statusCode);
    }
  }

  static const baseUrl = 'https://api.ifunny.mobi/v4/feeds/featured?limit=5';

  Map<String, String> requestHeaders = {
    'Accept': 'application/json,image/jpeg,image/webp,video/mp4',
    'iFunny-Project-Id': 'Russia',
    'Accept-Language': 'ru-RU',
    'Messaging-Project': 'idaprikol.ru:idaprikol-60aec',
    'ApplicationState': '1',
    'Authorization':
        'Basic MDIzNTYxMzY2NDYxMzY2MzMzMkQ2NDMyMzU2MzJEMzQ2MzY0NjQyRDM4Mzg2MzM1MkQzMDMyMzQzNjYyMzkzOTMxNjEzNjY2MzZfUHpuNEQxMnNvSzo5Nzg0ZjE2MzZlYzdhYjE4YmI5YzczNmNhZjg0MzY1Mzc3M2M5Y2Mz',
    'Host': 'api.ifunny.mobi',
    'Connection': 'close',
    'Accept-Encoding': 'gzip, deflate',
    'If-Modified-Since': 'Tue, 08 Dec 2020 19:55:50 GMT',
    'User-Agent':
        'iDaPrikol/6.15.4(1119163) Android/6.0 (Xiaomi; Redmi Note 4; Xiaomi)',
  };
}
