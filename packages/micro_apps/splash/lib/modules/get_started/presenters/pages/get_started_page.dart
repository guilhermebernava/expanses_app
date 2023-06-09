import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:splash/modules/get_started/presenters/pages/control_expanses_page.dart';
import 'package:splash/modules/get_started/presenters/pages/investiment_page.dart';
import 'package:splash/modules/get_started/presenters/pages/keep_page.dart';
import 'package:splash/modules/get_started/presenters/widgets/carrousel_widget.dart';

class GetStartedPage extends StatelessWidget {
  final GoogleAuthUsecase googleAuthUsecase;
  final UserBloc userBloc;

  const GetStartedPage({
    super.key,
    required this.googleAuthUsecase,
    required this.userBloc,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return CommonPage(
      padding: EdgeInsets.zero,
      body: AbstractBackground(
        image: AppAssets.backgroundBlue,
        opacity: 0.3,
        size: size,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  MovingAnimation(
                    fromWhere: const Offset(1, 0),
                    child: CarrouselWidget(
                      height: size.height * 0.8,
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
                  ),
                  MovingAnimation(
                    fromWhere: const Offset(-1, 0),
                    child: CommonButtonText(
                      width: 200,
                      onTap: () async =>
                          ShowModalBottomSheetServices.showGetStarted(
                        context,
                        size,
                        googleAuthUsecase,
                        userBloc,
                      ),
                      text: "Get Started",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
