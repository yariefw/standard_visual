part of '../../standard_visual.dart';

class ButtonPrimaryWidget extends StatelessWidget {
  const ButtonPrimaryWidget({
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
        color: (isActive) ? _buttonPrimary : _buttonPrimaryInactive,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: Text(
          labelText ?? '',
          style:
              labelStyle ??
              _textLarge?.copyWith(
                color: (isActive) ? _onButtonPrimary : _onButtonPrimaryInactive,
              ),
        ),
      ),
    );
  }
}
