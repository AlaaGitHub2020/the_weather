import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_weather/application/api_manager/api_manager_bloc.dart';
import 'package:the_weather/application/core/theme_cubit/theme_cubit.dart';
import 'package:the_weather/application/weather/current_weather_ui/current_weather_ui_bloc.dart';
import 'package:the_weather/application/weather/device_location_cubit/device_location_cubit.dart';
import 'package:the_weather/domain/core/utilities/strings.dart';
import 'package:the_weather/generated/l10n.dart';
import 'package:the_weather/injection.dart';
import 'package:the_weather/main.dart';
import 'package:the_weather/presentation/routes/router.gr.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<DeviceLocationCubit>(
          create: (context) => DeviceLocationCubit(),
        ),
        BlocProvider<ApiManagerBloc>(
            create: (BuildContext context) => getIt<ApiManagerBloc>()),
        BlocProvider<CurrentWeatherUiBloc>(
            create: (BuildContext context) => getIt<CurrentWeatherUiBloc>()),
      ],
      child: const TheWeather(),
    );
  }
}

class TheWeather extends StatefulWidget {
  const TheWeather({Key? key}) : super(key: key);

  @override
  State<TheWeather> createState() => _TheWeatherState();
}

class _TheWeatherState extends State<TheWeather> {
  final heroController = HeroController();
  final _appRouter = AppRouter();
  final Locale _locale = const Locale('en', 'En');

  Future<Position> _determinePosition(BuildContext context) async {
    log.i("_determinePosition Started");
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  getLocation(Position position, BuildContext context) async {
    try {
      log.i("getLocation Started");

      await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      ).then((placeMarks) {
        log.i("deviceLocation ${placeMarks[0].locality.toString()}");
        context.read<DeviceLocationCubit>().updateDeviceLocation(
            deviceLocation: placeMarks[0].locality.toString());
      });
    } catch (err) {
      log.e("err $err");
    }
  }

  checkApplicationSettings(BuildContext context) async {
    await SharedPreferences.getInstance().then((value) async {
      bool? darkActive = value.getBool(Strings.cApplicationDarkMode);
      if (darkActive != null && darkActive) {
        context.read<ThemeCubit>().setDarkMode();
      }
      if (darkActive == null) {
        log.i(
            "DarkMode is not set yet so that we use the device mode after changing the dark mode from settings it will follow the user preference");
        var brightness =
            SchedulerBinding.instance.platformDispatcher.platformBrightness;
        bool isDarkMode = brightness == Brightness.dark;
        log.i("deviceDarkMode active: $isDarkMode");
        if (isDarkMode) {
          context.read<ThemeCubit>().setDarkMode();
        }
      }

      String? deviceLocation = value.getString(Strings.cDeviceLocation);
      if (deviceLocation != null) {
        log.i("deviceLocation is set");
        context
            .read<DeviceLocationCubit>()
            .updateDeviceLocation(deviceLocation: deviceLocation);
      }
      if (deviceLocation == null) {
        log.i("deviceLocation is not set yet so that we need to put it ");
        await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.best)
            .timeout(const Duration(seconds: 5))
            .then((position) {
          log.i("position $position");
          getLocation(position, context);
        });
      }
    });
  }

  @override
  void initState() {
    _determinePosition(context).whenComplete(() {
      checkApplicationSettings(context);
    }).whenComplete(() {
      Future.delayed(const Duration(seconds: 1), () {
        context.read<CurrentWeatherUiBloc>().add(
            CurrentWeatherUiEvent.getForeCastWeatherData(
                context.read<DeviceLocationCubit>().getDeviceLocation(), Strings.cDaysForecast));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: _locale,
      title: Strings.appTitle,
      theme: context.watch<ThemeCubit>().state.theme,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale!.languageCode &&
              locale.countryCode == deviceLocale.countryCode) {
            return locale;
          }
        }
        return null;
      },
    );
  }
}
