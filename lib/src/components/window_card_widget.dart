part of '../../standard_visual.dart';

class WindowCardWidget extends StatelessWidget {
  const WindowCardWidget({super.key, this.child, this.borderRadius = 12});

  final Widget? child;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.maxWidth,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: _windowCard,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
