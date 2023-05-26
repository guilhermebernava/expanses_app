import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ShowErrorServices {
  static void showError(BuildContext context, String error) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        duration: const Duration(seconds: 5),
        content: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red,
            image: DecorationImage(
              image: const AssetImage(AppAssets.backgroundBlue),
              onError: (exception, stackTrace) {},
              fit: BoxFit.cover,
              opacity: 0.15,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.error,
                  size: 40,
                  color: AppColors.white,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Oh, Snap!",
                    style: AppFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    error,
                    style: AppFonts.montserrat(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
