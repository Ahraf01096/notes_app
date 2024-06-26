import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';

import '../../helper/show_snack_bar.dart';
import 'custom_text_field.dart';
import 'edit_note_color_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
   String? title, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBar(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;
                widget.note.save();


                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);

                if (widget.note.title == title &&
                    widget.note.subTitle == content) {
                  showSnackBar(
                    context,
                    'The note title and content has been edited',
                    Colors.green,
                  );
                } else if (widget.note.title == title &&
                    widget.note.subTitle != content) {
                  showSnackBar(
                    context,
                    'The note title only has been edited',
                    Colors.green,
                  );
                } else if (widget.note.title != title &&
                    widget.note.subTitle == content) {
                  showSnackBar(
                    context,
                    'The note content only has been edited',
                    Colors.green,
                  );
                 }
                // else {
                //   showSnackBar(
                //     context,
                //     'The note has not been edited',
                //     Colors.red,
                //   );
                // }
              },
              title: 'Edit Notes',
              icon: Icons.check,
            ),
            const SizedBox(
              height: 50,
            ),
             CustomTextField(
              onChanged: (value)
              {
                title = value;
              },
                hint: widget.note.title
            ),
            const SizedBox(
              height: 16
            ),
             CustomTextField(
               onChanged: (value)
               {
                 content = value;
               },
              hint: widget.note.subTitle,
              maxLines: 5,
            ),
            const SizedBox(
              height: 30,
            ),
             EditNoteColorList(
              note: widget.note,
            ),
          ],
        ),
    );
  }
}