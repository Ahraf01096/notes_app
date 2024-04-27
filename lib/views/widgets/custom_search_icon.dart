import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({super.key, required this.icon});
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withOpacity(.1)),
      child: IconButton(
        onPressed: () {},
        icon:  Icon(
         icon,
          color: Colors.white,
          size: 28,
        ),
      ),
    );
  }
}
