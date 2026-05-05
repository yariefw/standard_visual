part of '../../standard_visual.dart';

extension _BuildContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get maxWidth => mediaQuery.size.width;
  double get maxHeight => mediaQuery.size.height;
}
