import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../helper/show_snack_bar.dart';
import '../../models/note_model.dart';

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

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          'No',
          style: TextStyle(color: Color(0xff76D6EE)),
        ));
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
    return ElevatedButton(
        onPressed: () {
          note.delete();
          BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          Navigator.pop(context);
          showSnackBar(
            context,
            'Deleted',
            Colors.red,
          );
        },
        child: const Text(
          'Yes',
          style: TextStyle(color: Color(0xff76D6EE)),
        ));
  }
}
