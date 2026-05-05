part of '../../standard_visual.dart';

class InputTextWidget extends StatefulWidget {
  const InputTextWidget({
    super.key,
    this.enabled = true,
    this.controller,
    this.focusNode,
    this.labelText,
    this.hintText,
    this.prefixText,
    this.style,
    this.labelstyle,
    this.hintstyle,
    this.prefixstyle,
    this.keyboardType,
    this.maxLength,
    this.obscureText = false,
    this.autofillHints = const [],
  });

  final bool enabled;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? labelText;
  final String? hintText;
  final String? prefixText;
  final TextStyle? style;
  final TextStyle? labelstyle;
  final TextStyle? hintstyle;
  final TextStyle? prefixstyle;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool obscureText;
  final List<String> autofillHints;

  @override
  State<InputTextWidget> createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      maxLengthEnforcement: (widget.maxLength != null)
          ? MaxLengthEnforcement.enforced
          : null,
      obscureText: widget.obscureText,
      autofillHints: widget.autofillHints,
      textAlign: TextAlign.end,
      style: widget.style ?? TextStyle(color: Colors.black),
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: widget.labelText,
        hintText: widget.hintText,
        prefixText: widget.prefixText,
        labelStyle: widget.labelstyle ?? TextStyle(color: Colors.black),
        hintStyle: widget.hintstyle ?? TextStyle(color: Colors.grey.shade400),
        prefixStyle:
            widget.prefixstyle ?? TextStyle(fontSize: 18, color: Colors.black),
        counter: SizedBox.shrink(),
      ),
    );
  }
}
