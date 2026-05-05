part of '../../standard_visual.dart';

class DialogAlert extends StatefulWidget {
  const DialogAlert({
    super.key,
    this.title,
    this.message,
    this.onConfirm,
    this.onCancel,
  });

  final String? title;
  final String? message;
  final Function? onConfirm;
  final Function? onCancel;

  @override
  State<DialogAlert> createState() => _DialogAlertState();
}

class _DialogAlertState extends State<DialogAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: (widget.title != null) ? Text(widget.title ?? '') : null,
      content: (widget.message != null) ? Text(widget.message ?? '') : null,
      insetPadding: EdgeInsets.symmetric(
        horizontal: context.maxWidth * 0.1,
        vertical: context.maxHeight * 0.1,
      ),
      actionsPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      actionsAlignment: (widget.onConfirm != null)
          ? MainAxisAlignment.end
          : MainAxisAlignment.center,
      actions: [
        if (widget.onConfirm != null)
          TextButton(
            onPressed: () {
              Navigator.pop(context);

              if (widget.onCancel == null) return;
              widget.onCancel?.call();
            },
            child: Text('Cancel'),
          ),
        SizedBox(
          width: (widget.onConfirm == null) ? context.maxWidth : null,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);

              if (widget.onConfirm == null) return;
              widget.onConfirm?.call();
            },
            child: Text((widget.onConfirm != null) ? 'Confirm' : 'Ok'),
          ),
        ),
      ],
    );
  }
}
