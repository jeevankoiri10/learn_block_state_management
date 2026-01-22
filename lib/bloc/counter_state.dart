import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

class CounterState extends Equatable {
  final int count;
  const CounterState({this.count = 0});

  CounterState copyWith({int? count}){
      return CounterState(count: count ?? this.count);
  }

  @override
  List<Object?> get props => [count];
}
