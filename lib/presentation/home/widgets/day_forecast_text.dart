import 'package:flutter/material.dart';
import 'package:the_weather/generated/l10n.dart';
import 'package:the_weather/presentation/home/widgets/dark_mode_switcher.dart';

class DayForecastText extends StatelessWidget {
  const DayForecastText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).dayForecast,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const DarkModeSwitcher(),
      ],
    );
  }
}
