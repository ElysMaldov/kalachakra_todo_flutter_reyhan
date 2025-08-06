import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalachakra_todo_flutter_reyhan/views/components/inputs/input.dart';
import 'package:kalachakra_todo_flutter_reyhan/controllers/todo/todo_cubit.dart';
import 'package:kalachakra_todo_flutter_reyhan/views/themes/colors.dart';

class TodoSearchInput extends StatefulWidget {
  const TodoSearchInput({super.key});

  @override
  State<TodoSearchInput> createState() => _TodoSearchInputState();
}

class _TodoSearchInputState extends State<TodoSearchInput> {
  @override
  Widget build(BuildContext context) {
    final todoCubit = BlocProvider.of<TodoCubit>(context);

    return ValueListenableBuilder(
      valueListenable: AdaptiveTheme.of(context).modeChangeNotifier,
      builder: (context, value, child) {
        return SizedBox(
          height: 38,
          child: Input(
            onChanged: (q) => todoCubit.setTodoSearchQuery(q),
            hintText: "Search note...",
            // FIXME size not correct
            // icon: SvgPicture.asset(
            //   "icons/search-icon.svg",
            //   semanticsLabel: "Search Icon",
            //   width: 16,
            //   height: 16,
            // ),
            icon: Icon(
              Icons.search_outlined,
              size: 21,
              color: value == AdaptiveThemeMode.dark
                  ? primaryColor
                  : Theme.of(context).colorScheme.tertiary,
            ),
          ),
        );
      },
    );
  }
}
