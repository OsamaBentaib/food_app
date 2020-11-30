import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/screens/app/personel/screens/settings/components/edit_profile.dart';
import 'package:food_app/screens/auth/repository/user_repository.dart';
import 'package:food_app/screens/auth/bloc/authentication_bloc.dart';
import 'package:food_app/screens/auth/splash/splash.dart';
import 'package:food_app/screens/auth/login/login_page.dart';
import 'package:food_app/screens/app/ref.dart';
import 'package:food_app/screens/auth/common/common.dart';
import "package:food_app/constants.dart";
import 'package:food_app/screens/info/add_screen.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();

  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return AuthenticationBloc(userRepository: userRepository)
        ..add(AppStarted());
    },
    child: App(userRepository: userRepository),
  ));
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  App({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          // ignore: deprecated_member_use
          body1: TextStyle(color: ksecondaryColor),
          // ignore: deprecated_member_use
          body2: TextStyle(color: ksecondaryColor),
        ),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationUnintialized) {
            return SplashPage();
          }
          if (state is AuthenticationAuthenticated) {
            return MyStatefulWidget();
          }
          if (state is AuthenticationAuthenticatedAsPerson) {
            return MyStatefulWidget(
              ref: 0,
            );
          }
          if (state is AuthenticationAuthenticatedAsRestaurant) {
            return MyStatefulWidget(
              ref: 1,
            );
          }
          if (state is AuthenticationAuthenticatedLoginAsPerson) {
            return MyStatefulWidget(
              ref: 0,
            );
          }
          if (state is AuthenticationAuthenticatedLoginAsRestaurant) {
            return MyStatefulWidget(
              ref: 1,
            );
          }
          if (state is AuthenticationAuthenticatedRegisterAsPerson) {
            return PersonEditProfile();
          }
          if (state is AuthenticationAuthenticatedRegisterAsRestaurant) {
            return AddInfoScreen(
              ref: 1,
            );
          }
          if (state is AuthenticationUnauthenticated) {
            return LoginPage(
              userRepository: userRepository,
            );
          }
          if (state is AuthenticationLoading) {
            return LoadingIndicator();
          }
          return null;
        },
      ),
    );
  }
}
