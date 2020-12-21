import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:i_funny/models/channel.dart';

class ChannelProvider {
  String baseUrl = 'https://api.ifunny.mobi/v4/channels';
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

  Future<List<Channel>> getChannels() async {
    List<Channel> channels = [];
    var response = await http.get(baseUrl, headers: requestHeaders);
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 200) {
      jsonData["data"]["channels"]["items"].forEach((element) {
        if (element['id'] != null) {
          Channel channel = Channel(
              id: element['id'],
              name: element['name'],
              url: element['content']['thumb']['url']);
          channels.add(channel);
        }
      });
    }
    return channels;
  }
}
