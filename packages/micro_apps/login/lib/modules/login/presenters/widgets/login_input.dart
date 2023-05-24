import 'package:common/common.dart';
import 'package:flutter/material.dart';

class LoginInput extends StatefulWidget {
  final String label;
  final String? hintLabel;
  final bool isPassword;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputType textInputType;
  final TextInputAction textInputAction;

  const LoginInput({
    super.key,
    required this.label,
    this.hintLabel,
    this.isPassword = false,
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

  @override
  void initState() {
    super.initState();
    isHiden = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
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
            style: AppFonts.montserrat(
              letterSpacing: isHiden ? 5 : 0,
            ),
            textInputAction: widget.textInputAction,
            keyboardAppearance: Brightness.dark,
            keyboardType: widget.textInputType,
            obscuringCharacter: "*",
            obscureText: widget.isPassword ? isHiden : false,
            decoration: InputDecoration(
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
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              hintText: widget.hintLabel,
              hintStyle: AppFonts.montserrat(
                color: AppColors.grey,
              ),
              border: UnderlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.white,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: AppColors.purple,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
