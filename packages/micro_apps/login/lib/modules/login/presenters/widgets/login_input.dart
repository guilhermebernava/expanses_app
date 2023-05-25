import 'package:common/common.dart';
import 'package:flutter/material.dart';

class LoginInput extends StatefulWidget {
  final String label;
  final String? counterLabel;
  final String? hintLabel;
  final bool isPassword;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final VoidCallback? onCounterTap;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  const LoginInput({
    super.key,
    required this.label,
    this.counterLabel,
    this.hintLabel,
    this.isPassword = false,
    this.onCounterTap,
    this.onChanged,
    this.validator,
    this.textInputAction = TextInputAction.next,
    this.textInputType = TextInputType.text,
  });

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  late bool isHiden;
  final double _borderRadius = 15;

  @override
  void initState() {
    super.initState();
    isHiden = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 10),
            child: Text(
              widget.label,
              style: AppFonts.sourceSansPro(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            validator: widget.validator,
            onChanged: widget.onChanged,
            style: AppFonts.montserrat(letterSpacing: isHiden ? 5 : 0),
            textInputAction: widget.textInputAction,
            keyboardAppearance: Brightness.dark,
            keyboardType: widget.textInputType,
            obscuringCharacter: "*",
            obscureText: widget.isPassword ? isHiden : false,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.black,
              counter: widget.counterLabel != null
                  ? GestureDetector(
                      onTap: widget.onCounterTap,
                      child: Text(
                        widget.counterLabel!,
                        style: AppFonts.sourceSansPro(fontSize: 15),
                      ),
                    )
                  : null,
              errorStyle: AppFonts.montserrat(
                color: Colors.red,
                fontSize: 14,
              ),
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () {
                        if (mounted) {
                          setState(() {
                            isHiden = !isHiden;
                          });
                        }
                      },
                      child: Icon(
                        isHiden
                            ? Icons.remove_red_eye_outlined
                            : Icons.remove_red_eye,
                        color: AppColors.white,
                      ),
                    )
                  : null,
              contentPadding: const EdgeInsets.all(20),
              hintText: widget.hintLabel,
              hintStyle: AppFonts.montserrat(color: AppColors.grey),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.primary,
                ),
                borderRadius: BorderRadius.circular(_borderRadius),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: AppColors.black),
                borderRadius: BorderRadius.circular(_borderRadius),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.red),
                borderRadius: BorderRadius.circular(_borderRadius),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
