import 'package:flutter/material.dart';
import 'package:untitled/config/themes/themes.dart';

class ProfilTextFormWidget extends StatelessWidget {
  ProfilTextFormWidget(
      {required this.formTitle,
      required this.formHint,
      required this.keyboardType,
      required this.maxLines,
      required this.readOnly,
      required this.controller});

  String formTitle;
  String formHint;
  int maxLines;
  bool readOnly;
  TextInputType keyboardType;
  TextEditingController controller;

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
                fontSize: 15,
              ),
            ),
          ),
          TextFormField(
            controller: controller,
            cursorColor: Themes.mainColor,
            readOnly: readOnly,
            style: TextStyle(color: Themes.mainColor),
            keyboardType: keyboardType,
            minLines: maxLines-2,
            maxLines: maxLines,
            decoration: InputDecoration(
                hintText: formHint,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Themes.mainColor, width: 2.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Themes.mainColor, width: 2.5),
              ),
                hintStyle: TextStyle(color: Colors.white),),
          )
        ],
      ),
    );
  }
}
