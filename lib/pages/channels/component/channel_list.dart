import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:i_funny/bloc/channel/channel_bloc.dart';
import 'package:i_funny/bloc/channel/channel_state.dart';


class ChannelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
          return Swiper(
            itemCount: state.loadedChannel.length,
            itemBuilder: (context, index) {
              return Image.network(
                state.loadedChannel[index].url,
                fit: BoxFit.cover,
              );
            },
          );
        }

        // if (state is ChannelLoadedState) {
        //   return ListView.builder(
        //     itemCount: state.loadedChannel.length,
        //     itemBuilder: (context, index) => Container(
        //       color: index % 2 == 0 ? Colors.white : Colors.blue[50],
        //       child: ListTile(
        //         leading: Text(
        //           'ID: ${state.loadedChannel[index].id}',
        //           style: TextStyle(fontWeight: FontWeight.bold),
        //         ),
        //         title: Column(
        //           children: <Widget>[
        //             Text(
        //               '${state.loadedChannel[index].url}',
        //               style: TextStyle(fontWeight: FontWeight.bold),
        //             ),
        //             Column(
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: <Widget>[
        //                 Text(
        //                   'Email: ${state.loadedChannel[index].name}',
        //                   style: TextStyle(fontStyle: FontStyle.italic),
        //                 ),
        //                 Text(
        //                   'Phone: ${state.loadedChannel[index].name}',
        //                   style: TextStyle(fontStyle: FontStyle.italic),
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   );
        // }
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
