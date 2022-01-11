 import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefs{
  static SharedPreferences? _sharedPrefs;

  init() async{ _sharedPrefs ??= await SharedPreferences.getInstance();}
  clear() async{ _sharedPrefs?.clear();} 

  String? get pin => _sharedPrefs?.getString('pin');
  set pin(String? value){_sharedPrefs?.setString('pin', value!);}

  String? get username =>  _sharedPrefs?.getString('username');
  set username(String? value){_sharedPrefs?.setString('username', value!);}

   String? get imagepath =>  _sharedPrefs?.getString('imagepath');
  set imagepath(String? value){_sharedPrefs?.setString('imagepath', value!);}
 
  String? get dislikes =>  _sharedPrefs?.getString('dislikes');
  set dislikes(String? value){_sharedPrefs?.setString('dislikes', value!);}
  
  String? get likes =>  _sharedPrefs?.getString('likes');
  set likes(String? value){_sharedPrefs?.setString('likes', value!);}

  
  List<String>? get colors =>  _sharedPrefs?.getStringList('colors');
  set colors(List? value){_sharedPrefs?.setStringList('colors', [ ] );} 
  
  List<String>? get favid =>  _sharedPrefs?.getStringList('favid');
  set favid(List? value){_sharedPrefs?.setStringList('favid', [ ] );}

  
  List<String>? get body =>  _sharedPrefs?.getStringList('body');
  set body(List? value){_sharedPrefs?.setStringList('body', [ ] );} 
  
  List<String>? get stylists =>  _sharedPrefs?.getStringList('stylists');
  set stylists(List? value){_sharedPrefs?.setStringList('stylists', [ ] );} 
}

final sharedPrefs = SharedPrefs();
clearcache() async {
}


