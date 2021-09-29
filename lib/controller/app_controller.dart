import 'package:shared_preferences/shared_preferences.dart';

class AppController{

  AppController._(){
    init();
  }

  static AppController _instance = AppController._();

  static AppController get instance => _instance;

  late SharedPreferences _sharedPreferences;

  Future init() async{

    _sharedPreferences = await SharedPreferences.getInstance();

  }
  //
  // Future savaUser(UserData user)async{
  //   await _sharedPreferences.setBool('loggedIn', true);
  //   await _sharedPreferences.setString('name', user.name ?? '');
  //   await _sharedPreferences.setString('email', user.email ?? '');
  //   await _sharedPreferences.setString('token', user.token ?? '');
  //   await _sharedPreferences.setString('image', user.image ?? '');
  //   await _sharedPreferences.setString('phone', user.phone ?? '');
  //
  // }

  Future finishOutBoarding(bool outBoarding)async{
    await _sharedPreferences.setBool('outBoarding', outBoarding);
  }

  bool outBoarding(){
    return  _sharedPreferences.getBool('outBoarding') ?? false;

  }
  Future setPackageId(int id)async{
    await _sharedPreferences.setInt('packageId', id);
  }

  int getPackageId(){
    return  _sharedPreferences.getInt('packageId') ?? 0;

  }
  Future setId(int id)async{
    await _sharedPreferences.setInt('id', id);
  }

  Future setGuideId(int id)async{
    await _sharedPreferences.setInt('guide', id);
  }

  int getId(){
    return  _sharedPreferences.getInt('id') ?? 0;

  }

  int getGuideId(){
    return  _sharedPreferences.getInt('guide') ?? 0;

  }
  Future hasLogin(bool loggedIn)async{
    await _sharedPreferences.setBool('loggedIn', loggedIn);
  }

  bool loggedIn(){
    return  _sharedPreferences.getBool('loggedIn') ?? false;
  }

  String getName(){
    return  _sharedPreferences.getString('name') ?? '';
  }
  String getEmail(){
    return  _sharedPreferences.getString('email') ?? '';
  }
  String getToken(){
    return  _sharedPreferences.getString('token') ?? '';
  }
  String getImage(){
    return  _sharedPreferences.getString('image') ?? '';
  }
  String getPhone(){
    return  _sharedPreferences.getString('phone') ?? '';
  }

  Future logout()async{
    await _sharedPreferences.setInt('id',0);
    await _sharedPreferences.setInt('guide',0);
    await _sharedPreferences.setBool('loggedIn',false);
    await _sharedPreferences.setString('name','');
    await _sharedPreferences.setString('email','');
    await _sharedPreferences.setString('image','');
    await _sharedPreferences.setString('phone','');

  }


}