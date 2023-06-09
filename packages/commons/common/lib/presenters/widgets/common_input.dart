import 'package:common/common.dart';
import 'package:flutter/material.dart';

//TODO bug de muito bottom padding
class CommonInput extends StatefulWidget {
  final String label;
  final String? counterLabel;
  final String? hintLabel;
  final bool isPassword;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final VoidCallback? onCounterTap;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  const CommonInput({
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
  State<CommonInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<CommonInput> {
  late bool isHiden;
  final double _borderRadius = 15;
  final _focus = FocusNode();
  double bottom = 0;

  @override
  void initState() {
    super.initState();
    isHiden = widget.isPassword;
    _focus.addListener(() {
      if (_focus.hasFocus) {
        return setState(() {
          bottom = MediaQuery.of(context).viewInsets.bottom * 1.1;
        });
      }
      return setState(() {
        bottom = 0;
      });
    });
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 15),
              child: Text(
                widget.label,
                style: AppFonts.sourceSansPro(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextFormField(
              focusNode: _focus,
              validator: widget.validator,
              onChanged: widget.onChanged,
              style: AppFonts.montserrat(letterSpacing: isHiden ? 5 : 0),
              textInputAction: widget.textInputAction,
              keyboardAppearance: Brightness.dark,
              keyboardType: widget.textInputType,
              obscuringCharacter: "*",
              obscureText: widget.isPassword ? isHiden : false,
              enableSuggestions: true,
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
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.red),
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      const BorderSide(width: 2, color: AppColors.black),
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
      ),
    );
  }
}
