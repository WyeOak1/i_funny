import 'package:flutter/foundation.dart';

abstract class ChannelState {}

class ChannelEmptyState extends ChannelState {}

class ChannelLoadingState extends ChannelState {}

class ChannelLoadedState extends ChannelState {
  List<dynamic> loadedChannel;
  ChannelLoadedState({@required this.loadedChannel});
  
}
class ChannelErrorState extends ChannelState {}

