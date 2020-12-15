import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'components/PostSection.dart';

class HomePage1 extends StatefulWidget {
  @override
  _HomePage1State createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {

  @override
  void initState() {
    super.initState();
    getData();
  }

  String data;
  var postsLength;
  int _selectedItemIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10, top: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: postsLength == null ? 0 : postsLength.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostSection(
                    data: data,
                    index: index,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void getData() async {
    http.Response response =
        await http.get("$baseUrl", headers: requestHeaders);
    if (response.statusCode == 200) {
      data = response.body;
      setState(() {
        postsLength = jsonDecode(data)['data']['content']['items'];
        print(postsLength.length);
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
