import 'package:equatable/equatable.dart';

class SliderState extends Equatable {
  final double sliderValue;

  SliderState({this.sliderValue = 1.0}); // initial value in constructor

  @override
  List<Object?> get props => [sliderValue];

  SliderState copyWith({double? sliderValue}) {
    return SliderState(sliderValue: sliderValue ?? this.sliderValue);
  }
}
