import 'package:chat_app/core/models/ProfileModel.dart';
import 'package:chat_app/features/chat_detail/presentation/pages/chat_page.dart';
import 'package:chat_app/features/conversation_list/presentation/manager/conversation_bloc.dart';
import 'package:flutter/material.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/defaults.dart';

class ConversationCard extends StatelessWidget {
  const ConversationCard({
    super.key,
    required this.width,
    required this.height,
    required this.profile,
    required this.conversationBloc
  });

  final double width;
  final double height;
  final ProfileModel profile;
  final ConversationBloc conversationBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: width*0.015,vertical: height*0.015),
      child: GestureDetector(
        onTap: () {
              conversationBloc.add(NavigateToChatDetailEvent(profile: profile));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(profile.profilePic!=null ? profile.profilePic!: defaultPic),
              radius: height*0.037,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name ?? 'Unknown User',
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

