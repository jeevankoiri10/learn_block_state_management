import 'package:equatable/equatable.dart';

abstract class ToggleEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ToggleButtonEvent extends ToggleEvent {}
