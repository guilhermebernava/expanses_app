import 'package:common/common.dart';
import 'package:common/presenters/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

class CommonButtonText extends StatefulWidget {
  final double width;
  final Future<void> Function() onTap;
  final String text;
  final bool isReverseColor;
  final Widget? leading;
  final bool _isSafeButton;

  const CommonButtonText({
    super.key,
    required this.width,
    required this.onTap,
    required this.text,
    this.leading,
    this.isReverseColor = false,
  }) : _isSafeButton = false;

  const CommonButtonText.safeButton({
    super.key,
    required this.width,
    required this.onTap,
    required this.text,
    this.leading,
    this.isReverseColor = false,
  }) : _isSafeButton = true;

  @override
  State<CommonButtonText> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButtonText>
    with TickerProviderStateMixin {
  late final AnimationController? _animationController;
  late final Animation<double>? _widthAnimation;
  bool _isButtonDisabled = false;
  final double borderRadius = 100;

  @override
  void initState() {
    super.initState();
    if (widget._isSafeButton) {
      _animationController = AnimationController(
          vsync: this, duration: const Duration(milliseconds: 800));

      _widthAnimation = Tween<double>(begin: widget.width, end: 110).animate(
        CurvedAnimation(
          parent: _animationController!,
          curve: Curves.easeInOutCirc,
        ),
      );
    }
  }

  void _activeButton() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        _animationController?.reverse().then((value) {
          setState(() {
            _isButtonDisabled = false;
          });
        });
      }
    });
  }

  void _desactiveButton() {
    if (!_isButtonDisabled && mounted) {
      setState(() {
        _isButtonDisabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget._isSafeButton ? _safeButton() : _notSafeButton();
  }

  Widget _notSafeButton() {
    return Container(
      key: ValueKey(widget.text),
      width: widget.width,
      decoration: BoxDecoration(
        border: widget.isReverseColor
            ? Border.all(
                width: 4,
                color: AppColors.primary,
              )
            : null,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius),
        color: widget.isReverseColor ? Colors.transparent : AppColors.primary,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: AppColors.white.withOpacity(0.1),
          enableFeedback: false,
          onTap: () async => await widget.onTap(),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                widget.leading ?? Container(),
                Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                  style: AppFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _safeButton() {
    return AnimatedBuilder(
      animation: _widthAnimation!,
      builder: (_, child) => Container(
        key: ValueKey(widget.text),
        width: _widthAnimation!.value,
        decoration: BoxDecoration(
          border: widget.isReverseColor
              ? Border.all(
                  width: 4,
                  color: AppColors.primary,
                )
              : null,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(borderRadius),
        color: widget.isReverseColor ? Colors.transparent : AppColors.primary,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          splashColor: AppColors.white.withOpacity(0.1),
          enableFeedback: false,
          onTap: _isButtonDisabled
              ? () {}
              : () async {
                  _desactiveButton();
                  _animationController!.forward();
                  await widget.onTap();
                  _activeButton();
                },
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              transitionBuilder: (child, anim) {
                return FadeTransition(opacity: anim, child: child);
              },
              child: _isButtonDisabled
                  ? const LoadingWidget(color: AppColors.white)
                  : Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        widget.leading ?? Container(),
                        Text(
                          widget.text,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.fade,
                          style: AppFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
