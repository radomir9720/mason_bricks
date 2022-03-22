import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle_4letter/app/helpers/crashlytics_helper.dart';

class FirebaseBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    CrashlyticsHelper.recordError(error, stackTrace);
  }
}
