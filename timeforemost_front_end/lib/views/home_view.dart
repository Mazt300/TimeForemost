import 'package:flutter/material.dart';
import 'package:pmvvm/mvvm_builder.widget.dart';
import 'package:pmvvm/views/hook.view.dart';
import 'package:timeforemost_front_end/view_models/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM<HomeViewModel>(
      view: (context, vmodel) => _HomeView(),
      viewModel: HomeViewModel(),
    );
  }
}

class _HomeView extends HookView<HomeViewModel> {

  @override
  Widget render(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buena papa!'),
      ),
      body: Stack(
        children: const [
          Drawer(
            elevation: 3.0,
            child: Center(),
          )
        ],
      )
    );
  }
}