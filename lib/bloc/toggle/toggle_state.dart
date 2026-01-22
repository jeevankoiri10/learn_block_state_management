import 'package:equatable/equatable.dart';

class ToggleState extends Equatable {
  final bool isFavorited;
  const ToggleState({this.isFavorited = false});

  @override
  List<Object?> get props => [isFavorited];

  ToggleState copyWith({bool isFavorited = false}) {
    return ToggleState(isFavorited: isFavorited);
  }
}
