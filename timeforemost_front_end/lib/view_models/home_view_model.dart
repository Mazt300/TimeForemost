import 'package:pmvvm/view_model.dart';

class HomeViewModel extends ViewModel {

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

  String _search = '';
  String get search => _search;
  set search(String value){
    _search = value;
    notifyListeners();
  }
}