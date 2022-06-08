import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';

class NormalTextField extends StatefulWidget {
  const NormalTextField({
    Key? key,
    this.width,
    this.textController,
    this.validator,
    this.readOnly = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.floatingLabelBehaviour = FloatingLabelBehavior.auto,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.onSaved,
    this.isPasswordField = false,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.labelText,
    this.onTap,
    this.isUnique,
    this.focusedBorderColor = primaryColor,
    this.filled = false,
  }) : super(key: key);

  final double? width;
  final TextEditingController? textController;
  final String? Function(String?)? validator;
  final bool readOnly;
  final AutovalidateMode autovalidateMode;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final bool isPasswordField;
  final TextInputType? keyboardType;
  final String? hintText, labelText;
  final Widget? suffixIcon;
  final FloatingLabelBehavior? floatingLabelBehaviour;
  final void Function()? onTap;
  final Widget? prefixIcon;
  final bool? isUnique;
  final Color focusedBorderColor;
  final bool filled;

  @override
  State<NormalTextField> createState() => _NormalTextFieldState();
}

class _NormalTextFieldState extends State<NormalTextField> {
  bool _obscureText = true;
  var _focusNode = FocusNode();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(color: color, width: 2),
    );
  }

  void _onOnFocusNodeEvent() {
    setState(() {/**  Re-renders */});
  }

  void _onChanged(String? data) {
    setState(() {/**  Re-renders */});
    // widget.onChanged!(data);
  }

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return SizedBox(
      width: widget.width ?? screen.width,
      child: TextFormField(
        controller: widget.textController,
        validator: widget.validator,
        autovalidateMode: widget.autovalidateMode,
        readOnly: widget.readOnly,
        focusNode: _focusNode,
        textInputAction: widget.textInputAction,
        textCapitalization: widget.textCapitalization,
        enableInteractiveSelection: true,
        // onTap: () => FocusScope.of(context).unfocus(),
        onChanged: _onChanged,
        onSaved: widget.onSaved,
        // cursorHeight: .4,
        cursorWidth: .4,
        cursorColor: Colors.white,
        obscuringCharacter: '●',
        obscureText: widget.isPasswordField ? _obscureText : false,
        keyboardType: widget.keyboardType,
        textAlign: TextAlign.start,
        style: bodyText5.copyWith(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          filled: widget.filled,
          fillColor: const Color(0XFFEBEBEB),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.isPasswordField
              ? PasswordSuffixWidget(
                  obscureText: _obscureText,
                  onPressed: _toggle,
                )
              : null,
          contentPadding: EdgeInsets.only(
            left: 18,
            right: widget.isPasswordField ? 12 : 0,
          ),
          hintText: widget.hintText,
          labelText: widget.labelText,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          floatingLabelBehavior: widget.floatingLabelBehaviour,
          floatingLabelStyle: MaterialStateTextStyle.resolveWith(
            (Set<MaterialState> states) {
              final Color color = states.contains(MaterialState.error)
                  ? Colors.red //Theme.of(context).errorColor
                  : primaryColor;
              return TextStyle(
                color: color,
                letterSpacing: 1.3,
              );
            },
          ),
          labelStyle: bodyText6.copyWith(
            fontSize: _focusNode.hasFocus ? 14 : 12,
            fontWeight: FontWeight.w500,
            color: hintTextColor,
          ),
          hintStyle: bodyText6.copyWith(
            fontSize: 14,
            color: hintTextColor,
            fontWeight: FontWeight.w500,
            // letterSpacing: 1.1,
          ),
          enabledBorder: _border(grayColor_),
          focusedBorder: _border(widget.focusedBorderColor),
          errorBorder: _border(Colors.red),
          focusedErrorBorder: _border(Colors.red),
        ),
      ),
    );
  }
}

class PasswordSuffixWidget extends StatelessWidget {
  const PasswordSuffixWidget({
    Key? key,
    required this.onPressed,
    required this.obscureText,
  }) : super(key: key);

  final void Function() onPressed;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 25,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onPressed,
      child: SvgPicture.asset(
        obscureText ? 'assets/svgs/eye-slash.svg' : 'assets/svgs/eye.svg',
        height: 10,
      ),
    );
  }
}
