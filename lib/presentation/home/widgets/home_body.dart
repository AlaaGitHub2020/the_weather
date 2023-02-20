import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rive/rive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_weather/application/weather/current_weather_ui/current_weather_ui_bloc.dart';
import 'package:the_weather/application/weather/device_location_cubit/device_location_cubit.dart';
import 'package:the_weather/domain/core/utilities/colors.dart';
import 'package:the_weather/domain/core/utilities/helper.dart';
import 'package:the_weather/domain/core/utilities/strings.dart';
import 'package:the_weather/generated/l10n.dart';
import 'package:the_weather/presentation/home/widgets/city_text_field.dart';
import 'package:the_weather/presentation/home/widgets/day_forecast_text.dart';
import 'package:the_weather/presentation/home/widgets/forecast_card.dart';
import 'package:the_weather/presentation/home/widgets/location_text.dart';
import 'package:the_weather/presentation/routes/router.gr.dart';

import '../../../main.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  TextEditingController cityController = TextEditingController();

  onPressedGetCityWeather(BuildContext context) {
    log.i("onPressedGetCityWeather Started");
    if (cityController.text.isNotEmpty) {
      context.read<CurrentWeatherUiBloc>().add(
          CurrentWeatherUiEvent.getForeCastWeatherData(
              cityController.text, Strings.cDaysForecast));
    }
  }

  onPressTryAgain() async {
    log.i("onPressTryAgain Started");
    context
        .read<CurrentWeatherUiBloc>()
        .add(const CurrentWeatherUiEvent.reset());
    context.router.replace(const HomeRoute());
    await SharedPreferences.getInstance().then((value) async {
      String? deviceLocation = value.getString(Strings.cDeviceLocation);
      if (deviceLocation != null) {
        log.i("deviceLocation is set");
        context
            .read<DeviceLocationCubit>()
            .updateDeviceLocation(deviceLocation: deviceLocation);
        context.read<CurrentWeatherUiBloc>().add(
            CurrentWeatherUiEvent.getForeCastWeatherData(
                deviceLocation, Strings.cDaysForecast));
      }
      if (deviceLocation == null) {
        log.i("deviceLocation is not set yet so that we need to put it ");
        await Geolocator.getCurrentPosition(
                desiredAccuracy: LocationAccuracy.best)
            .timeout(const Duration(seconds: 5))
            .then((position) {
          log.i("position $position");
          Helper.getLocation(position, context);
        });
      }
    }).whenComplete(() {
      Future.delayed(const Duration(seconds: 1), () {
        context.read<CurrentWeatherUiBloc>().add(
            CurrentWeatherUiEvent.getForeCastWeatherData(
                context.read<DeviceLocationCubit>().getDeviceLocation(),
                Strings.cDaysForecast));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor.withOpacity(0.4),
      body: BlocBuilder<CurrentWeatherUiBloc, CurrentWeatherUiState>(
        builder: (context, state) {
          return state.map(
            initial: (_) => Container(),
            loading: (_) => buildLoading(),
            actionFailure: (failure) => buildActionFailure(context),
            actionSuccess: (success) => SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                decoration: buildBackgroundDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      LocationText(
                          location:
                              "${success.currentWeather.location!.name!.getOrCrash()}"),
                      Text(
                        "${success.currentWeather.location!.localtime!.getOrCrash()}",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      buildAnimatedWidget(context, success),
                      buildCurrentWeatherTempRow(context, success),
                      Text(
                        "${S.of(context).cloud} ${success.currentWeather.current!.cloud!.getOrCrash()}%",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        "${S.of(context).feelsLike} ${success.currentWeather.current!.feelslike_c!.getOrCrash()}°C ",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      buildCurrentWeatherWindRow(context, success),
                      buildCurrentWeatherHumidityRow(context, success),
                      buildSizedBox(),
                      CityTextField(cityController: cityController),
                      buildSizedBox(),
                      ElevatedButton(
                          onPressed: () => onPressedGetCityWeather(context),
                          child: Text(S.of(context).getCityWeatherForecast)),
                      buildSizedBox(),
                      const DayForecastText(),
                      buildSizedBox(),
                      buildForecastListView(success),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  ListView buildForecastListView(success) {
    return ListView.builder(
        primary: false,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: success.currentWeather.forecast?.forecastday?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return ForecastCard(
            day: success.currentWeather.forecast!.forecastday?[index]?.date!
                    .getOrCrash() ??
                '',
            min:
                "${success.currentWeather.forecast!.forecastday?[index]?.day!.mintemp_c?.getOrCrash().toString()}" ??
                    '',
            max:
                "${success.currentWeather.forecast!.forecastday?[index]?.day!.maxtemp_c?.getOrCrash().toString()}" ??
                    '',
            imageUrl: success.currentWeather.forecast!.forecastday?[index]?.day!
                    .condition!.icon!
                    .getOrCrash()! ??
                '',
          );
        });
  }

  Row buildCurrentWeatherHumidityRow(BuildContext context, success) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.water_drop),
        const SizedBox(width: 10),
        Text(
          "${success.currentWeather.current!.humidity!.getOrCrash()} % ",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }

  Row buildCurrentWeatherWindRow(BuildContext context, success) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.wind_power),
        const SizedBox(width: 10),
        Text(
          "${success.currentWeather.current!.wind_mph!.getOrCrash()} m/h ,"
          "${success.currentWeather.current!.wind_dir!.getOrCrash()}",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }

  Row buildCurrentWeatherTempRow(BuildContext context, success) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${success.currentWeather.current!.temp_c!.getOrCrash()}°C",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(width: 5),
        Text(
          "${success.currentWeather.current!.condition!.text!.getOrCrash()}",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        CachedNetworkImage(
          imageUrl:
              "https:${success.currentWeather.current!.condition!.icon!.getOrCrash()!}",
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(
              value: downloadProgress.progress,
              backgroundColor: AppColors.primaryColor,
              color: AppColors.secondaryColor,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ],
    );
  }

  SizedBox buildAnimatedWidget(BuildContext context, success) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.15,
        child: success.currentWeather.current!.condition!.text!
                .getOrCrash()!
                .toLowerCase()
                .contains('sun')
            ? const RiveAnimation.asset(Strings.icSun)
            : success.currentWeather.current!.condition!.text!
                    .getOrCrash()!
                    .toLowerCase()
                    .contains('cloud')
                ? const RiveAnimation.asset(Strings.icWeather)
                : success.currentWeather.current!.condition!.text!
                        .getOrCrash()!
                        .toLowerCase()
                        .contains('rain')
                    ? const RiveAnimation.asset(Strings.icRain)
                    : const RiveAnimation.asset(Strings.icChecking));
  }

  BoxDecoration buildBackgroundDecoration() {
    return const BoxDecoration(
        image: DecorationImage(
      image: AssetImage(Strings.icBackground),
      fit: BoxFit.fill,
    ));
  }

  Center buildActionFailure(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).errorFetchingWeatherForecast,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Theme.of(context).colorScheme.error)),
        ElevatedButton(
            onPressed: () => onPressTryAgain(),
            child: Text(S.of(context).tryAgain)),
      ],
    ));
  }

  Center buildLoading() {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: AppColors.primaryColor,
        color: AppColors.secondaryColor,
      ),
    );
  }

  SizedBox buildSizedBox() => const SizedBox(height: 25);
}
