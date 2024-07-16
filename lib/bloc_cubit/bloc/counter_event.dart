part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

final class CounterIncremented extends CounterEvent {}

final class CounterDecremented extends CounterEvent {}