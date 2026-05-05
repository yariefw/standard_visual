part of '../../standard_visual.dart';

class WindowFrameWidget extends StatelessWidget {
  const WindowFrameWidget({
    super.key,
    this.labelText,
    this.children,
    this.borderRadius = 12,
  });

  final String? labelText;
  final List<Widget>? children;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _windowFrameContent,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (labelText?.isNotEmpty ?? false)
            Container(
              width: context.maxWidth,
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: _windowFrameTitle,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(borderRadius),
                ),
              ),
              child: Text(
                labelText ?? '',
                style: TextStyle(
                  color: _onWindowFrameTitle,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ...?children,
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
