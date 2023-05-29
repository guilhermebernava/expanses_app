import 'package:common/common.dart';
import 'package:common/datasources/errors/api_error.dart';
import 'package:common_dependencies/common_dependencies.dart';

class FirebaseAuthDatasourceImp implements AuthDatasource {
  @override
  Future<Tuple<ApiError, void>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Tuple<ApiError, void>> loginEmail() {
    // TODO: implement loginEmail
    throw UnimplementedError();
  }

  @override
  Future<Tuple<ApiError, void>> loginGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return Tuple.left(
          ApiError(
            endpoint: "GoogleSignIn",
            message: "Not found google user",
            statusCode: 404,
          ),
        );
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      //TODO desenvolver user entity

      await FirebaseAuth.instance.signInWithCredential(credential);

      return Tuple.right(null);
    } catch (e) {
      return Tuple.left(
        ApiError(
          endpoint: "GoogleSignIn",
          message: e.toString(),
          statusCode: 500,
        ),
      );
    }
  }

  @override
  Future<Tuple<ApiError, void>> loginGithub() {
    // TODO: implement loginGithub
    throw UnimplementedError();
  }
}
