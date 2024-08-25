import 'package:get_it/get_it.dart';
import 'package:momentmaster/application/onboarding/check_user_name_view_model.dart';
import 'package:momentmaster/application/onboarding/onboarding_message_view_model.dart';
import 'package:momentmaster/core/service/base_model.dart';
import 'package:momentmaster/core/service/navigation_service.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';

GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerLazySingleton(() => NavigationService2());
  getIt.registerLazySingleton(() => CheckUserNameViewModel());
  getIt.registerLazySingleton(() => OnBoardingMessageViewModel());
  getIt.registerLazySingleton(() => BaseModel());
}
