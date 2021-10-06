import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taif/controller/app_controller.dart';
import 'package:taif/dio/dio_helper.dart';
import 'package:taif/models/chat_model.dart';
import 'package:taif/screens/secondary_screens/chat_screen/cubit/state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitState());

  static ChatCubit get(context) => BlocProvider.of(context);

  ChatModel chatModel = ChatModel();
  Messages messages = Messages();

  void getAllChats() {
    emit(ChatLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'chats?user_id=${AppController.instance.getId()}')
        .then((value) {
      print(value.data);
      if (value.statusCode == 200) {
        print('here chat');
        chatModel = ChatModel.fromJson(value.data);
      }
      emit(ChatSuccessState());
    }).catchError((e) {
      print('chat error estate  $e');
      emit(ChatErrorState());
    });
  }

  void getSingleChat({required int chatId}) {
    emit(ChatLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'chats/$chatId?user_id=${AppController.instance.getId()}')
        .then((value) {
      print(value.data);
      if (value.statusCode == 200) {
        print('here chat');
        chatModel = ChatModel.fromJson(value.data);
      }
      emit(ChatSuccessState());
    }).catchError((e) {
      print('chat error estate  $e');
      emit(ChatErrorState());
    });
  }


  void createChat({
    required int subjectId,
    required String model
}) {
    emit(ChatLoadingState());
    DioHelper.init();
    DioHelper.getData(url: 'chats/create?user_id=${AppController.instance.getId()}&subject_class=$model&subject_id=$subjectId')
        .then((value) {
      print("value.data");
      print(value.data);
      print("value.data");

      if (value.statusCode == 200) {
        print('here chat');
        chatModel = ChatModel.fromJson(value.data);
      }
      emit(ChatSuccessState());
    }).catchError((e) {
      print('chat error estate  $e');
      emit(ChatErrorState());
    });
  }


  void sendMessage({
    required String content,
    required int chatId,

  }) {

    DioHelper.init();
    DioHelper.postData(url: 'chats', data: {
      'content': content,
      'user_id': AppController.instance.getId(),
      'chat_id': chatId,

    }).then((value) {
      print(value.data);
     if(value.statusCode == 201){


     }
    }).catchError((e) {
      print('Error Login Screen $e');

    });
  }

}
