
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_funny/bloc/channel/channel_bloc.dart';
import 'package:i_funny/services/channel_repository.dart';
import 'package:i_funny/widgets/nav_drawer.dart';
import 'component/channel_list.dart';

class ChannelsPage extends StatelessWidget {
  final channelRepository = ChannelRepository();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChannelBloc(channelRepository)),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('Channels'),
        ),
        drawer: NavDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ActionButtons(),
            Expanded(child: ChannelList()),
          ],
        ),
      ),
    );
  }
}
