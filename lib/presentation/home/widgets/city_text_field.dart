import 'package:flutter/material.dart';
import 'package:the_weather/generated/l10n.dart';

class CityTextField extends StatelessWidget {
  final TextEditingController cityController;

  const CityTextField({Key? key, required this.cityController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: S.of(context).typeYourCity),
      autocorrect: false,
      keyboardType: TextInputType.text,
      style: Theme.of(context).textTheme.displayMedium,
      controller: cityController,
    );
  }
}
