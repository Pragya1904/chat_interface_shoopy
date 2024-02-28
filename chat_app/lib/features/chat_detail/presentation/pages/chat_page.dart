import 'package:chat_app/constants/color_constants.dart';
import 'package:flutter/material.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({Key? key}) : super(key: key);
  static const id="chat_detail_page";
  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary_color,
        actions: [
          Icon(Icons.video_call_rounded,color: secondary_color,),
          Icon(Icons.call,color:secondary_color,)
        ],
      ),
    );
  }
}
