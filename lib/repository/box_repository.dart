import 'package:hive/hive.dart';
import '../models/Event.dart';

class BoxRepository {
  static const String boxName = "SELEDA";
  static openBox() async => await Hive.openBox<Event>(boxName);
  static Box getBox() => Hive.box<Event>(boxName);
  static closeBox() async => await Hive.box(boxName).close();
}
