import 'package:flutter/material.dart';
import 'package:common/common.dart';

class RecoverPasswordDialog extends StatelessWidget {
  final Size size;
  final Email recoverEmail;
  final GlobalKey<FormState> formKey;
  final RecoverPasswordUsecase recoverPasswordUsecase;

  const RecoverPasswordDialog({
    super.key,
    required this.size,
    required this.recoverEmail,
    required this.formKey,
    required this.recoverPasswordUsecase,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 1,
      insetPadding: const EdgeInsets.all(20),
      actionsAlignment: MainAxisAlignment.center,
      backgroundColor: AppColors.darkBlue,
      title: Center(
        child: Text(
          'Password Recovery',
          style: AppFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      content: SizedBox(
        height: size.height * 0.2,
        width: size.width,
        child: CommonForm(
          formKey: formKey,
          children: [
            CommonInput(
              label: "E-mail",
              onChanged: (val) => recoverEmail(val),
              validator: (val) => recoverEmail.validator(),
              textInputAction: TextInputAction.done,
              hintLabel: "email@example.com",
            )
          ],
        ),
      ),
      actions: [
        CommonButtonText.safeButton(
          width: size.width,
          onTap: () async {
            if (!FormValidations.validateForm(formKey)) {
              return;
            }

            final result = await recoverPasswordUsecase(recoverEmail.value);

            if (result.isLeft() && context.mounted) {
              ShowErrorServices.showError(context, result.left.message);
              return;
            }
            if (context.mounted) {
              return Navigator.pop(context);
            }
          },
          text: "RECOVER",
        ),
        const SizedBox(
          height: 30,
        ),
        CommonTextButton(
          text: "CLOSE",
          fontSize: 18,
          onTap: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
