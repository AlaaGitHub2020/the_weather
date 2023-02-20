import 'package:flutter/material.dart';

class LocationText extends StatelessWidget {
  final String location;

  const LocationText({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      location,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
