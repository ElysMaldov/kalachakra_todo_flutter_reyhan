import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const SecondaryButton({super.key, this.onPressed, required this.child});

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
            side: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          );
        }),
        backgroundColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          return Colors.transparent;
        }),
        foregroundColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          return Theme.of(context).colorScheme.tertiary;
        }),
        padding: WidgetStateProperty.resolveWith<EdgeInsetsGeometry>((
          Set<WidgetState> states,
        ) {
          return EdgeInsetsGeometry.symmetric(horizontal: 22, vertical: 10);
        }),
      ),
      child: child,
    );
  }
}
