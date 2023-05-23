import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  static const route = "/error";
  final String error;

  const ErrorPage({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: AppColors.yellow,
              size: 150,
            ),
            Column(
              children: [
                Text(
                  "Ooops...",
                  textAlign: TextAlign.center,
                  style: AppFonts.montserrat(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Error: $error",
                  textAlign: TextAlign.center,
                  style: AppFonts.montserrat(
                    fontSize: 20,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
