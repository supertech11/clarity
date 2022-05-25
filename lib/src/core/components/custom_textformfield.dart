import 'package:flutter/material.dart';
import 'package:saffron_clarity/src/core/components/custom_text.dart';
import 'package:saffron_clarity/src/core/resources/colors/pallet.dart';
import 'package:saffron_clarity/src/core/utils/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String? labelText;
  final String? initialValue, hintText;
  final Widget? icon;
  final Color iconColor;

  final bool obscureText, enabled;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final void Function(String?)? onSaved, onChanged;
  final String? Function(String?)? validator;
  final VoidCallback? iconPressed;

  CustomTextFormField(
      {Key? key,
      this.labelText,
      this.icon,
      this.iconColor = kAccentColor,
      this.obscureText = false,
      this.initialValue,
      this.enabled = true,
      this.hintText,
      this.iconPressed,
      this.keyboardType = TextInputType.text,
      this.controller,
      this.onSaved,
      this.onChanged,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // key:key,
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelText != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: CustomText(
                    text: labelText!,
                    weight: FontWeight.w500,
                  ),
                )
              : SizedBox(
                  height: 0,
                ),
          // SizedBox(height: 5,),
          Container(
            height: 50,
            decoration: BoxDecoration(
                color: Pallet.white, borderRadius: BorderRadius.circular(8)),
            child: icon != null
                ? Center(
                    child: TextFormField(
                      controller: controller,
                      onSaved: onSaved,
                      initialValue: initialValue,
                      validator: validator,
                      enabled: enabled,
                      keyboardType: keyboardType,
                      cursorColor: Theme.of(context).accentColor,
                      obscureText: this.obscureText,
                      onChanged: onChanged,
                      decoration: InputDecoration(
                          prefixIcon: IconButton(
                            icon: this.icon!,
                            key: Key("prefixIcon"),
                            onPressed: this.iconPressed,
                            color: iconColor,
                            padding: EdgeInsets.only(left: 10),
                          ),
                          fillColor: Pallet.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Pallet.white,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          hintStyle: TextStyle(
                            color: Pallet.blackNeutral,
                          ),
                          hintText: hintText,
                          contentPadding: EdgeInsets.only(left: 20, top: 15),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Pallet.white,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Pallet.white,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          errorBorder: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Pallet.primary),
                              borderRadius: BorderRadius.circular(8)),
                          focusedErrorBorder: InputBorder.none),
                    ),
                  )
                : Center(
                    child: TextFormField(
                      controller: controller,
                      onSaved: onSaved,
                      validator: validator,
                      initialValue: initialValue,
                      keyboardType: keyboardType,
                      enabled: enabled,
                      onChanged: onChanged,
                      obscureText: this.obscureText,
                      decoration: InputDecoration(
                          // suffixIcon: IconButton(
                          //   icon: Text(""),
                          //   onPressed: this.iconPressed,
                          // ),
                          fillColor: Pallet.white,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Pallet.white,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          hintText: hintText,
                          hintStyle: TextStyle(
                            color: Pallet.blackNeutral,
                          ),
                          contentPadding: EdgeInsets.only(left: 20),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Pallet.white,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Pallet.white,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          errorBorder: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Pallet.primary),
                              borderRadius: BorderRadius.circular(8)),
                          focusedErrorBorder: InputBorder.none),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
