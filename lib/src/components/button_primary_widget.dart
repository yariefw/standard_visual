part of '../../standard_visual.dart';

class ButtonPrimaryWidget extends StatelessWidget {
  const ButtonPrimaryWidget({
    super.key,
    this.labelText,
    this.isActive = true,
    this.borderRadius = 12,
  });

  final String? labelText;
  final bool isActive;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: context.maxWidth,
      decoration: BoxDecoration(
        color: (isActive) ? _buttonPrimary : _buttonPrimaryInactive,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: Text(
          labelText ?? '',
          style: _textLarge?.copyWith(
            color: (isActive) ? _onButtonPrimary : _onButtonPrimaryInactive,
          ),
        ),
      ),
    );
  }
}
