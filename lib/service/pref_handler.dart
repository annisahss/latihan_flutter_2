import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  static const String _id = 'idUser';

  static void saveID(String id) {
    print('id: $id');
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString(_id, id);
    });
  }

  static Future getID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString(_id) ?? '';
    return id;
  }

  static void removeID() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove(_id);
    });
  }
}
