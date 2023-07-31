part of 'text_controller_bloc.dart';

@immutable
abstract class TextControllerState {}

class TextControllerInitial extends TextControllerState {}

class TextControllerErased extends TextControllerState {}

class TextControllerUpdated extends TextControllerState {
  final String address;
  TextControllerUpdated(this.address);
}
