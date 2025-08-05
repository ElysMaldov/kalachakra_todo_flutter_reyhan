import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo_cubit.dart';
import 'package:kalachakra_todo_flutter_reyhan/enums/todo_status.dart';

class TodoFilterMenuItem extends StatelessWidget {
  final TodoStatus status;

  const TodoFilterMenuItem({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TodoCubit, TodoState, TodoStatus>(
      selector: (state) {
        return state.filterTodoStatus;
      },
      builder: (context, state) => TextButton(
        onPressed: () {
          // TODO use cubit
        },
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.resolveWith<Size?>((
            Set<WidgetState> states,
          ) {
            return Size.fromHeight(
              40,
            ); // Make this button full width of the menu card
          }),
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.hovered) || state == status) {
              return Color.fromRGBO(108, 99, 255, 0.2);
            }

            return null;
          }),
          shape: WidgetStateProperty.resolveWith<OutlinedBorder?>((
            Set<WidgetState> states,
          ) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.zero,
            );
          }),
          padding: WidgetStateProperty.resolveWith<EdgeInsetsGeometry?>((
            Set<WidgetState> states,
          ) {
            return EdgeInsetsGeometry.symmetric(horizontal: 6);
          }),
        ),
        child: Row(
          children: [
            Text(
              status.label,
              // style: TextStyle(color: Theme.of(context).colorScheme.tertiary, ),
              style: GoogleFonts.kanit(
                textStyle: Theme.of(context).textTheme.bodyMedium,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
