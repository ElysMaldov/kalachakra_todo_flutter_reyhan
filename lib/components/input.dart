import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalachakra_todo_flutter_reyhan/themes/colors.dart';

class Input extends StatefulWidget {
  final Widget? icon;
  final String? hintText;
  final TextEditingController? controller;

  const Input({super.key, this.icon, this.hintText, this.controller});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.tertiary,
        width: 1,
      ),
    );

    var textStyle = GoogleFonts.inter(
      textStyle: Theme.of(context).textTheme.headlineLarge,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: inputHintColor,
    );

    return Container(
      constraints: BoxConstraints(minWidth: 360, maxWidth: 750),
      child: Container(
        decoration: BoxDecoration(
          border: _isFocused
              ? Border.all(color: Color.fromRGBO(108, 99, 255, 0.4), width: 2)
              : null,
          borderRadius: BorderRadius.circular(7),
        ),
        child: TextField(
          focusNode: _focusNode,
          style: textStyle.copyWith(
            color: Theme.of(context).colorScheme.tertiary,
          ),
          controller: widget.controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 11),
            hintText: widget.hintText,
            hintStyle: textStyle,
            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            suffixIcon: Container(
              margin: EdgeInsets.only(right: 4),
              width: 21,
              height: 21,
              child: widget.icon,
            ),
            focusColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
