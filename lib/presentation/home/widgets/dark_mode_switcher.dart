import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_weather/application/core/theme_cubit/theme_cubit.dart';
import 'package:the_weather/domain/core/utilities/app_theme.dart';
import 'package:the_weather/domain/core/utilities/colors.dart';
import 'package:the_weather/domain/core/utilities/logger/simple_log_printer.dart';
import 'package:the_weather/domain/core/utilities/strings.dart';

class DarkModeSwitcher extends StatefulWidget {
  const DarkModeSwitcher({Key? key}) : super(key: key);

  @override
  State<DarkModeSwitcher> createState() => _DarkModeSwitcherState();
}

class _DarkModeSwitcherState extends State<DarkModeSwitcher> {
  final log = getLogger();

  changeDarkModeTo({required bool darkActive}) async {
    log.i("Toggle Dark mod e && Toggle Dark mode to :$darkActive");
    await SharedPreferences.getInstance().then((value) {
      value.setBool(Strings.cApplicationDarkMode, darkActive);
      context.read<ThemeCubit>().toggleDarkMode();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildSwitcher(),
        buildDarkModeImage(),
      ],
    );
  }

  BlocBuilder<ThemeCubit, AppThemeState> buildSwitcher() {
    return BlocBuilder<ThemeCubit, AppThemeState>(
      builder: (context, state) {
        return Switch.adaptive(
          activeColor: AppColors.primaryColor,
          thumbColor: MaterialStateProperty.all(AppColors.whiteColor1),
          value: context.watch<ThemeCubit>().state.theme == AppTheme.dark(),
          onChanged: (bool value) {
            log.i("Selected Theme value $value");
            changeDarkModeTo(
              darkActive: value,
            );
          },
        );
      },
    );
  }

  BlocBuilder buildDarkModeImage() {
    return BlocBuilder<ThemeCubit, AppThemeState>(
      builder: (context, appThemeState) {
        return Icon(
            (appThemeState is LightThemeState)
                ? Icons.light_mode
                : Icons.dark_mode,
            color: Theme.of(context).iconTheme.color,
            size: 20);
      },
    );
  }
}
