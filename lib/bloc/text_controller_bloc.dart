import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'text_controller_event.dart';
part 'text_controller_state.dart';

class TextControllerBloc
    extends Bloc<TextControllerEvent, TextControllerState> {
  TextEditingController controllerPG2 = TextEditingController();

  TextControllerBloc() : super(TextControllerInitial()) {
    on<TextControllerEvent>((event, emit) {
      if (event is ClearText) {
        controllerPG2.clear();
        emit(TextControllerErased());
      } else if (event is AddText) {
        controllerPG2.text = "${controllerPG2.text}123";
        emit(TextControllerUpdated("Bangalore"));
      }
    });
  }
}
