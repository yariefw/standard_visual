part of '../../standard_visual.dart';

class DialogSimple extends StatefulWidget {
  const DialogSimple({
    super.key,
    this.title,
    this.children,
    this.onConfirm,
    this.onCancel,
  });

  final String? title;
  final List<Widget>? children;
  final Function? onConfirm;
  final Function? onCancel;

  @override
  State<DialogSimple> createState() => _DialogSimpleState();
}

class _DialogSimpleState extends State<DialogSimple> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: (widget.title != null) ? Text(widget.title ?? '') : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      insetPadding: EdgeInsets.symmetric(
        horizontal: context.maxWidth * 0.1,
        vertical: context.maxHeight * 0.1,
      ),
      contentPadding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
      children: [
        ...?widget.children,
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (widget.onConfirm != null)
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);

                    if (widget.onCancel == null) return;
                    widget.onCancel?.call();
                  },
                  child: Text('Cancel'),
                ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);

                  if (widget.onConfirm == null) return;
                  widget.onConfirm?.call();
                },
                child: Text((widget.onConfirm != null) ? 'Confirm' : 'Close'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
