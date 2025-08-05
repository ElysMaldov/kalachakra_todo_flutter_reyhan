import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/buttons/primary_button.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/buttons/secondary_button.dart';
import 'package:kalachakra_todo_flutter_reyhan/components/inputs/input.dart';

class TodoDialog extends StatelessWidget {
  final String title;
  final String hintText;
  final Function(String) onPressed;
  final TextEditingController _controller = TextEditingController();

  TodoDialog({
    super.key,
    required this.title,
    required this.hintText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: GoogleFonts.kanit(
          textStyle: Theme.of(context).textTheme.headlineMedium,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.secondary,
        ),
        textAlign: TextAlign.center,
      ),
      content: Input(hintText: hintText, controller: _controller),
      contentPadding: EdgeInsets.only(
        top: 25,
        bottom: 128,
        left: 30,
        right: 30,
      ),
      actionsPadding: EdgeInsets.only(left: 30, right: 30, bottom: 18),
      titlePadding: EdgeInsets.only(left: 30, right: 30, top: 18),
      actions: [
        SecondaryButton(
          child: Text("CANCEL"),
          onPressed: () {
            Navigator.of(context).pop();
            _controller.clear();
          },
        ),
        PrimaryButton(
          child: Text("APPLY"),
          onPressed: () {
            onPressed(_controller.text);
            Navigator.of(context).pop();
            _controller.clear();
          },
        ),
      ],
      actionsAlignment: MainAxisAlignment.spaceBetween,
    );
  }
}
