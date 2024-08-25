import 'package:momentmaster/core/constants/api_error.dart';
import 'package:momentmaster/core/enums/view_state.dart';
import 'package:momentmaster/core/service/navigation_service2.dart';
import 'package:momentmaster/di.dart';
import 'package:flutter/widgets.dart';

class BaseModel extends ChangeNotifier {
  final navigationService = getIt<NavigationService2>();

  ViewState _state = ViewState.IDLE;
  ViewState get state => _state;

  ApiError? error;

  /// Returns true when a request did not return an error.
  bool get success => error == null;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  bool isNotError(dynamic response) {
    if (response is ApiError) {
      error = response;
      return false;
    } else {
      return true;
    }
  }
}
