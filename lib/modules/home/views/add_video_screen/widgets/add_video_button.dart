import 'package:flutter/material.dart';

class AddVideoButton extends StatelessWidget {
  const AddVideoButton({
    super.key,
    required this.onPressed,
    this.buttonLabel = "ADICIONAR",
  });

  final void Function() onPressed;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    Widget widget = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          buttonLabel,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
    if (buttonLabel == "EXCLUIR") {
      return OutlinedButton(onPressed: onPressed, child: widget);
    }
    return ElevatedButton(onPressed: onPressed, child: widget);
  }
}
