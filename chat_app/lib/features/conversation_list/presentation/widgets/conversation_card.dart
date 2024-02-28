import 'package:chat_app/features/chat_detail/presentation/pages/chat_page.dart';
import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';

class ConversationCard extends StatelessWidget {
  const ConversationCard({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width*0.015,vertical: height*0.015),
      child: GestureDetector(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              foregroundColor: active_color,
              radius: height*0.037,
            ),
            const SizedBox(
              width: 10,
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "User Name",
                  style: TextStyle(color: user_name_text_color, fontSize: 20),
                ),
                Text(
                  "message data",
                  style: TextStyle(color: chat_text_color, fontSize: 14),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Divider(height: 2, thickness: 1, color: Colors.orange,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
