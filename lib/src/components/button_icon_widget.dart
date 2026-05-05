part of '../../standard_visual.dart';

class ButtonIconWidget extends StatelessWidget {
  const ButtonIconWidget({
    super.key,
    required this.icon,
    required this.label,
    this.borderRadius = 12,
  });

  final Widget icon;
  final String label;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            color: _buttonIconBackground,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(color: _buttonIconBorder),
          ),
          child: ColorFiltered(
            colorFilter: ColorFilter.mode(_onButtonIcon, BlendMode.srcIn),
            child: icon,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: _textMedium?.copyWith(color: _onButtonIcon),
          ),
        ),
      ],
    );
  }
}
