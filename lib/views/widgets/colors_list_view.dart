import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});
  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ?  CircleAvatar(
            radius: 34,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: color,
            ),
          )
        :  CircleAvatar(
            radius: 28,
            backgroundColor: color,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
 int currentIndex =0;
 List<Color> colors = const [
   Color(0xffFFCC80),
   Color(0xff145462),
   Color(0xc8791380),
   Color(0xA5856507),
   Color(0xc8771b25),
   Color(0xff607e16),
   Color(0xff768eee),
 ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) =>  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: GestureDetector(
            onTap: (){
              currentIndex = index;
              setState(() {

              });
            },
            child: ColorItem(
              color: colors[index],
              isSelected: currentIndex == index,
            ),
          ),
        ),
      ),
    );
  }
}
