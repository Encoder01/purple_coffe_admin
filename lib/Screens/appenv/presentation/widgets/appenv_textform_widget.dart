import 'package:flutter/material.dart';
import 'package:untitled/config/themes/themes.dart';

class AppEnvTextFormWidget extends StatelessWidget {
  AppEnvTextFormWidget(
      {required this.formTitle,
      required this.formHint,
      this.enabled=true,
      required this.controller});

  String formTitle;
  String formHint;
  TextEditingController controller;
  bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 12, left: 8, right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              formTitle,
              style: TextStyle(
                color: Themes.mainColor,
                fontSize: 13,
              ),
            ),
          ),
          TextFormField(
            controller: controller,
            enabled: enabled,
            cursorColor: Themes.mainColor,
            style: TextStyle(color: Themes.mainColor),
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: formHint,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Themes.mainColor, width: 2.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Themes.mainColor, width: 2.5),
              ),disabledBorder:OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Themes.mainColor, width: 2.5),
            ) ,
                hintStyle: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }
}
