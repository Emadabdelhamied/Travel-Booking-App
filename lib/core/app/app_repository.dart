import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_booking_app/core/app/app_data.dart';
import 'app_storage.dart';

class AppRepository {
  final KeyValueStorage store;

  AppRepository(this.store);

  AppData? loadAppData() {
    return store.getAppData();
  }

//saco
  Future setUserLang(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("lang", language);
  }

  Future<String> getUserLang() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("lang") ?? 'ar';
  }
}
