class ChatRoomModel {
  String? chatroomId;
  Map<String,dynamic>? participants;
  String? lastMessage;

  ChatRoomModel({this.chatroomId, this.participants,this.lastMessage});

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) => ChatRoomModel(
        chatroomId: json['chatroomid'],
        participants:json['participants'],
        lastMessage: json['lastmessage']
      );

  Map<String, dynamic> toJson() => {
        'chatroomid': chatroomId,
        'participants': participants,
        'lastmessage':lastMessage
      };
}

