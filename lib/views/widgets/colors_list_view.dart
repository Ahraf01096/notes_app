import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';

import '../../constants.dart';

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Kcolors.length,
        itemBuilder: (context, index) =>  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: GestureDetector(
            onTap: (){
              currentIndex = index;
              BlocProvider.of<AddNoteCubit>(context).color = Kcolors[index];
              setState(() {});
            },
            child: ColorItem(
              color: Kcolors[index],
              isSelected: currentIndex == index,
            ),
          ),
        ),
      ),
    );
  }
}
