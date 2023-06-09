import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ShowModalBottomSheetServices {
  static void showGetStarted(BuildContext context, Size size,
      GoogleAuthUsecase googleAuthUsecase, UserBloc userBloc) {
    showModalBottomSheet(
      context: context,
      elevation: 0,
      isScrollControlled: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: AppColors.mediumBlue,
      builder: (ctx) => GetStartedModalBottomSheet(
        size: size,
        googleAuthUsecase: googleAuthUsecase,
        userBloc: userBloc,
      ),
    );
  }

  static void showSignIn(BuildContext context, Size size,
      GoogleAuthUsecase googleAuthUsecase, UserBloc userBloc) {
    showModalBottomSheet(
      context: context,
      elevation: 0,
      isScrollControlled: true,
      useSafeArea: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      backgroundColor: AppColors.mediumBlue,
      builder: (ctx) => SignInModalBottomSheet(
        size: size,
        userBloc: userBloc,
        googleAuthUsecase: googleAuthUsecase,
      ),
    );
  }
}
