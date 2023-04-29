import 'package:ecomerce/config/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomInputField extends StatefulWidget {
  CustomInputField({
    super.key,
    required this.label,
    required this.hintText,
    this.suffixIcon = false,
    required this.onChange,
  });
  Function(String)? onChange;
  final String label;
  final String hintText;
  final bool suffixIcon;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool passwordVisibility = true;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: TextFormField(
        onChanged: widget.onChange,
        obscureText: !passwordVisibility,
        //obscureText: !_model.passwordVisibility,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: textTheme.headlineLarge,
          hintText: widget.hintText,
          hintStyle: textTheme.headlineLarge,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.blueAccent,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color(0x00000000),
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 5, 5, 24),
          suffixIcon: widget.suffixIcon
              ? InkWell(
                  onTap: () {
                    return setState(
                        () => passwordVisibility = !passwordVisibility);
                  },
                  focusNode: FocusNode(skipTraversal: true),
                  child: Icon(
                    passwordVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: const Color(0xFF95A1AC),
                    size: 22,
                  ),
                )
              : null,
        ),
        style: textTheme.displaySmall,
        // validator: _model.passwordControllerValidator.asValidator(context),
      ),
    );
  }
}
