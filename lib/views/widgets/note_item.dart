import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

import '../../helper/show_snack_bar.dart';
import 'edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  // final Color color ;
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditNoteView(
            note: note,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Color(note.color)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              title: Text(
                note.title,
                style: const TextStyle(color: Colors.black, fontSize: 26),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  note.subTitle,
                  style: TextStyle(
                      color: Colors.black.withOpacity(.5), fontSize: 16),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) =>
                      AlertDialog(note: note)
                  );
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              note.date,
              style: TextStyle(color: Colors.black.withOpacity(.5)),
            )
          ],
        ),
      ),
    );
  }
}

class AlertDialog extends StatelessWidget {
  const AlertDialog({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
                        title: const Text('Do you want delete it ?'),
                        actions: [
    DeleteButton(note: note),
    const CancelButton()
                        ],
                      );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      Navigator.pop(context);
    }, child: const Text('No',style: TextStyle(color: Color(0xff76D6EE)),));
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
    required this.note,
  });

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      note.delete();
      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
      Navigator.pop(context);
      showSnackBar(
        context,
        'Deleted',
        Colors.red,
      );
    }, child: const Text('Yes',style: TextStyle(color: Color(0xff76D6EE)),));
  }
}
