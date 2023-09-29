import 'package:bloc/bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/modules/chatbot_screen/cubit/states.dart';
import 'package:http/http.dart' as http;

import '../../../shared/styles/colors.dart';

class chatBotCubit extends Cubit<chatBotStates>{
  chatBotCubit() : super(InitialState());

  static chatBotCubit get(context)=>BlocProvider.of(context);

  List myMessages = [];
  List botMessages = [];
  String flaskAppUrl = 'https://chatbotapp.azurewebsites.net/';
   buildMessageList ({required List myMessages}) => ConditionalBuilder(
    condition: myMessages.isNotEmpty,
    builder: (context) => ListView.separated(
      itemBuilder: (context,index) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColor.basecolor,
                  borderRadius: BorderRadiusDirectional.only(
                    bottomEnd: Radius.circular(10.0),
                    topStart: Radius.circular(10.0),
                    topEnd: Radius.circular(10.0),
                  )
              ),
              padding: EdgeInsets.symmetric(
                  vertical: 5.5,
                  horizontal: 10
              ),
              child: Column(
                children: [
                  Text(
                    '${myMessages[index]}',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context,index) => Padding(
        padding: const EdgeInsets.all(18.0),
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(10.0),
                  topStart: Radius.circular(10.0),
                  topEnd: Radius.circular(10.0),
                )
            ),
            padding: EdgeInsets.symmetric(
                vertical: 5.5,
                horizontal: 10
            ),
            child: Column(
              children: [
                Text(
                  'bot',
                  style: TextStyle(
                      color: Colors.black
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      itemCount: myMessages.length,
    ),
    fallback: (context) => Center(
      child: Text('data'),
    ),
  );

//************************************
  buildMessage(String message) => Padding(
    padding: const EdgeInsets.all(18.0),
    child: Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.basecolor,
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10.0),
              topStart: Radius.circular(10.0),
              topEnd: Radius.circular(10.0),
            )
        ),
        padding: EdgeInsets.symmetric(
            vertical: 5.5,
            horizontal: 10
        ),
        child: Column(
          children: [
            Text(
              '$message',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ],
        ),
      ),
    ),
  );
  buildBotMessage(String botMessage) => Padding(
    padding: const EdgeInsets.all(18.0),
    child: Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10.0),
              topStart: Radius.circular(10.0),
              topEnd: Radius.circular(10.0),
            )
        ),
        padding: EdgeInsets.symmetric(
            vertical: 5.5,
            horizontal: 10
        ),
        child: Column(
          children: [
            Text(
              '$botMessage',
              style: TextStyle(
                  color: Colors.black
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Future<String> sendMessage(String message) async {
    // Prepare the query parameters
    Map<String, String> params = {'msg': message};

    // Send a GET request to the Flask app
    Uri uri = Uri.parse(flaskAppUrl + 'get');
    Uri requestUri = uri.replace(queryParameters: params);
    final response = await http.get(requestUri);

    // Extract the response text
    String responseText = response.body;
    print(responseText);
    myMessages.add(responseText);
    emit(botMessageSendSuccessState());

    // Return the response
    return responseText;
  }

}