import 'package:chat_app/constants/color_constants.dart';
import 'package:chat_app/core/models/ProfileModel.dart';
import 'package:chat_app/features/chat_detail/presentation/pages/chat_page.dart';
import 'package:chat_app/features/conversation_list/presentation/pages/conversations_page.dart';
import 'package:chat_app/features/home/presentation/pages/home_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

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

