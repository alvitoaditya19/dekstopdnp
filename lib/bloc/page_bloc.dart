import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dekstopdnp/models/models.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc() : super(OnInitialPage()) {
    on<PageEvent>((event, emit) async {
      if (event is GoToSplashPage) {
        emit(OnSplashPage());
      } else if (event is GoToSignInPage) {
        emit(OnSignIn());
      } else if (event is GoToSignUpPage) {
        emit(OnSignUpPage());
      } else if (event is GoToRegistrationPage) {
        emit(OnRegistrationPage(event.registrationData));
      } else if (event is GoToPreferencePage) {
        emit(OnPreferencePage(event.registrationData));
      } else if (event is GoToAccountConfirmationPage) {
        emit(OnAccountConfirmationPage(event.registrationData));
      } else if (event is GoToMainPage) {
        emit(OnMainPage());
      } else if (event is GoToMesinKRBPage) {
        emit(OnMesinKRBPage());
      } else if (event is GoToChangeMachineCondition) {
        emit(OnChangeMachineCondition());
      } else if (event is GoToDailyActivityPage) {
        emit(OnDailyActicityPage());
      } else if (event is GoToInputLPMPage) {
        emit(OnInputLPMPage());
      } else if (event is GoToChecklistMesinPage) {
        emit(OnChecklistMesinPage());
      } else if (event is GoToWebViewPage) {
        emit(OnWebViewPage(event.pageName, event.link));
      } else if (event is GoToEditProfilePage) {
        emit(OnEditProfilePage(event.user));
      }
    });
  }
}
