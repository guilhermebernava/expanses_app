// import 'package:common/common.dart';
// import 'package:flutter/material.dart';

// class CommonButton extends StatefulWidget {
//   final Future<void> Function() onTap;
//   final bool isReverseColor;
//   final Widget child;
//   final bool _isSafeButton;

//   const CommonButton({
//     super.key,
//     required this.onTap,
//     required this.child,
//     this.isReverseColor = false,
//   }) : _isSafeButton = false;

//   const CommonButton.safeButton({
//     super.key,
//     required this.onTap,
//     required this.child,
//     this.isReverseColor = false,
//   }) : _isSafeButton = true;

//   @override
//   State<CommonButton> createState() => _CommonButtonState();
// }

// class _CommonButtonState extends State<CommonButton>
//     with TickerProviderStateMixin {
//   late final AnimationController? _animationController;
//   late final Animation<double>? _widthAnimation;
//   double borderRadius = 100;
//   bool _isButtonDisabled = false;

//   @override
//   void initState() {
//     super.initState();
//     if (widget._isSafeButton) {
//       _animationController = AnimationController(
//           vsync: this, duration: const Duration(milliseconds: 800));

//       _widthAnimation = Tween<double>(begin: double.infinity, end: 110).animate(
//         CurvedAnimation(
//           parent: _animationController!,
//           curve: Curves.easeInOutCirc,
//         ),
//       );
//     }
//   }

//   void _activeButton() {
//     Future.delayed(const Duration(milliseconds: 1500), () {
//       if (mounted) {
//         setState(() {
//           _isButtonDisabled = false;
//         });
//         _animationController?.reverse();
//       }
//     });
//   }

//   void _desactiveButton() {
//     if (!_isButtonDisabled && mounted) {
//       setState(() {
//         _isButtonDisabled = true;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget._isSafeButton ? _safeButton() : _notSafeButton();
//   }

//   Widget _notSafeButton() {
//     return Container(
//       decoration: BoxDecoration(
//         border: widget.isReverseColor
//             ? Border.all(
//                 width: 4,
//                 color: AppColors.primary,
//               )
//             : null,
//         borderRadius: BorderRadius.circular(borderRadius),
//       ),
//       child: Material(
//         borderRadius: BorderRadius.circular(borderRadius),
//         color: widget.isReverseColor ? Colors.transparent : AppColors.primary,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(20),
//           splashColor: AppColors.white.withOpacity(0.1),
//           enableFeedback: false,
//           onTap: () async => await widget.onTap(),
//           child: Center(child: widget.child),
//         ),
//       ),
//     );
//   }

//   Widget _safeButton() {
//     return AnimatedBuilder(
//       animation: _widthAnimation!,
//       builder: (_, child) => Container(
//         width: _widthAnimation!.value,
//         decoration: BoxDecoration(
//           border: widget.isReverseColor
//               ? Border.all(
//                   width: 4,
//                   color: AppColors.primary,
//                 )
//               : null,
//           borderRadius: BorderRadius.circular(borderRadius),
//         ),
//         child: child,
//       ),
//       child: Material(
//         borderRadius: BorderRadius.circular(borderRadius),
//         color: widget.isReverseColor ? Colors.transparent : AppColors.primary,
//         child: InkWell(
//           borderRadius: BorderRadius.circular(20),
//           splashColor: AppColors.white.withOpacity(0.1),
//           enableFeedback: false,
//           onTap: _isButtonDisabled
//               ? () {}
//               : () async {
//                   _desactiveButton();
//                   _animationController!.forward();
//                   await widget.onTap();
//                   _activeButton();
//                 },
//           child: Center(
//             child: _isButtonDisabled
//                 ? const CircularProgressIndicator(
//                     color: AppColors.white,
//                   )
//                 : widget.child,
//           ),
//         ),
//       ),
//     );
//   }
// }
