import 'package:flutter/material.dart';
import 'package:the_weather/domain/core/utilities/colors.dart';
import 'package:the_weather/injection.dart';
import 'package:the_weather/presentation/home/widgets/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getIt.allReady(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return const HomeBody();
        } else {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: AppColors.primaryColor,
              color: AppColors.secondaryColor,
            ),
          );
        }
      },
    );
  }
}
