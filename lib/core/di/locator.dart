import 'package:get_it/get_it.dart';
import 'package:getx_task/core/repos/service.dart';

final locator = GetIt.instance;

void setupLocator() {
  
  locator.registerLazySingleton(() => ApiServices());

  
}
