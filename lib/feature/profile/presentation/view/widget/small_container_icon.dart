import 'package:flutter/material.dart';

class SmallContainerIcon extends StatelessWidget {
  SmallContainerIcon({super.key,required this.name,required this.icon});
  String name;
  IconData icon ;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width * 0.2,
        height: height * 0.1,
        // height: height * 0.09,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius:
          BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children:  [
              Icon(
                icon,
                color: const Color(0xff008FA0),
                size: 40,
              ),
              Text(
                name,
                style:
                const TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}
