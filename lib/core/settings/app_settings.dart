import 'package:hive/hive.dart';

import 'settings_data.dart';

class AppSettings {
  static Box? box;
  static String locale = 'tk';

  init() async {
    box = await Hive.openBox('box', encryptionCipher: HiveAesCipher(listInt));
  }
}
