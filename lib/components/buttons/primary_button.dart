import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalachakra_todo_flutter_reyhan/themes/colors.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const PrimaryButton({
    super.key,
    this.onPressed,
    required this.child,
    this.padding = const EdgeInsetsGeometry.symmetric(
      horizontal: 22,
      vertical: 10,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith<TextStyle>((
          Set<WidgetState> states,
        ) {
          return GoogleFonts.kanit(
            textStyle: Theme.of(context).textTheme.bodyMedium,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          );
        }),
        shape: WidgetStateProperty.resolveWith<OutlinedBorder>((
          Set<WidgetState> states,
        ) {
          return RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(5),
          );
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          return Theme.of(context).colorScheme.tertiary;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          return primaryColor;
        }),
        padding: WidgetStateProperty.resolveWith<EdgeInsetsGeometry?>((
          Set<WidgetState> states,
        ) {
          return padding;
        }),
      ),
      child: child,
    );
  }
}
