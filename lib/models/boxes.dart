import 'package:hive/hive.dart';

import 'hive_model.dart';

class Boxes {
  static Box<NotesModel> getData() => Hive.box('database');
}