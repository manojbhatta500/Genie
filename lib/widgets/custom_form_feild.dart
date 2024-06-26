import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  final bool obscure;
  final Widget? prefixIcon;
  final IconButton? suffixIcon;
  final Color? fillColor;
  final int? maxLines;
  final int? maxLength;
  final TextStyle? labelStyle;

  const CustomTextFormField({
    Key? key,
    this.hintText,
    this.labelStyle,
    this.controller,
    this.keyboardType,
    this.obscure = false,
    this.prefixIcon,
    this.suffixIcon,
    this.fillColor,
    this.maxLines,
    this.maxLength = 500,
  }) : super(key: key);

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 55,
      width: 0.7 * width,
      // Remove horizontal padding to eliminate extra space
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Color(0XFFE2E8F0),
            blurRadius: 10,
            offset: Offset(0, 6),
            spreadRadius: 4,
          ),
          BoxShadow(
            color: Color(0XFFE2E8F0).withOpacity(0.7),
            blurRadius: 5,
            offset: Offset(0, 3),
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: TextField(
          cursorColor: Colors.black38,
          obscureText: widget.obscure ? _obscureText : false,
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            prefixIcon: GestureDetector(
              onTap: _togglePasswordVisibility,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: widget.prefixIcon ??
                    SvgPicture.asset(
                      'assets/lock.svg',
                      width: 24, // Adjust the width as needed
                      height: 24, // Adjust the height as needed
                    ),
              ),
            ),
            suffixIcon: widget.suffixIcon,
            alignLabelWithHint: true,
            filled: true,
            labelStyle: widget.labelStyle,
            fillColor: Colors.transparent,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
            hintText: widget.hintText,
            enabled: true,
          ),
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
