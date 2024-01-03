import 'package:flutter/services.dart';

import '../bases/screens/exports.dart';

enum FormInputType {
  normal,
  password,
}

enum InputTheme { light, dark }

class FormInput extends StatefulWidget {
  const FormInput({
    super.key,
    this.theme = InputTheme.dark,
    this.type = FormInputType.normal,
    this.fillColor,
    this.initialValue,
    this.enabled = true,
    this.controller,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconRightPadding = 0,
    this.label,
    this.hint,
    this.hintColor,
    this.minLines = 1,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.validator,
    this.focusNode,
    this.nextFocusNode,
    this.displayCounter = false,
    this.isCollapsed = false,
    this.textCapitalization = TextCapitalization.none,
    this.expands = false,
    this.inputFormatters,
    this.isDescriptionField = false,
    this.isSearchField = false,
  });

  final InputTheme theme;
  final Color? fillColor;

  final String? initialValue;
  final bool enabled;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double suffixIconRightPadding;
  final String? label;

  final String? hint;
  final Color? hintColor;
  final bool displayCounter;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final FocusNode? nextFocusNode;
  final bool isCollapsed;
  final TextCapitalization textCapitalization;
  final bool expands;
  final List<TextInputFormatter>? inputFormatters;

  final FormInputType type;
  final bool isDescriptionField;
  final bool isSearchField;

  @override
  createState() => _State();
}

class _State extends State<FormInput> {
  bool _obscure = true;
  bool get darkTheme => widget.theme == InputTheme.dark;

  @override
  Widget build(BuildContext context) {
    return switch (widget.type) {
      FormInputType.normal => _contentInput(
          suffixIcon: widget.suffixIcon,
        ),
      FormInputType.password => _contentInput(
          isPassword: true,
          obscure: _obscure,
          suffixIcon: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () => setState(() => _obscure = !_obscure),
            icon: Icon(
              _obscure ? Icons.visibility_off : Icons.visibility,
              size: 24,
              color: AppColors.grey,
            ),
          ),
        ),
    };
  }

  SizedBox _contentInput({
    bool isPassword = false,
    bool obscure = false,
    Widget? suffixIcon,
  }) {
    return SizedBox(
      child: TextFormField(
        cursorColor: (darkTheme && !widget.isSearchField) ? Colors.white : AppColors.primary,
        // cursorHeight: cursorHeight ?? FontSizes.title,
        enabled: widget.enabled,
        initialValue: widget.initialValue,
        expands: widget.expands,
        textCapitalization: widget.textCapitalization,
        enableInteractiveSelection: true,
        controller: widget.controller,
        style: AppFonts.inter.withColor((darkTheme && !widget.isSearchField) ? AppColors.hint : AppColors.primary),
        obscureText: obscure,
        minLines: isPassword ? 1 : widget.minLines,
        maxLines: isPassword ? 1 : widget.maxLines,
        // maxLength: isPassword ? AppConstants.inputs.passwordInputMaxLength : widget.maxLength,
        keyboardType: isPassword ? TextInputType.visiblePassword : widget.keyboardType,
        validator: widget.validator,
        autovalidateMode: AppConstants.inputs.inputsAutovalidationMode,
        focusNode: widget.focusNode,
        onChanged: widget.onChanged,
        onEditingComplete: () {
          widget.focusNode?.unfocus();
          widget.nextFocusNode?.requestFocus();
        },
        buildCounter: (_, {int? currentLength, int? maxLength, bool? isFocused}) => widget.displayCounter
            ? Text(
                "$currentLength/$maxLength",
                style: AppFonts.inter.withSize(FontSizes.indication),
              )
            : null,
        inputFormatters: widget.inputFormatters,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppConstants.inputs.radius),
          ),
          enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder?.copyWith(
                borderSide: BorderSide(
                  color: AppColors.transparent,
                  width: AppConstants.inputs.borderWidth,
                ),
              ),
          focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder?.copyWith(
                borderSide: BorderSide(
                  color: AppColors.secondary,
                  width: AppConstants.inputs.borderWidth,
                ),
              ),
          isDense: true,
          fillColor: widget.fillColor,
          filled: widget.fillColor != null,

          // //* Label
          // labelText: widget.label,
          // labelStyle: AppFonts.inter.withSize(FontSizes.title).withColor(AppColors.grey),

          //* Hint
          hintText: widget.hint ?? "",
          hintStyle: AppStyles.interregularTitle.withColor(widget.hintColor ?? AppColors.grey),
          errorStyle: AppFonts.inter.withColor(AppColors.remove),
          prefixIcon: widget.prefixIcon,
          prefixIconColor: AppColors.grey,
          suffixIcon: suffixIcon,
          suffixIconColor: AppColors.grey,
        ),
      ),
    );
  }
}
