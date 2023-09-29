import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graduation_project/modules/chatbot_screen/cubit/cubit.dart';
import 'package:graduation_project/modules/chatbot_screen/cubit/states.dart';
import 'package:graduation_project/shared/component/components.dart';

import '../../shared/styles/colors.dart';


class chatbot_screen extends StatefulWidget {
   chatbot_screen({Key? key}) : super(key: key);

  @override
  State<chatbot_screen> createState() => _chatbot_screenState();
}

class _chatbot_screenState extends State<chatbot_screen> {
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => chatBotCubit(),
      child: BlocConsumer<chatBotCubit,chatBotStates>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'ChatBot',
              ),
              centerTitle: true,
              titleTextStyle: GoogleFonts.openSans(
                fontSize: 25,
              ),
              backgroundColor: AppColor.basecolor,
              elevation: 0,
            ),
            body: /*chatBotCubit.get(context).buildMessageList(
                myMessages: chatBotCubit.get(context).myMessages,
            ),*/
            ConditionalBuilder(
              condition: chatBotCubit.get(context).myMessages.isNotEmpty,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context,index){
                            if(index == 0 || index == 2 || index == 4 || index == 6 || index == 8){
                             return chatBotCubit.get(context).buildMessage(chatBotCubit.get(context).myMessages[index]);
                            }
                            else{
                             return chatBotCubit.get(context).buildBotMessage(chatBotCubit.get(context).myMessages[index]);
                            }
                          },
                          separatorBuilder: (context,index) => SizedBox(
                            height: 0,
                          ),
                          itemCount: chatBotCubit.get(context).myMessages.length),
                    )
                  ],
                ),
              ),
              fallback: (context) => Container(),
            )
            ,
            //*****************************************************************************************
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(
                  left: 10,
                  bottom: 25.0),
              child: BottomAppBar(
                elevation: 0,
                child:Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: inputController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelStyle: GoogleFonts.openSans(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          labelText: 'Type a message',
                          enabledBorder:const OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(27)
                              ),
                              borderSide: BorderSide(
                                  color: Color(0xFF15467B))
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(27)
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFF15467B),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 55 ,
                      width: 55 ,
                      decoration: BoxDecoration(
                        color: AppColor.basecolor,
                        borderRadius: BorderRadius.all(
                            Radius.circular(25.0)
                        ),
                      ),
                      child: IconButton(
                        color: Colors.white,
                        onPressed: (){
                          setState(() {
                            chatBotCubit.get(context).myMessages.add(inputController.text);
                          });
                          setState(() {
                            chatBotCubit.get(context).sendMessage(inputController.text);
                          });
                          print(chatBotCubit.get(context).myMessages);
                          inputController.clear();
                        },
                        icon: Icon(
                          Icons.send_outlined,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
