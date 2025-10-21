import 'package:my_new_app/models/todo.dart';

class Todosprovider {
  final String title;
  bool isDone;
  Todosprovider(this.title, {this.isDone = false});
}
