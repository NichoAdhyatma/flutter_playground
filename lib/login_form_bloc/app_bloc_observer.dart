import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print("${bloc.runtimeType} created!");
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    print(
        "${bloc.runtimeType} state changed from ${change.currentState} to ${change.nextState}");
  }
}
