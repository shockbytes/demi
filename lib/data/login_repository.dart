
import 'package:demi/model/demi_user.dart';

abstract class LoginRepository {

  Future<DemiUser> signIn();

  Future<void> signOut();

}