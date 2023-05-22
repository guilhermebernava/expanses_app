import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:login/modules/get_started/presenters/pages/control_expanses_page.dart';
import 'package:login/modules/get_started/presenters/pages/investiment_page.dart';
import 'package:login/modules/get_started/presenters/pages/keep_page.dart';
import 'package:login/modules/get_started/presenters/widgets/carrousel_widget.dart';
import 'package:login/modules/get_started/presenters/widgets/get_started_button.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CarrouselWidget(
                height: size.height * 0.77,
                children: [
                  ControlExpansesPage(
                    size: size,
                  ),
                  KeepPage(
                    size: size,
                  ),
                  InvestimentPage(
                    size: size,
                  ),
                ],
              ),
              GetStartedButton(size: size),
            ],
          ),
        ),
      ),
    );
  }
}
