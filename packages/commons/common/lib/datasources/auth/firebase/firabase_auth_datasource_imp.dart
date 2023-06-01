import 'package:common/common.dart';
import 'package:common/datasources/errors/api_error.dart';
import 'package:common/infra/dtos/sign_up_dto.dart';
import 'package:common_dependencies/common_dependencies.dart';

class FirebaseAuthDatasourceImp implements AuthDatasource {
  @override
  Future<Tuple<ApiError, void>> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return Tuple.right(null);
    } catch (e) {
      return Tuple.left(
        ApiError(
          endpoint: "logout_firebase",
          message: e.toString(),
          statusCode: 500,
        ),
      );
    }
  }

  @override
  Future<Tuple<ApiError, AppUser>> loginEmail(LoginDto dto) async {
    try {
      final userCredentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: dto.email, password: dto.password);

      final user = AppUser(
        displayName: userCredentials.user!.displayName,
        id: userCredentials.user!.uid,
        imageUrl: userCredentials.user!.photoURL,
      );

      return Tuple.right(user);
    } on FirebaseException catch (firebase) {
      return Tuple.left(
        ApiError(
          endpoint: "email-firebase-login",
          message: firebase.code,
          statusCode: 400,
        ),
      );
    } catch (e) {
      return Tuple.left(
        ApiError(
          endpoint: "email-firebase-login",
          message: e.toString(),
          statusCode: 500,
        ),
      );
    }
  }

  @override
  Future<Tuple<ApiError, AppUser>> loginGoogle() async {
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

      final user = AppUser(
        displayName: googleUser.displayName,
        id: googleUser.id,
        imageUrl: googleUser.photoUrl,
      );

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      return Tuple.right(user);
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
  Future<Tuple<ApiError, AppUser>> loginGithub() {
    // TODO: implement loginGithub
    throw UnimplementedError();
  }

  @override
  Future<Tuple<ApiError, AppUser>> signUp(SignUpDto dto) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}
