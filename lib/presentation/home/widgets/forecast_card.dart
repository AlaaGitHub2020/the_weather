import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_weather/domain/core/utilities/colors.dart';
import 'package:the_weather/generated/l10n.dart';

class ForecastCard extends StatelessWidget {
  final String day;
  final String min;
  final String max;
  final String imageUrl;

  const ForecastCard(
      {Key? key,
      required this.day,
      required this.min,
      required this.max,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildForecastDay(context),
            const Spacer(),
            buildWeatherIcon(),
            const SizedBox(width: 10),
            buildMinColumn(context),
          ],
        ),
        trailing: buildMaxColumn(context),
      ),
    );
  }

  CachedNetworkImage buildWeatherIcon() {
    return CachedNetworkImage(
      imageUrl: "https:$imageUrl",
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(
            value: downloadProgress.progress,
            backgroundColor: AppColors.primaryColor,
            color: AppColors.secondaryColor),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Column buildMaxColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildMaxText(context),
        buildMaxValue(context),
      ],
    );
  }

  Column buildMinColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildMinText(context),
        buildMinValue(context),
      ],
    );
  }

  Text buildForecastDay(BuildContext context) {
    return Text(
      day,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }

  Text buildMinText(BuildContext context) {
    return Text(
      S.of(context).min,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }

  Text buildMinValue(BuildContext context) {
    return Text(
      "$min°",
      style: Theme.of(context).textTheme.labelLarge,
    );
  }

  Text buildMaxText(BuildContext context) {
    return Text(
      S.of(context).max,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }

  Text buildMaxValue(BuildContext context) {
    return Text(
      "$max°",
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}
