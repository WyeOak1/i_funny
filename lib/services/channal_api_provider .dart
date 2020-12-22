import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:i_funny/constants.dart';
import 'package:i_funny/models/channel.dart';

class ChannelProvider {


  Future<List<Channel>> getChannels(String url) async {
    List<Channel> channels = [];
    var response = await http.get(url, headers: channelsRequestHeaders);
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
