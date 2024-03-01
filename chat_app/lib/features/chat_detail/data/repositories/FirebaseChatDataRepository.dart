import 'package:chat_app/core/models/ProfileModel.dart';
import 'package:chat_app/features/chat_detail/domain/repositories/ChatRepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/models/ChatRoomModel.dart';

class FirebaseChatDataRepository {
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  Future<ChatRoomModel?> getOrCreateChatRoom(ProfileModel profile)async{
        ChatRoomModel chatRoom;
        DocumentSnapshot chatRoomSnapshot=await _firestore.collection('chatrooms').doc(profile.uid).get();
        if(chatRoomSnapshot.exists){
          var docData=chatRoomSnapshot.data();
          ChatRoomModel existingChatRoom=ChatRoomModel.fromJson(docData as Map<String,dynamic>);
          chatRoom=existingChatRoom;
        }
        else
        {
          ChatRoomModel newChatRoom=ChatRoomModel(
            chatroomId: profile.uid,
            lastMessage: "",
            participants: {
              "me": true,
              profile.name:true,
            });
          await FirebaseFirestore.instance.collection("chatrooms").doc(newChatRoom.chatroomId).set(newChatRoom.toJson());
          chatRoom=newChatRoom;
        }
        return chatRoom;
  }
 
}
