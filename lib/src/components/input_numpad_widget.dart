part of '../../standard_visual.dart';

class InputNumpadWidget extends StatefulWidget {
  const InputNumpadWidget({
    super.key,
    required this.controller,
    this.maxLength,
  });

  final TextEditingController controller;
  final int? maxLength;

  @override
  State<InputNumpadWidget> createState() => _InputNumpadWidgetState();
}

class _InputNumpadWidgetState extends State<InputNumpadWidget> {
  @override
  void initState() {
    super.initState();

    if (widget.maxLength != null) {
      widget.controller.addListener(() {
        String limited = widget.controller.text.enforceMaxLength(
          limit: widget.maxLength,
        );

        if (widget.controller.text != limited) widget.controller.text = limited;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: context.maxWidth * 0.025,
        mainAxisSpacing: context.maxHeight * 0.02,
        childAspectRatio: context.maxWidth / 3 / 100,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        if (index == 9) {
          return const SizedBox.shrink();
        } else if (index == 10) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                widget.controller.text += '0';
              },
              child: Container(
                decoration: BoxDecoration(
                  color: _buttonPin,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.5),
                    width: 0.4,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  '0',
                  style: _textLarge?.copyWith(color: _onButtonPin),
                ),
              ),
            ),
          );
        } else if (index == 11) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: GestureDetector(
              onTap: () {
                if (widget.controller.text.isNotEmpty) {
                  widget.controller.text = widget.controller.text.substring(
                    0,
                    widget.controller.text.length - 1,
                  );
                }
              },

              child: Container(
                decoration: BoxDecoration(
                  color: _buttonPin,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.5),
                    width: 0.4,
                  ),
                ),
                alignment: Alignment.center,
                child: Icon(Icons.backspace_outlined, color: _onButtonPin),
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(8),
          child: GestureDetector(
            onTap: () {
              widget.controller.text += '${index + 1}';
            },
            child: Container(
              decoration: BoxDecoration(
                color: _buttonPin,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.5),
                  width: 0.4,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                '${index + 1}',
                style: _textLarge?.copyWith(color: _onButtonPin),
              ),
            ),
          ),
        );
      },
    );
  }
}
