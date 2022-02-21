import 'package:get/get.dart';
import 'package:mobile/apis/auth.api.dart';
import 'package:mobile/models/User.dart';
import 'package:mobile/screens/home/home_screen.dart';

class UserController extends GetxController {
  final user = Rxn<User>();

  Future? login({email, password}) async {
    try {
      User? result = await loginAPI(email: email, password: password);
      user.value = result;

      print(user.value);

      Get.to(HomeScreen());

    }
    catch (e) {
      print(e);
      return null;
    }
  }
}
