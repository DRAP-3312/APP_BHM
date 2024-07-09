// import 'package:flutter/material.dart';

// class MyTextFormField extends StatelessWidget {
//   // ignore: prefer_typing_uninitialized_variables
//   final controller;
//   final String hintText;
//   final bool obscureText;
//   final Icon? suffixIcon;
//   final String? Function(String?)? validator;

//   const MyTextFormField(
//       {super.key,
//       required this.controller,
//       required this.hintText,
//       required this.obscureText,
//       this.suffixIcon,
//       this.validator});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25.0),
//       child: TextFormField(
//         controller: controller,
//         obscureText: obscureText,
//         decoration: InputDecoration(
//           enabledBorder: const OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.white),
//           ),
//           // focusedBorder: OutlineInputBorder(
//           //   borderSide: BorderSide(color: GlobalColors.color20),
//           // ),
//           //fillColor: GlobalColors.color20.withOpacity(0.25),
//           filled: true,
//           hintText: hintText,
//           hintStyle: TextStyle(
//             color: Colors.grey[500],
//           ),
//           suffixIcon: suffixIcon,
//         ),
//         validator: validator,
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final ValueChanged<String>? onChanged;

  const MyTextFormField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      obscureText: obscureText,
      onChanged: onChanged,
    );
  }
}
