import 'package:flutter/material.dart';

class FAB extends StatelessWidget {
  const FAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(side: BorderSide.none),
      child: const Icon(Icons.edit_calendar),
      onPressed: () {},
    );
  }
}
