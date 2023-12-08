import 'package:flutter/services.dart';

import '../bases/screens/exports.dart';
//import '../common/models/place_detail.dart';

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
    // this.locationSelectorTitle,
    // this.onLocationSelected,
    // this.onDatePicked,
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
  // final String? locationSelectorTitle;
  //final void Function(PlaceDetail)? onLocationSelected;
//  final void Function(DateTime?)? onDatePicked;

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
      // FormInputType.dateTimeSelector => _contentInput(
      //     suffixIcon: const Icon(
      //       Icons.arrow_drop_down_circle_outlined,
      //       size: 22,
      //     ),
      //   ).ignoreWhen(true).onTap(
      //     radius: AppConstants.inputs.radius,
      //     () {
      //       FocusScope.of(context).unfocus();
      //       Picker(
      //         columnFlex: [2, 1, 3, 1, 1, 1],
      //         selectionOverlay: const CupertinoPickerDefaultSelectionOverlay(
      //           capEndEdge: false,
      //           capStartEdge: false,
      //         ),
      //         hideHeader: true,
      //         adapter: DateTimePickerAdapter(
      //           type: PickerDateTimeType.kMDYHM_AP,
      //           minValue: DateTime.now(),
      //           minuteInterval: 5,
      //         ),
      //         containerColor: Colors.transparent,
      //         backgroundColor: Colors.transparent,
      //         columnPadding: EdgeInsets.zero,
      //         // textStyle: AppFonts.helvetica.withSize(FontSizes.subtitle).withColor(AppColors.greyDark),
      //         //selectedTextStyle: AppFonts.helvetica.semiBold().withSize(FontSizes.subtitle),
      //         //cancelTextStyle: AppFonts.helvetica.withSize(FontSizes.subtitle),
      //         //confirmTextStyle: AppFonts.helvetica.withSize(FontSizes.subtitle),
      //         onConfirm: (Picker picker, _) {
      //           //widget.controller?.text =
      //           // DateFormat('MMMM d, y | h:mm a').format((picker.adapter as DateTimePickerAdapter).value!);
      //           // widget.onDatePicked?.call((picker.adapter as DateTimePickerAdapter).value);
      //         },
      //       ).showDialog(context);
      //     },
      //   ),
      // FormInputType.locationSelector => _contentInput(
      //     suffixIcon: const Icon(
      //       Icons.arrow_drop_down,
      //       size: 18,
      //       color: AppColors.primary,
      //     ),
      //   ).ignoreWhen(true)
      // .onTap(
      //       () => Get.toNamed(
      //         locationSearchModule.name,
      //         arguments: {"title": widget.locationSelectorTitle},
      //       )?.then((placeDetail) {
      //         if (placeDetail != null) {
      //           widget.controller?.text = (placeDetail).address;
      //           widget.onLocationSelected?.call(placeDetail);
      //         }
      //       }),
      // )
    };
  }

  TextFormField _contentInput({
    bool isPassword = false,
    bool obscure = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      cursorColor: darkTheme ? Colors.white : AppColors.primary,
      cursorHeight: FontSizes.title,
      enabled: widget.enabled,
      initialValue: widget.initialValue,
      expands: widget.expands,
      textCapitalization: widget.textCapitalization,
      enableInteractiveSelection: true,
      controller: widget.controller,
      style: AppFonts.inter
          .withColor(darkTheme ? AppColors.hint : AppColors.primary),
      obscureText: obscure,
      minLines: isPassword ? 1 : widget.minLines,
      maxLines: isPassword ? 1 : widget.maxLines,
      // maxLength: isPassword ? AppConstants.inputs.passwordInputMaxLength : widget.maxLength,
      keyboardType:
          isPassword ? TextInputType.visiblePassword : widget.keyboardType,
      validator: widget.validator,
      autovalidateMode: AppConstants.inputs.inputsAutovalidationMode,
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      onEditingComplete: () {
        widget.focusNode?.unfocus();
        widget.nextFocusNode?.requestFocus();
      },
      buildCounter: (_,
              {int? currentLength, int? maxLength, bool? isFocused}) =>
          widget.displayCounter
              ? Text(
                  "$currentLength/$maxLength",
                  style: AppFonts.inter.withSize(FontSizes.indication),
                )
              : null,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        // enabledBorder: Theme.of(context)
        //     .inputDecorationTheme
        //     .enabledBorder
        //     ?.copyWith(
        //       borderSide: BorderSide(
        //         color: darkTheme ? AppColors.primary : AppColors.inputBorder,
        //         width: AppConstants.inputs.borderWidth,
        //       ),
        //     ),
        // focusedBorder: Theme.of(context)
        //     .inputDecorationTheme
        //     .focusedBorder
        //     ?.copyWith(
        //       borderSide: BorderSide(
        //         color: darkTheme ? AppColors.primary : AppColors.inputBorder,
        //         width: AppConstants.inputs.borderWidth,
        //       ),
        //     ),
        isDense: true,
        fillColor: widget.fillColor,
        filled: widget.fillColor != null,

        //* Label
        labelText: widget.label,
        labelStyle:
            AppFonts.inter.withSize(FontSizes.title).withColor(AppColors.grey),

        //* Hint
        hintText: widget.hint ?? "",
        hintStyle: AppFonts.inter.withColor(widget.hintColor ?? AppColors.hint),

        errorStyle: AppFonts.inter.withColor(AppColors.remove),
        prefixIcon: widget.prefixIcon,
        prefixIconColor: AppColors.grey,
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.grey,
      ),
    );
  }
}
