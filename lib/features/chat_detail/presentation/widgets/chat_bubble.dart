import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../../data/models/MessageModel.dart';
import '../manager/chat_bloc.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({Key? key, required this.width, required this.height, required this.chatBloc, required this.message}) : super(key: key);
  final double width;
  final double height;
  final ChatBloc chatBloc;
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    bool isUserMe=false;
    final radius=Radius.circular(10.0);
    if(message.sender=="me")
      {
        isUserMe=true;
      }
    return Container(
     margin: EdgeInsets.symmetric(horizontal:width*0.014,vertical:height*0.01) ,
      child: Row(
        mainAxisAlignment: isUserMe? MainAxisAlignment.end: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            constraints: BoxConstraints(maxWidth: width*0.37),
            padding: EdgeInsets.symmetric(
                vertical: 14, horizontal: 14),
            decoration: BoxDecoration(
                color: isUserMe? chat_bubble_color_1: chat_bubble_color_2,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(
                    20,
                  ),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(
                     isUserMe
                          ? 0
                          : 20),
                  topLeft: Radius.circular(
                     isUserMe
                          ? 20
                          : 0),
                ),
            ),
            child: Text(message.text.toString(),softWrap: true,maxLines: 20,),
            ),

        ],
      ),
    );
  }
}
