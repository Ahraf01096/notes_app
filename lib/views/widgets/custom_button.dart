import 'package:flutter/material.dart';

import '../../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap,  this.isLoading = false});
 final void Function()? onTap;
 final bool isLoading ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: kPrimaryColor,
          ),
          width: MediaQuery.of(context).size.width,
          height: 55,
          child:  Center(
              child: isLoading? const SizedBox(
                height: 24,
                  width: 24,
                  child: CircularProgressIndicator(color: Colors.black,)) :const Text(
                'Add',
                style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.w500),
              ))),
    );
  }
}
