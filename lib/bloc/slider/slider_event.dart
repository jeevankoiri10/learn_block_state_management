// ESB
// ESB

// ESB

// ESB

// ESB

// ESB

// Event State bloc ; start building the event first, then build the state next and finally build the bloc.

// Event page

import 'package:equatable/equatable.dart';

abstract class SliderEvent extends Equatable {
  // constructor not needed for the abstract class
  @override
  List<Object?> get props => [];
}

class SlideEvent extends SliderEvent {
  final double newValue;
  SlideEvent({required this.newValue});

  @override
  List<Object?> get props => [newValue];
}
