import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CommonPageStructure extends StatelessWidget {
  final Size size;
  final double topPadding;
  final Widget? body;
  final EdgeInsets padding;
  final Widget? container;
  final bool canPopUp;

  CommonPageStructure({
    super.key,
    required this.size,
    this.canPopUp = true,
    this.body,
    this.topPadding = 70,
    this.container,
    this.padding = const EdgeInsets.all(20),
  }) {
    if (body == null) {
      assert(container != null);
    }
    if (container == null) {
      assert(body != null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: AbstractBackground(
          image: AppAssets.backgroundBlue,
          opacity: 0.7,
          size: size,
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  canPopUp
                      ? const TransparentAppBarWidget()
                      : Padding(
                          padding: EdgeInsets.only(
                              left: 10, top: topPadding, bottom: 15),
                        ),
                  Expanded(
                    child: container ??
                        Container(
                          width: size.width,
                          height: size.height,
                          padding: padding,
                          decoration: BoxDecoration(
                            color: AppColors.darkBlue,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.5),
                                blurRadius: 10,
                                spreadRadius: 5,
                              )
                            ],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(35),
                              topRight: Radius.circular(35),
                            ),
                          ),
                          child: body,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
