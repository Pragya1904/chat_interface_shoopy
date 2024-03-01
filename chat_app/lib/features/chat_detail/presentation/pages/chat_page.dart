import 'dart:math';

import 'package:chat_app/constants/color_constants.dart';
import 'package:flutter/material.dart';

import '../../../../constants/defaults.dart';
import '../../../../core/models/ProfileModel.dart';

class ChatDetailPage extends StatefulWidget {
  final ProfileModel profile;
  ChatDetailPage({Key? key, required this.profile}) : super(key: key);
  static const id="chat_detail_page";
  final int random = Random().nextInt(20); 
  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}
class _ChatDetailPageState extends State<ChatDetailPage> {
  TextEditingController _controller=TextEditingController();
  bool isTyping = false; // Added isTyping variable
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primary_color,
          leadingWidth: width*0.08,
          leading: IconButton(onPressed: (){

          },icon: Icon(Icons.arrow_back_ios_new,color:secondary_color,size: height*0.025,),),
          titleSpacing: 0,
          iconTheme: const IconThemeData(color: secondary_color), // Setting back button color to secondary_color
          title: Row(
            children: [
              CircleAvatar(radius: 20,backgroundImage: NetworkImage(widget.profile.profilePic!=null? widget.profile.profilePic! : defaultPic),),
              SizedBox(width: width*0.03,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.profile.name?? 'unknown user',style: TextStyle(fontSize: 19,color: secondary_color),),
                  Text("last seen before ${widget.random} minutes",style: TextStyle(fontSize: 10,color: secondary_color,fontWeight: FontWeight.w100),) // Use widget.random here
                ],
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: (){},icon: Icon(Icons.video_call_rounded,color:secondary_color),),

            IconButton(onPressed: (){},icon: Icon(Icons.call,color:secondary_color),),

            IconButton(onPressed: (){},icon: Icon(Icons.more_vert,color:secondary_color),),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                color: Colors.lightBlueAccent.withOpacity(0.5),
              ),
            ),
            Container(
              height: height*0.08,
              color: Colors.lightBlueAccent.withOpacity(0.5),
              padding: EdgeInsets.symmetric(horizontal: width*0.01,vertical: height*0.005),
              child: Center(
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Container(
                        decoration: BoxDecoration(
                          color: secondary_color,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        width: width*0.84,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.emoji_emotions_outlined,color: messagebar_icon_color,)),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: height*0.01),
                                child: TextFormField(
                                  controller: _controller,
                                  decoration: InputDecoration(hintText:"Enter message",border: InputBorder.none,),
                                  onChanged: (text) {
                                    setState(() {
                                      // Check if text is present in the TextFormField
                                      if (text.isNotEmpty) {
                                        isTyping = true;
                                      } else {
                                        isTyping = false;
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(onPressed: (){}, icon: Icon(Icons.attach_file,color:messagebar_icon_color ,)),
                                Visibility(
                                  visible: !isTyping,
                                    child: IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_rounded,color:messagebar_icon_color ,))),
                              ],
                            ),
                          ],
                        ),
                      ),
                    CircleAvatar(
                      radius: height*0.05,
                      backgroundColor: primary_color,
                      child: isTyping ? Center(child: Icon(Icons.send, color: secondary_color,size:height*0.035 ,)) : Icon(Icons.mic, color: secondary_color), // Updated icon based on isTyping value
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
