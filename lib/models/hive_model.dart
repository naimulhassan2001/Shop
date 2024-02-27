




import 'package:hive/hive.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 0)
class NotesModel extends HiveObject{

  @HiveField(0)
  String title ;


  @HiveField(1)
  String description ;

  @HiveField(2)
  String image ;

  @HiveField(3)
  String price ;

  NotesModel( {required this.title, required this.description, required this.image, required this.price}) ;
}