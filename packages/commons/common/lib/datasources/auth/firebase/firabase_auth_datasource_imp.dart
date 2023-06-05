import 'package:common/common.dart';
import 'package:common/datasources/errors/api_error.dart';
import 'package:common/utils/validators/check_internet/check_internet.dart';
import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';

class FirebaseAuthDatasourceImp implements AuthDatasource {
  final CheckInternet _checkInternet;

  FirebaseAuthDatasourceImp({required CheckInternet checkInternet})
      : _checkInternet = checkInternet;

  @override
  Future<Tuple<ApiError, void>> logout() async {
    try {
      if (await _haveInternet() == false) {
        return Tuple.left(
          ApiError(
            endpoint: "forgot-password",
            message: "NO INTERNET",
            statusCode: 001,
          ),
        );
      }
      await FirebaseAuth.instance.signOut();
      return Tuple.right(null);
    } catch (e) {
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: e,
          library: "Firabase",
          context: ErrorSummary('Logout'),
        ),
      );

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
      if (await _haveInternet() == false) {
        return Tuple.left(
          ApiError(
            endpoint: "forgot-password",
            message: "NO INTERNET",
            statusCode: 001,
          ),
        );
      }
      final userCredentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: dto.email, password: dto.password);

      final user = AppUser(
        displayName: userCredentials.user!.displayName,
        id: userCredentials.user!.uid,
        imageUrl: userCredentials.user!.photoURL,
      );

      return Tuple.right(user);
    } on FirebaseException catch (firebase) {
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: firebase,
          library: "Firabase",
          context: ErrorSummary('Login-Email'),
        ),
      );

      return Tuple.left(
        ApiError(
          endpoint: "email-firebase-login",
          message: firebase.code,
          statusCode: 400,
        ),
      );
    } catch (e) {
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: e,
          library: "Firabase",
          context: ErrorSummary('Login-Email'),
        ),
      );

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
      if (await _haveInternet() == false) {
        return Tuple.left(
          ApiError(
            endpoint: "forgot-password",
            message: "NO INTERNET",
            statusCode: 001,
          ),
        );
      }
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
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: e,
          library: "Firabase",
          context: ErrorSummary('Login-Google'),
        ),
      );

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
  Future<Tuple<ApiError, AppUser>> signUp(SignUpDto dto) async {
    try {
      if (await _haveInternet() == false) {
        return Tuple.left(
          ApiError(
            endpoint: "forgot-password",
            message: "NO INTERNET",
            statusCode: 001,
          ),
        );
      }
      final userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: dto.email, password: dto.password);

      final user = AppUser(
        displayName: userCredentials.user!.displayName,
        id: userCredentials.user!.uid,
        imageUrl: userCredentials.user!.photoURL,
      );

      return Tuple.right(user);
    } on FirebaseAuthException catch (firebase) {
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: firebase,
          library: "Firabase",
          context: ErrorSummary('SignUp-Email'),
        ),
      );

      return Tuple.left(
        ApiError(
          endpoint: "email-firebase-sign-up",
          message: firebase.code,
          statusCode: 400,
        ),
      );
    } catch (e) {
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: e,
          library: "Firabase",
          context: ErrorSummary('SignUp-Email'),
        ),
      );

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
  Future<Tuple<ApiError, void>> forgotPassword(String email) async {
    try {
      if (await _haveInternet() == false) {
        return Tuple.left(
          ApiError(
            endpoint: "forgot-password",
            message: "NO INTERNET",
            statusCode: 001,
          ),
        );
      }
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return Tuple.right(null);
    } on FirebaseAuthException catch (firebase) {
      return Tuple.left(
        ApiError(
          endpoint: "reset-password-firebase",
          message: firebase.code,
          statusCode: 400,
        ),
      );
    } catch (e) {
      return Tuple.left(
        ApiError(
          endpoint: "reset-password-firebase",
          message: e.toString(),
          statusCode: 500,
        ),
      );
    }
  }

  Future<bool> _haveInternet() async => await _checkInternet.hasInternet();
}
