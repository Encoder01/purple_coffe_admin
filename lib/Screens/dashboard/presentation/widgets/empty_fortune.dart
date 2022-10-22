import 'package:flutter/material.dart';

import '../../../../config/themes/themes.dart';
import 'elevated_button.dart';

class EmptyFortuneWidget extends StatelessWidget {
  EmptyFortuneWidget({Key? key, required this.onTap}) : super(key: key);
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.purple),
            child: const Icon(Icons.mail, size: 52),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Gelen Kutusu Boş",
            style: TextStyle(
              color: Themes.mainColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
