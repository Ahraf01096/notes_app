import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
   NoteItem({required this.color,super.key});
 final Color color ;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: color),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            title: const Text(
              'Flutter Tips',
              style: TextStyle(color: Colors.black, fontSize: 26),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Build your carer with ahmed ashraf',
                style:
                    TextStyle(color: Colors.black.withOpacity(.5), fontSize: 16),
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
          const SizedBox(height: 16,),
          Text(
            'Apr 26/2024',
            style: TextStyle(color: Colors.black.withOpacity(.5)),
          )
        ],
      ),
    );
  }
}
