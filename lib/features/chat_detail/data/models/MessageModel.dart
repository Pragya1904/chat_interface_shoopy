class MessageModel {
  String? messageId;
  String? sender;
  String? text;
  bool? seen;
  DateTime? createdOn;

  MessageModel({this.messageId,this.sender, this.text, this.seen, this.createdOn});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      messageId: json['messageid'],
      sender: json['sender'],
      text: json['text'],
      seen: json['seen'],
      createdOn: json['createdon'].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'messageid':messageId,
      'sender': sender,
      'text': text,
      'seen': seen,
      'createdon': createdOn,
    };
  }
}

