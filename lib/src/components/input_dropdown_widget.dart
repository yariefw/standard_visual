part of '../../standard_visual.dart';

class InputDropdownOption {
  final String value;
  final String? label;

  InputDropdownOption({required this.value, this.label});
}

class InputDropdownWidget extends StatefulWidget {
  const InputDropdownWidget({
    super.key,
    this.enabled = true,
    this.initialValue,
    required this.options,
    required this.onChanged,
    this.labelText,
    this.border,
    this.textStyle,
    this.height,
    this.width,
    this.iconColor,
  });

  final bool enabled;
  final String? initialValue;
  final List<InputDropdownOption> options;
  final Function(String selected)? onChanged;
  final String? labelText;
  final InputBorder? border;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final Color? iconColor;

  @override
  State<InputDropdownWidget> createState() => _InputDropdownWidgetState();
}

class _InputDropdownWidgetState extends State<InputDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText?.isNotEmpty ?? false)
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(widget.labelText ?? '', style: _textLabel),
          ),
        IgnorePointer(
          ignoring: !widget.enabled,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: widget.height ?? double.maxFinite,
              maxWidth: widget.width ?? double.maxFinite,
            ),
            child: DropdownMenu<String>(
              width: context.maxWidth - 32,
              alignmentOffset: Offset(-16, 0),
              textStyle: widget.textStyle ?? _textNormal,
              inputDecorationTheme: InputDecorationTheme(
                enabledBorder: widget.border,
                disabledBorder: widget.border,
              ),
              selectedTrailingIcon: (widget.enabled)
                  ? Transform.translate(
                      offset: Offset(20, 0),
                      child: Icon(Icons.arrow_drop_up, color: widget.iconColor),
                    )
                  : SizedBox.shrink(),
              trailingIcon: (widget.enabled)
                  ? Transform.translate(
                      offset: Offset(20, 0),
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: widget.iconColor,
                      ),
                    )
                  : SizedBox.shrink(),
              initialSelection: (widget.initialValue != '-1')
                  ? widget.initialValue
                  : null,
              dropdownMenuEntries: widget.options.mapIndexed((index, item) {
                return DropdownMenuEntry(
                  value: item.value,
                  label: item.label ?? item.value,
                );
              }).toList(),
              onSelected: (value) {
                if (widget.onChanged != null && value != null) {
                  widget.onChanged!(value);
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
