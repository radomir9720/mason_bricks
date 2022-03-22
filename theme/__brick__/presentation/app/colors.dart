import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
// ignore: always_use_package_imports
import 'ui.dart';

/// Defines color palette
@immutable
abstract class AppColorsData {
  @literal
  const AppColorsData();

  /// Creates light color scheme
  @literal
  const factory AppColorsData.light() = _AppColorsDataLight;

  /// Creates dark color scheme
  @literal
  const factory AppColorsData.dark() = _AppColorsDataDark;

  factory AppColorsData.fromBrightness(AppBrightness brightness) {
    return brightness.when(
      dark: () => const _AppColorsDataDark(),
      light: () => const _AppColorsDataLight(),
    );
  }

  /// The brightness of color palette
  AppBrightness get brightness;

  /// AppBar color
  Color get appBarColor;

  /// Text colors set
  ColorSwatch<int> get text;

  /// Primary colors set
  ColorSwatch<int> get primary;

  Color get onPrimary;

  /// Background colors set
  ColorSwatch<int> get background;

  Color get onBackground;

  /// Surface colors set
  ColorSwatch get surface;

  Color get onSurface;

  /// Color for errors
  Color get error;

  /// Color for warning
  Color get warning;

  /// Success
  Color get success;

  /// Disabled
  Color get disabled;

  Color get onError;

  @override
  int get hashCode => brightness.hashCode;

  @override
  bool operator ==(Object other) =>
      other is AppColorsData && brightness == other.brightness;
}

class _AppColorsDataLight extends AppColorsData {
  const _AppColorsDataLight();

  @override
  AppBrightness get brightness => AppBrightness.light;

  @override
  Color get appBarColor => const Color(0xFFFFFFFF);

  @override
  ColorSwatch<int> get text {
    return const ColorSwatch(
      0xFF3B3B3B,
      {
        100: Color(0xFFF7F7F7),
        200: Color(0xFFB9B9B9),
        300: Color(0xFF808080),
        400: Color(0xFF717171),
        500: Color(0xFF3B3B3B),
        900: Color(0xFF222222),
      },
    );
  }

  @override
  ColorSwatch<int> get primary {
    return const ColorSwatch(
      0xFF1572A1,
      {
        100: Color(0XFF91d1f1),
        200: Color(0XFF64beeb),
        300: Color(0XFF37abe5),
        400: Color(0XFF1572a1),
        500: Color(0XFF0f5274),
        600: Color(0XFF093247),
        700: Color(0XFF03121a),
      },
    );
  }

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  @override
  ColorSwatch<int> get background {
    return const ColorSwatch(
      0xFFF7F7F7,
      {
        0: Color(0xFFf2f2f2),
        5: Color(0xFFd9d9d9),
        10: Color(0xFFbfbfbf),
        20: Color(0xFFa6a6a6),
        30: Color(0xFF8c8c8c),
        50: Color(0xFF737373),
        56: Color(0xFF595959),
        75: Color(0xFF404040),
        100: Color(0xFF262626),
      },
    );
  }

  @override
  Color get onBackground => background[75]!;

  @override
  ColorSwatch get surface => background;
  @override
  Color get onSurface => onBackground;

  @override
  Color get error => const Color(0xFFEA5C2B);

  @override
  Color get onError => const Color(0xFFFFFFFF);

  @override
  Color get success => const Color(0xFF95CD41);

  @override
  Color get warning => const Color(0xFFF6D860);

  @override
  Color get disabled => const Color(0xFFD1D1D1);
}

class _AppColorsDataDark extends AppColorsData {
  const _AppColorsDataDark();

  @override
  AppBrightness get brightness => AppBrightness.dark;

  @override
  Color get appBarColor => const Color(0xFF0F4C75);

  @override
  ColorSwatch<int> get text {
    return const ColorSwatch(
      0xFFFFFFFF,
      {
        100: Color(0xFFD4D4D4),
        200: Color(0xFFAAAAAA),
        300: Color(0xFF808080),
        400: Color(0xFF555555),
        500: Color(0xFF2A2A2A),
        900: Color(0xFF000000),
      },
    );
  }

  @override
  ColorSwatch<int> get primary {
    return const ColorSwatch(
      0xFF0F4C75,
      {
        100: Color(0XFF65b5eb),
        200: Color(0XFF38a0e5),
        300: Color(0XFF1b87cf),
        400: Color(0XFF0f4c75),
        500: Color(0XFF092f48),
        600: Color(0XFF03111b),
        700: Color(0XFF000000),
      },
    );
  }

  @override
  Color get onPrimary => const Color(0xFFFFFFFF);

  @override
  ColorSwatch<int> get background {
    return const ColorSwatch(
      0xFF1B262C,
      {
        0: Color(0xFFf2f2f2),
        5: Color(0xFFd9d9d9),
        10: Color(0xFFbfbfbf),
        20: Color(0xFFa6a6a6),
        30: Color(0xFF8c8c8c),
        50: Color(0xFF737373),
        56: Color(0xFF595959),
        75: Color(0xFF404040),
        100: Color(0xFF262626),
      },
    );
  }

  @override
  Color get onBackground => background[75]!;

  @override
  ColorSwatch get surface => background;

  @override
  Color get onSurface => onBackground;

  @override
  Color get error => const Color(0xFFEA5C2B);

  @override
  Color get onError => const Color(0xFFFFFFFF);

  @override
  Color get success => const Color(0xFF95CD41);

  @override
  Color get warning => const Color(0xFFF6D860);

  @override
  Color get disabled => const Color(0xFFD1D1D1);
}

class AppColors extends StatelessWidget {
  const AppColors({
    required this.child,
    required this.data,
    Key? key,
  }) : super(key: key);

  @protected
  final Widget child;

  @protected
  final AppColorsData data;

  static AppColorsData of(BuildContext context, {bool watch = true}) {
    final getInheritedElement = context.getElementForInheritedWidgetOfExactType;
    final inheritedColors = getInheritedElement<InheritedColors>();

    if (inheritedColors == null) {
      throw FlutterError(
        'AppColors.of(context) called with a context that does not contain a '
        'AppColorsData',
      );
    }

    if (watch) {
      context.dependOnInheritedElement(inheritedColors);
    }

    return (inheritedColors.widget as InheritedColors).colors.data;
  }

  @override
  Widget build(BuildContext context) {
    return InheritedColors(
      colors: this,
      child: child,
    );
  }
}

@protected
class InheritedColors extends InheritedWidget {
  @literal
  const InheritedColors({
    required Widget child,
    required this.colors,
    Key? key,
  }) : super(key: key, child: child);

  @protected
  final AppColors colors;

  @override
  bool updateShouldNotify(InheritedColors oldWidget) {
    return colors != oldWidget.colors;
  }
}
