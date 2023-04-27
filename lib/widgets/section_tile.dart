
import 'package:flutter/material.dart';

class SectionTile extends StatelessWidget {
  const SectionTile({Key? key, required this.title}) : super(key: key);
  final  String title;

  @override
  Widget build(BuildContext context) {
    return  Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric( horizontal: 20.0),
          child: Text(title,style: Theme.of(context).textTheme.displayMedium,),
        ));
  }
}