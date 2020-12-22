import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_funny/bloc/channel/channel_bloc.dart';
import 'package:i_funny/bloc/channel/channel_event.dart';



class ActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final ChannelBloc channelBloc = BlocProvider.of<ChannelBloc>(context);
    
    channelBloc.add(ChannelLoadEvent());
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RaisedButton(
          child: Text('Load'),
          onPressed: () {
            channelBloc.add(ChannelLoadEvent());
          },
          color: Colors.green,
        ),
        SizedBox(width: 8.0),
        RaisedButton(
          child: Text('Clear'),
          onPressed: () {
            channelBloc.add(ChannelClearEvent());
          },
          color: Colors.red,
        )
      ],
    );
  }
  
}
