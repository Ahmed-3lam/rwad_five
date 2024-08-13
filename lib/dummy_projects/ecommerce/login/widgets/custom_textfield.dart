import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String text;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextfield({
    super.key,
    required this.text,
    this.isPassword = false,
    this.controller,
    this.validator,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: TextStyle(fontSize: 14, color: Color(0xFF8B8B97)),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: widget.isPassword && _obscureText,
          validator: widget.validator,
          decoration: InputDecoration(
            suffixIcon: widget.isPassword
                ? InkWell(
                    onTap: () {
                      _obscureText = !_obscureText;
                      setState(() {});
                    },
                    child: Icon(
                      _obscureText
                          ? CupertinoIcons.eye
                          : CupertinoIcons.eye_slash,
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
