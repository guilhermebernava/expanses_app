import 'dart:async';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

//TODO componentizar widget

class CarrouselWidget extends StatefulWidget {
  const CarrouselWidget({super.key});

  @override
  State<CarrouselWidget> createState() => _CarrouselWidgetState();
}

class _CarrouselWidgetState extends State<CarrouselWidget> {
  late final PageController pageController;
  int selectedPage = 0;
  int maxPages = 3;
  Timer? carrouselTimer;

  Timer generateTimer() {
    return Timer.periodic(const Duration(seconds: 5), (timer) {
      if (selectedPage == maxPages) {
        selectedPage = 0;
      }
      pageController.animateToPage(
        selectedPage,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      selectedPage++;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
    carrouselTimer = generateTimer();
  }

  @override
  void dispose() {
    pageController.dispose();
    carrouselTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (value) {
              if (mounted) {
                setState(() {
                  selectedPage = value;
                });
              }
            },
            itemBuilder: (_, __) => AnimatedBuilder(
              animation: pageController,
              builder: (_, child) => child!,
              child: GestureDetector(
                onPanDown: (details) {
                  carrouselTimer?.cancel();
                  carrouselTimer = null;
                },
                onPanCancel: () {
                  carrouselTimer = generateTimer();
                },
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    top: 36,
                    bottom: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              ),
            ),
            itemCount: maxPages,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            maxPages,
            (index) => GestureDetector(
              onTap: () {
                pageController.animateToPage(
                  index,
                  duration: const Duration(
                    milliseconds: 300,
                  ),
                  curve: Curves.easeInSine,
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 7),
                width: 20,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: selectedPage == index
                      ? AppColors.yellow
                      : Colors.grey.shade300,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
