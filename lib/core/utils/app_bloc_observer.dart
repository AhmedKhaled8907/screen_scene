import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('{bloc $bloc event : $Change}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('{bloc $bloc error : $Change}');
    super.onError(bloc, error, stackTrace);
  }

  // @override
  // void onChange(BlocBase bloc, Change change) {
  //   super.onChange(bloc, change);
  //   log('{bloc $bloc change : $Change}');
  // }

  @override
  void onChange(BlocBase bloc, Change change) {
    log(change.toString());
    super.onChange(bloc, change);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('{ Created $bloc }');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('{ Closed $bloc }');
  }
}
