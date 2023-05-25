import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:splash/modules/get_started/presenters/pages/control_expanses_page.dart';
import 'package:splash/modules/get_started/presenters/pages/investiment_page.dart';
import 'package:splash/modules/get_started/presenters/pages/keep_page.dart';
import 'package:splash/modules/get_started/presenters/widgets/carrousel_widget.dart';
import 'package:splash/modules/get_started/services/show_modal_bottom_sheet_services.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: AbstractBackground(
        image: AppAssets.backgroundGrey,
        opacity: 0.08,
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
                    child: CommonButton(
                      width: size.width,
                      onTap: () => ShowModalBottomSheetServices.showGetStarted(
                        context,
                        size,
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
