part of 'text_controller_bloc.dart';

@immutable
abstract class TextControllerEvent {}

class ClearText extends TextControllerEvent {}

class AddText extends TextControllerEvent {}
