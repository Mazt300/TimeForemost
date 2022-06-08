import 'package:flutter/cupertino.dart';
import 'package:timeforemost_front_end/views/login_view.dart';

Map<String,WidgetBuilder> getApplicationRoutes(){
  return <String,WidgetBuilder> {
    '/' :(BuildContext context) => const LoginView(),
    'HomeView' :(BuildContext context) => const LoginView(),
  };
}