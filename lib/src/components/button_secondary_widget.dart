part of '../../standard_visual.dart';

class ButtonSecondaryWidget extends StatelessWidget {
  const ButtonSecondaryWidget({
    super.key,
    this.labelText,
    this.labelStyle,
    this.isActive = true,
    this.borderRadius = 12,
    this.height,
    this.width,
  });

  final String? labelText;
  final TextStyle? labelStyle;
  final bool isActive;
  final double borderRadius;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 65,
      width: width ?? context.maxWidth,
      decoration: BoxDecoration(
        color: _buttonSecondaryBackground,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: (isActive) ? _buttonSecondary : _buttonSecondaryInactive,
        ),
      ),
      child: Center(
        child: Text(
          labelText ?? '',
          style:
              labelStyle ??
              _textLarge?.copyWith(
                color: (isActive)
                    ? _onButtonSecondary
                    : _onButtonSecondaryInactive,
              ),
        ),
      ),
    );
  }
}
