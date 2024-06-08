import 'package:flutter/material.dart';

class ItemFieldProfilePage extends StatelessWidget {
  ItemFieldProfilePage({super.key,required this.name,required this.titleName});

  String? name ;
  String? titleName ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children:  [
            Text(
              name!,
              style:const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w900),
            ),
            const Spacer(),
            Text(
              titleName!,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w900),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
