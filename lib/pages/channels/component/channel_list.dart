import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_funny/bloc/channel/channel_bloc.dart';
import 'package:i_funny/bloc/channel/channel_event.dart';
import 'package:i_funny/bloc/channel/channel_state.dart';
import 'package:i_funny/pages/details/details_screen.dart';


import 'item_card.dart';

class ChannelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ChannelBloc channelBloc = BlocProvider.of<ChannelBloc>(context);
    channelBloc.add(ChannelLoadEvent());

    return BlocBuilder<ChannelBloc, ChannelState>(
      builder: (context, state) {
        if (state is ChannelEmptyState) {
          return Center(
            child: Text('No data. Press button "Load"'),
          );
        }

        if (state is ChannelLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ChannelLoadedState) {
          return GridView.builder(
              itemCount: state.loadedChannel.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) => ItemCard(
                    channel: state.loadedChannel[index],
                    press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            channelId: state.loadedChannel[index].id,
                          ),
                        )),
                  )
                  );
        }

        if (state is ChannelErrorState) {
          return Center(
            child: Text('error'),
          );
        }
        return Center(
          child: Text('asdasdas'),
        );
      },
    );
  }
}