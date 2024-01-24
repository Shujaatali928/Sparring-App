import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxService {
  var isProfileImagePathSet = false.obs;
  var profileImagePath = "".obs;

  late SharedPreferences _prefs;
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    final storedImagePath = _prefs.getString('profileImagePath');
    if (storedImagePath != null && storedImagePath.isNotEmpty) {
      profileImagePath.value = storedImagePath;
      isProfileImagePathSet.value = true;
    }
  }

  void setProfileImagePath(String path) {
    profileImagePath.value = path;
    isProfileImagePathSet.value = true;

    _prefs.setString('profileImagePath', path);
  }
}
