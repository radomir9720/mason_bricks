import 'dart:math';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

class AppTypography extends StatelessWidget {
  @literal
  const AppTypography({
    required this.child,
    Key? key,
    this.maxScaleFactor,
  }) : super(key: key);

  @protected
  final Widget child;

  @protected
  final double? maxScaleFactor;

  @override
  Widget build(BuildContext context) {
    final textScaleFactor = min(
      maxScaleFactor ?? double.infinity,
      window.textScaleFactor,
    );
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: textScaleFactor,
      ),
      child: InheritedTypography(
        textScaleFactor: textScaleFactor,
        child: DefaultTextHeightBehavior(
          textHeightBehavior: const TextHeightBehavior(
            leadingDistribution: TextLeadingDistribution.even,
          ),
          child: child,
        ),
      ),
    );
  }
}

@protected
class InheritedTypography extends InheritedWidget {
  @literal
  const InheritedTypography({
    required Widget child,
    required this.textScaleFactor,
    Key? key,
  }) : super(key: key, child: child);

  final double textScaleFactor;

  @override
  bool updateShouldNotify(InheritedTypography oldWidget) {
    return textScaleFactor != oldWidget.textScaleFactor;
  }
}
