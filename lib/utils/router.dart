import 'package:go_router/go_router.dart';
import 'package:kalachakra_todo_flutter_reyhan/views/todo_screen.dart';

// GoRouter configuration
final router = GoRouter(
  routes: [GoRoute(path: '/', builder: (context, state) => TodoScreen())],
);
