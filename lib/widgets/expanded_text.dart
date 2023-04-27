import 'package:flutter/material.dart';

class ExpandedText extends StatelessWidget {
  const ExpandedText({Key? key, required this.title, required this.description}) : super(key: key);

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text(title, style: textTheme.headlineLarge,),
        children: [
          ListTile(
            title: Text(description, style: textTheme.bodyLarge,),
          )
        ],
      ),
    );
  }
}
