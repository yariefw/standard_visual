part of '../../standard_visual.dart';

extension _StringExtension on String {
  String enforceMaxLength({int? limit}) {
    if (limit == null) return this;
    if (length > limit) return substring(0, limit);
    return this;
  }
}
