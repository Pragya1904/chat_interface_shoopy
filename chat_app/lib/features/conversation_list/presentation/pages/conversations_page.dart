import 'package:chat_app/constants/color_constants.dart';
import 'package:chat_app/features/chat_detail/presentation/pages/chat_page.dart';
import 'package:chat_app/features/conversation_list/presentation/manager/conversation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/ProfileModel.dart';
import '../widgets/conversation_card.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({Key? key}) : super(key: key);
  static const id = "conversation_page";
  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {

  final ConversationBloc conversationBloc = ConversationBloc();
  @override
  void initState() {
    conversationBloc.add(ConversationInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocConsumer<ConversationBloc, ConversationState>(
      bloc: conversationBloc,
      listenWhen: (prev, curr) => curr is ConversationActionState,
      buildWhen: (prev, curr) => curr is! ConversationActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case ConversationLoadingState:
            return Center(child: CircularProgressIndicator());
          case ConversationLoadedState:
            final successState = state as ConversationLoadedState;
            return ListView.builder(
              itemCount: successState.profiles.length,
              itemBuilder: (context, index) {
                return ConversationCard(
                  width: width,
                  height: height,
                  conversationBloc:conversationBloc,
                  profile:successState.profiles[index],
                  //name: successState.profiles[index].name,
                 // profilePic: successState.profiles[index].profilePic != null
                //      ? successState.profiles[index].profilePic!
                    //  : 'https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg',
                );
              },
            );
          case ConversationErrorState:
            return Center(child: Text("Error Occured"));
          default:
            return Center(child: Text("default case of conversations Page"));
        }
      },
      listener: (context, state) {
        if (state is ConversationNavigateToChatDetailActionState) {
          if(state.profile!=null){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatDetailPage(profile: state.profile)));
          }
          else
            {
              print("profile was found null in the state of ConversationActionState!!");
            }
          //Navigator.pushNamed(context, ChatDetailPage.id);
        }

      },
    );
  }
}

//
// return StreamBuilder<QuerySnapshot>(
// stream: _chatRooms,
// builder: (context, snapshot) {
// if (snapshot.hasError) {
// return Center(child: Text(snapshot.error.toString()));
// }
// if (snapshot.connectionState == ConnectionState.active) {
// if (!snapshot.hasData) {
// return Center(child: CircularProgressIndicator());
// }
// List<QueryDocumentSnapshot> conversations = snapshot.data!.docs;
//
// return ListView.builder(
// itemCount: conversations.length,
// itemBuilder: (context, index) {
// var conversationData = conversations[index].data() as Map<String, dynamic>;
// ProfileModel profile = ProfileModel.fromJson(conversationData);
//
// return ConversationCard(
// width: width,
// height: height,
// name: profile.name,
// profilePic: profile.profilePic!=null ? profile.profilePic! : 'https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg',
// );
// },
// );
// } else {
// return Center(child: CircularProgressIndicator());
// }
// },
// );
