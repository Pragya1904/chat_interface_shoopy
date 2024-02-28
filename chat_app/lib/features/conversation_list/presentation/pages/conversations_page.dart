import 'package:chat_app/constants/color_constants.dart';
import 'package:flutter/material.dart';

import '../widgets/conversation_card.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({Key? key}) : super(key: key);
  static const id="conversation_page";
  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override

  Widget build(BuildContext context)
  {
    var width=MediaQuery.sizeOf(context).width;
    var height=MediaQuery.sizeOf(context).height;
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ConversationCard(width: width,height: height);
      },
    );
  }
}

