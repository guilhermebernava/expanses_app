import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CommonPageStructure extends StatelessWidget {
  final Size size;
  final Widget? body;
  final EdgeInsets padding;
  final Widget? container;

  CommonPageStructure({
    super.key,
    required this.size,
    this.body,
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
    return Scaffold(
      body: AbstractBackground(
        opacity: 0.32,
        size: size,
        children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TransparentAppBarWidget(),
                container ??
                    Container(
                      width: size.width,
                      height: size.height * 0.895,
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
