import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:login/modules/get_started/presenters/widgets/carrousel_widget.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Center(
        child: CarrouselWidget(),
      ),
    );
  }
}
