part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSignIn extends PageState {
  @override
  List<Object> get props => [];
}

class OnSignUpPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnRegistrationPage extends PageState {
  final RegistrationData registrationData;

  const OnRegistrationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnPreferencePage extends PageState {
  final RegistrationData registrationData;

  const OnPreferencePage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnAccountConfirmationPage extends PageState {
  final RegistrationData registrationData;

  const OnAccountConfirmationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnHomePage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMesinKRBPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnChangeMachineCondition extends PageState {
  @override
  List<Object> get props => [];
}

class OnDailyActicityPage extends PageState {

  @override
  List<Object> get props => [];
}

class OnWebViewPage extends PageState {
    final String pageName;
    final String link;


  const OnWebViewPage(this.pageName,this.link);
  @override
  List<Object> get props => [pageName];
}

class OnInputLPMPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnChecklistMesinPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnEditProfilePage extends PageState {
  final UserModel user;

  const OnEditProfilePage(this.user);

  @override
  List<Object> get props => [user];
}
