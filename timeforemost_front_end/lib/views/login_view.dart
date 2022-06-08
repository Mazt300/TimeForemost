import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/views/hook.view.dart';
import 'package:timeforemost_front_end/common/light_color_config.dart';
import 'package:timeforemost_front_end/common/light_theme.dart';
import 'package:timeforemost_front_end/view_models/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MVVM<LoginViewModel>(
      view: (context, vmodel) => _LoginViewModel(),
      viewModel: LoginViewModel(),
    );
  }
}

class _LoginViewModel extends HookView<LoginViewModel> {

  @override
  Widget render(BuildContext context, LoginViewModel viewModel) {
    return Scaffold(
      body: StatefulBuilder(
        builder: (BuildContext context, setState) {
          return SingleChildScrollView(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 125.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: ClipOval(
                        child: Image.asset('lib/assets/logo.png', fit: BoxFit.cover,)
                        )
                    ),
                    Text(viewModel.text1, style: Theme.of(context).textTheme.headline4,),
                    const SizedBox(height: 10,),
                    Text(viewModel.text2, style: Theme.of(context).textTheme.labelMedium,),
                    const SizedBox(height: 50,),
                    SizedBox(
                      width: 500,
                      child: TextFormField(
                        controller: viewModel.emailController,
                        style: Theme.of(context).textTheme.button,
                        decoration: InputDecoration(
                          hintText: viewModel.text4,
                          labelText: viewModel.text3,
                          alignLabelWithHint: true,
                          isDense: true
                        ),
                        onEditingComplete: (){
                          if (!viewModel.emailController.text.contains('@')){
                            showDialog(context: context, builder: (builder) => AlertDialog(
                              title: const Text("Your email not contain @"),
                              content: const Text("Please check it out"),
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(builder).pop();
                                  },
                                  child: const Text("Ok"),
                                ),
                              ],
                            ));
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 20,),
          
                     SizedBox(
                      width: 500,
                      child: TextFormField(
                        style: Theme.of(context).textTheme.button,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: viewModel.text5,
                          alignLabelWithHint: true,
                          isDense: true
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 500,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  child: Checkbox(value: viewModel.checkRememberMe, onChanged: (value){
                                    viewModel.checkRememberMe = value!;
                                  })
                                ),
                                SizedBox(
                                  child: Text(viewModel.text6, style: Theme.of(context).textTheme.button,)
                                ),
                              ],
                            ),
                            SizedBox(
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all<double>(0),
                                  backgroundColor: MaterialStateProperty.all<Color>(LightColorConfig().mainColor) 
                                ),
                                onPressed: (){
                                  debugPrint('Forgot');
                                },
                                child: Text(viewModel.text7, style: TextStyle(
                                  color: LightColorConfig().customTextColor),),
                              )
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 50,),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: (){}, 
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(viewModel.text8, style: TextStyle(
                            color: LightColorConfig().mainColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400
                          )),
                        )),
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(LightColorConfig().mainColor),
                        ),
                        onPressed: (){}, 
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: 20, height: 20, child: Image.network('https://freesvg.org/img/1534129544.png'),),
                              Text(viewModel.text9, style: TextStyle(
                                color: LightColorConfig().primaryColor,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400
                              )),
                            ],
                          ),
                        )),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}