
import 'package:chat_app/features/chat_detail/data/models/MessageModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoadChatsRepository{
  final String chatroomId;

  LoadChatsRepository({required this.chatroomId});

  Future<List<MessageModel>> LoadChats() async{
      final CollectionReference collectionReference=FirebaseFirestore.instance.collection("chatrooms").doc(chatroomId).collection("messages");
      final QuerySnapshot snapshot=await collectionReference.orderBy("createdon",descending: true).get();

      final List<MessageModel> messages=snapshot.docs.map((doc)=> MessageModel.fromJson(doc.data() as Map<String,dynamic>)).toList();
      print("Messages Loaded Successfully!!!");

      return messages;
  }
}