

import '../../../../core/models/ChatRoomModel.dart';
import '../../../../core/models/ProfileModel.dart';

abstract class ChatRepository{
  Future<ChatRoomModel> getOrCreateChatRoom(ProfileModel profile);
}