import 'package:expenzio/app/base_app.dart';
import 'package:flutter/material.dart';
import 'package:common/common.dart';

class ErrorPage extends StatelessWidget {
  final FlutterErrorDetails details;
  const ErrorPage({
    super.key,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.darkBlue,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(),
                const Icon(
                  Icons.warning_rounded,
                  color: AppColors.white,
                  size: 150,
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      width: double.infinity,
                      child: Text(
                        "Oops, something went wrong...",
                        textAlign: TextAlign.center,
                        style: AppFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      details.exception.toString(),
                      style: AppFonts.montserrat(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                CommonButtonText(
                  onTap: () async => App.restartApp(context),
                  text: "Reload App",
                  width: double.infinity,
                ),
              ]),
        ),
      ),
    );
  }
}
