import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:the_weather/injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<GetIt> configureInjection(String env) async {
  return getIt.init(environment: env);
}
