// ignore_for_file: dead_null_aware_expression

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

extension ShortCutExtensions on num {
  double get si => SizeProvider.instance.sizeConverter.si(this);

  double get fo => SizeProvider.instance.sizeConverter.fo(this);
}

extension TextStyleFontSizeExtension on TextStyle {
  TextStyle get fo => copyWith(
        fontSize: fontSize?.fo,
      );
}

@immutable
class SizeConverter {
  const SizeConverter({
    required this.fo,
    required this.si,
  });

  const factory SizeConverter.original() = _OriginalSizeConverter;

  final double Function<T extends num>(T original) fo;

  final double Function<T extends num>(T original) si;
}

class _OriginalSizeConverter extends SizeConverter {
  const _OriginalSizeConverter()
      : super(
          fo: _returnOriginal,
          si: _returnOriginal,
        );

  static double _returnOriginal<T extends num>(T original) {
    return original.toDouble();
  }
}

@immutable
class SizeProvider {
  const SizeProvider._(this.sizeConverter);

  final SizeConverter sizeConverter;

  static SizeProvider? _instance;

  // ignore: prefer_constructors_over_static_methods
  static SizeProvider get instance {
    return _instance ??= const SizeProvider._(SizeConverter.original());
  }

  static void initialize({
    SizeConverter sizeConverter = const SizeConverter.original(),
  }) {
    if (_instance != null) {
      debugPrint('SizeProvider already was initialized');
      return;
    }
    _instance = SizeProvider._(sizeConverter);
  }
}

@immutable
class SizeProviderInherited extends InheritedWidget {
  @literal
  const SizeProviderInherited({
    required Widget child,
    this.sizeConverter = const SizeConverter.original(),
    Key? key,
  }) : super(
          key: key,
          child: child,
        );

  final SizeConverter sizeConverter;

  static SizeProviderInherited? of(BuildContext context) {
    final getInheritedElement = context.getElementForInheritedWidgetOfExactType;
    final inherited = getInheritedElement<SizeProviderInherited>();

    return inherited?.widget as SizeProviderInherited?;
  }

  @override
  bool updateShouldNotify(covariant SizeProviderInherited oldWidget) {
    return sizeConverter != sizeConverter || child != oldWidget.child;
  }
}

mixin SizeProviderStateMixin on StatelessWidget {
  @protected
  late final SizeProviderInherited? _inherited;

  double si<T extends num>(T original) =>
      _inherited?.sizeConverter.si(original) ?? original.toDouble();

  double fo<T extends num>(T original) =>
      _inherited?.sizeConverter.fo(original) ?? original.toDouble();

  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    _inherited ??= SizeProviderInherited.of(context);
    return const _NullWidget();
  }
}

class _NullWidget extends StatelessWidget {
  const _NullWidget();

  @override
  Widget build(BuildContext context) {
    throw FlutterError(
      'Widgets that mix AutomaticKeepAliveClientMixin into their State must '
      'call super.build() but must ignore the return value of the superclass.',
    );
  }
}

mixin SizeProviderMixin {
  @protected
  BuildContext get context;

  Widget build(BuildContext context);

  @protected
  SizeProviderInherited? _inherited;

  @protected
  bool _cached = false;

  SizeProviderInherited? get inherited {
    if (_cached) return _inherited;
    _cached = true;
    return _inherited ??= SizeProviderInherited.of(context);
  }

  /// Для шрифтов
  double fo<T extends num>(T original) {
    return inherited?.sizeConverter.fo(original) ?? original.toDouble();
  }

  /// Для виджетов
  double si<T extends num>(T original) {
    return inherited?.sizeConverter.si(original) ?? original.toDouble();
  }
}
