import 'package:flutter/material.dart';

class PasswordForm extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget obscureIcon;
  final Widget revealIcon;

  const PasswordForm({
    Key? key,
    this.hintText,
    this.controller,
    this.keyboardType,
    required this.obscureIcon,
    required this.revealIcon,
  }) : super(key: key);

  @override
  _PasswordFormState createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: 45,
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
          obscureText: _obscureText ? _obscureText : false,
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
                child: _obscureText ? widget.obscureIcon : widget.revealIcon,
              ),
            ),
            alignLabelWithHint: true,
            filled: true,
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
