part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSignInPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSignUpPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToRegistrationPage extends PageEvent {
  final RegistrationData registrationData;

  const GoToRegistrationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToPreferencePage extends PageEvent {
  final RegistrationData registrationData;

  const GoToPreferencePage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToAccountConfirmationPage extends PageEvent {
  final RegistrationData registrationData;

  const GoToAccountConfirmationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToHomePage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToStartMenu extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMesinKRBPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToChangeMachineCondition extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToDailyActivityPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToWebViewPage extends PageEvent {
  final String pageName;
  final String link;

  const GoToWebViewPage(this.pageName, this.link);
  @override
  List<Object> get props => [];
}

class GoToInputLPMPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToChecklistMesinPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToEditProfilePage extends PageEvent {
  final UserModel user;

  const GoToEditProfilePage(this.user);

  @override
  List<Object> get props => [user];
}
