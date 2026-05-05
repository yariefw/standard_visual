part of '../../standard_visual.dart';

class ButtonIconWidget extends StatelessWidget {
  const ButtonIconWidget({
    super.key,
    required this.icon,
    this.labelText = '',
    this.borderRadius = 12,
    this.iconSize = 64,
    this.iconBackground,
    this.labelTextStyle,
  });

  final Widget icon;
  final String labelText;
  final double borderRadius;
  final double iconSize;
  final Color? iconBackground;
  final TextStyle? labelTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: iconSize,
          width: iconSize,
          decoration: BoxDecoration(
            color: iconBackground ?? _buttonIconBackground,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: _buttonIconBorder),
          ),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(_onButtonIcon, BlendMode.srcIn),
            child: icon,
          ),
        ),
        if (labelText.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              labelText,
              textAlign: TextAlign.center,
              style:
                  labelTextStyle ?? _textMedium?.copyWith(color: _onButtonIcon),
            ),
          ),
      ],
    );
  }
}
