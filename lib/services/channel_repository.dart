import 'package:i_funny/models/channel.dart';

import 'channal_api_provider .dart';

class ChannelRepository {
  ChannelProvider _channelProvider = ChannelProvider();
  Future<List<Channel>> getAllChannel() => _channelProvider.getChannels();
}