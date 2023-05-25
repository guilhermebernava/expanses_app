import 'dart:async';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CarrouselWidget extends StatefulWidget {
  final List<Widget> children;
  final double viewportFraction;
  final double height;
  final int timeToChangeScreens;

  const CarrouselWidget({
    super.key,
    required this.children,
    this.viewportFraction = 1.0,
    required this.height,
    this.timeToChangeScreens = 10,
  });

  @override
  State<CarrouselWidget> createState() => _CarrouselWidgetState();
}

class _CarrouselWidgetState extends State<CarrouselWidget> {
  late final PageController pageController;
  int selectedPage = 0;
  late int maxPages;
  Timer? carrouselTimer;

  Timer generateTimer() {
    return Timer.periodic(Duration(seconds: widget.timeToChangeScreens),
        (timer) {
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
    maxPages = widget.children.length;
    pageController = PageController(
      initialPage: 0,
      viewportFraction: widget.viewportFraction,
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
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: widget.height * 0.8,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                if (mounted) {
                  setState(() {
                    selectedPage = value;
                  });
                }
              },
              itemBuilder: (_, index) => AnimatedBuilder(
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
                  child: widget.children[index],
                ),
              ),
              itemCount: maxPages,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 30),
            child: Row(
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
                    width: selectedPage == index ? 10 : 6,
                    height: selectedPage == index ? 10 : 6,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: selectedPage == index
                          ? AppColors.primary
                          : Colors.grey.shade300,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
