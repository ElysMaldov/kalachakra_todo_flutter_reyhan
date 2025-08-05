import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(
        "Hello",
        style: GoogleFonts.inter(fontWeight: FontWeight.w700),
      ),
    );
  }
}
