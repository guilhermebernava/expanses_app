import 'package:flutter/widgets.dart';

class CommonForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<Widget> children;
  final EdgeInsets padding;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const CommonForm({
    super.key,
    required this.children,
    required this.formKey,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.padding = const EdgeInsets.all(8.0),
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: padding,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: children,
          ),
        ),
      ),
    );
  }
}
