import 'package:flutter/cupertino.dart';
import 'package:pmvvm/view_model.dart';

class LoginViewModel extends ViewModel {

  final String text1 = 'Log in to your account', text2 = 'Welcome back! Please enter your credentials.';
  final String text3 = 'Email',text4 = 'Enter your email', text5 = 'Password', text6 = 'Remember me', text7 = 'Forgot password';
  final String text8 = 'Sign in',  text9 = 'Sign in with Google', text10 = 'Don’t have an account?';
  final String text11 = 'Sign up';

  TextEditingController emailController = TextEditingController();
  bool _checkRememberMe = false;
  bool get checkRememberMe => _checkRememberMe;
  set checkRememberMe (bool value){
    _checkRememberMe = value;
    notifyListeners();
  }

  @override
  void init() {
    // It's called after the ViewModel is constructed
    super.init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Optional
  @override
  void onBuild() {
    //Identify if build it's done

  }

}