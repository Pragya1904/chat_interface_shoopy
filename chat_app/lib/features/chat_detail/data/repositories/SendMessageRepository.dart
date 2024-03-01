
import 'package:chat_app/features/chat_detail/data/models/MessageModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

var uuid=Uuid();
class SendMessageRepository{
  final String msg;
  final String chatroomId;

  SendMessageRepository({required this.msg, required this.chatroomId});

  void SendMessage(){
        if (msg!="")
        {
          //then we can send
            MessageModel newMessage=MessageModel(
              messageId: uuid.v1(),
              sender: "me",
              createdOn: DateTime.now(),
              text: msg,
              seen: false
            );
            FirebaseFirestore.instance.collection("chatrooms").doc(chatroomId).collection("messages").
            doc(newMessage.messageId).set(newMessage.toJson());
            print("Message Sent Successfully!!!");
        }
  }
}