part of '../../standard_visual.dart';

class ButtonSecondaryWidget extends StatelessWidget {
  const ButtonSecondaryWidget({
    super.key,
    this.label,
    this.isActive = true,
    this.borderRadius = 12,
  });

  final String? label;
  final bool isActive;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: context.maxWidth,
      decoration: BoxDecoration(
        color: _buttonSecondaryBackground,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: (isActive) ? _buttonSecondary : _buttonSecondaryInactive,
        ),
      ),
      child: Center(
        child: Text(
          label ?? '',
          style: _textLarge?.copyWith(
            color: (isActive) ? _onButtonSecondary : _onButtonSecondaryInactive,
          ),
        ),
      ),
    );
  }
}
