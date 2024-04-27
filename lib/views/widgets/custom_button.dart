import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kPrimaryColor,
        ),
        width: MediaQuery.of(context).size.width,
        height: 55,
        child: const Center(
            child: Text(
              'Add',
              style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
            )));
  }
}
