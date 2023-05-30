import 'package:common/common.dart';
import 'package:flutter/material.dart';

class SocialLoginButton extends StatefulWidget {
  final Size size;
  final String image;
  final Future<void> Function() onTap;
  final Color color;

  const SocialLoginButton({
    super.key,
    required this.image,
    required this.size,
    required this.onTap,
    required this.color,
  });

  @override
  State<SocialLoginButton> createState() => _SocialLoginButtonState();
}

class _SocialLoginButtonState extends State<SocialLoginButton> {
  bool _isButtonDisabled = false;

  void _activeButton() {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _isButtonDisabled = false;
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
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(1000),
        color: widget.color,
        child: InkWell(
          enableFeedback: false,
          splashColor: AppColors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(1000),
          onTap: _isButtonDisabled
              ? () {}
              : () async {
                  _desactiveButton();
                  await widget.onTap();
                  _activeButton();
                },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(
              widget.image,
              width: 50,
              height: 50,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
          ),
        ),
      ),
    );
  }
}