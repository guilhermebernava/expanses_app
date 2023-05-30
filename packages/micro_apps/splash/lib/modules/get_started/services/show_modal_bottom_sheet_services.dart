import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:splash/modules/get_started/presenters/widgets/modal_bottom_sheet/modals/get_started_modal_bottom_sheet.dart';
import 'package:splash/modules/get_started/presenters/widgets/modal_bottom_sheet/modals/sign_in_modal_bottom_sheet.dart';

class ShowModalBottomSheetServices {
  static void showGetStarted(
      BuildContext context, Size size, GoogleAuthUsecase googleAuthUsecase) {
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
      ),
    );
  }

  static void showSignIn(
      BuildContext context, Size size, GoogleAuthUsecase googleAuthUsecase) {
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
        googleAuthUsecase: googleAuthUsecase,
      ),
    );
  }
}
