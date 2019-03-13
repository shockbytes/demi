
import 'package:demi/data/login_repository.dart';
import 'package:demi/model/demi_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseLoginRepository implements LoginRepository {
  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _auth;

  FirebaseLoginRepository(
      this._googleSignIn,
      this._auth);

  Future<DemiUser> signIn() async {
      GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      return _auth
          .currentUser()
          .then((user) {

            if (user == null) {
              return _auth.signInWithGoogle(
                accessToken: googleAuth.accessToken,
                idToken: googleAuth.idToken,
              ).then(((user) => DemiUser(user.displayName, user.photoUrl)));
            } else {
              return DemiUser(user.displayName, user.photoUrl);
            }
      });
  }

  @override
  Future<void> signOut() {
    _auth.signOut();
  }

}
