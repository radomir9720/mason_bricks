import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

@sealed
abstract class CrashlyticsHelper {
  @literal
  const CrashlyticsHelper._();

  static Future<void> initialize({
    bool enable = kReleaseMode,
  }) async {
    try {
      final crashlytics = FirebaseCrashlytics.instance;
      final isCrashlyticsEnabled = crashlytics.isCrashlyticsCollectionEnabled;

      if (enable == isCrashlyticsEnabled) return;
      await crashlytics.setCrashlyticsCollectionEnabled(enable);
    } on Object catch (_) {}
  }

  /// Records error to firebase crashlytics
  static void recordError(Object error, StackTrace stackTrace) {
    try {
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    } on Object catch (_) {}
  }

  /// Logs message to firebase crashlytics
  static void log(String message) {
    try {
      FirebaseCrashlytics.instance.log(message);
    } on Object catch (_) {}
  }

  /// Records flutter error to firebase crashlytics
  static void recordFlutterError(FlutterErrorDetails details) {
    try {
      FirebaseCrashlytics.instance.recordFlutterError(details);
    } on Object catch (_) {}
  }
}

class FirebaseBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    CrashlyticsHelper.recordError(error, stackTrace);
  }
}
