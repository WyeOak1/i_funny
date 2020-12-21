import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_funny/models/channel.dart';
import 'package:i_funny/services/channel_repository.dart';


import 'channel_event.dart';
import 'channel_state.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  final ChannelRepository channelRepository;

  ChannelBloc(this.channelRepository) : super(ChannelEmptyState());

  @override
  Stream<ChannelState> mapEventToState(ChannelEvent event) async* {
    if (event is ChannelLoadEvent) {
      yield ChannelLoadingState();
      try {
        final List<Channel> _loadedChannelList = await channelRepository.getAllChannel();
        yield ChannelLoadedState(loadedChannel: _loadedChannelList);
      } catch (e) {
        yield ChannelErrorState();
        print(e);
      }
    } else if (event is ChannelClearEvent) {
      yield ChannelEmptyState();
    }
  }
}
