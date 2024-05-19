
import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';

import '../../constants.dart';
import '../../models/note_model.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});

  final NoteModel note;
  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = Kcolors.indexOf(Color(widget.note.color));
    super.initState();
  }
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
              widget.note.color = Kcolors[index].value;
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
