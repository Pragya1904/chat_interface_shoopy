import 'package:chat_app/constants/color_constants.dart';
import 'package:chat_app/core/models/ProfileModel.dart';
import 'package:chat_app/features/chat_detail/data/repositories/FirebaseChatDataRepository.dart';
import 'package:chat_app/features/chat_detail/domain/repositories/ChatRepository.dart';
import 'package:chat_app/features/chat_detail/presentation/pages/chat_page.dart';
import 'package:chat_app/features/conversation_list/presentation/pages/conversations_page.dart';
import 'package:chat_app/features/home/presentation/pages/home_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  //setupDependencies();
  runApp(const MyApp());
}
//
// void setupDependencies() {
//   final getIt=GetIt.instance;
//
//   getIt.registerSingleton<ChatRepository>(FirebaseChatDataRepository());
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
   // ProfileModel profile=ProfileModel(name: "User Name");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary_color),
        useMaterial3: true,
      ),
      initialRoute: HomePage.id ,
      //home: ChatDetailPage(profile: profile),
      routes: {
        HomePage.id : (context) => HomePage(),
        ConversationPage.id:(context)=> ConversationPage(),
      //  ChatDetailPage.id:(context)=> ChatDetailPage(),
      },
    );
  }
}

