import 'package:chat_app/constants/color_constants.dart';
import 'package:chat_app/features/conversation_list/presentation/pages/conversations_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const id="home_page";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final HomeBloc homeBloc=HomeBloc();
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Shoopy Chat",style: TextStyle(color: active_color)),
          backgroundColor: primary_color,
          bottom: const TabBar(tabs: [
            Tab(text: "Chats",),
            Tab(text: "Updates"),
            Tab(text: "Calls"),
          ],labelColor: active_color,
            unselectedLabelColor: inactive_color,
            indicatorColor: secondary_color,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        body: BlocConsumer<HomeBloc,HomeState>(
          bloc: homeBloc,
          listenWhen: (prev,curr)=>curr is HomeActionState,
          buildWhen: (prev,curr)=>curr is !HomeActionState,
          builder: (context,state){
            switch(state.runtimeType)
            {
              case HomeLoadingState:
                return TabBarView(
                  children: [
                    Text("Loading Chats"),
                    Text("Updates"),
                    Text("Calls"),
                  ],
                );
              case HomeLoadedSuccessState:
                return TabBarView(
                  children: [
                    ConversationPage(),
                    Text("Updates"),
                    Text("Calls"),
                  ],
                );
              case HomeErrorState:
                return TabBarView(
                  children: [
                    Text("Error Occured while loading chats"),
                    Text("Updates"),
                    Text("Calls"),
                  ],
                );
              default:
                return Container(
                  child:Text("Default Case in Home Page")
                );
            }
          },
          listener: (context,state){
            if(state is HomeNavigatetoProfilePageActionState){
              //Navigator.pushNamed(context,)
            }
          },
        ),
      ),
    );
  }
}


