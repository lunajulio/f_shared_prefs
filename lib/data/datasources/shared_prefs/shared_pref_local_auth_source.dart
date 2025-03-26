import '../../../domain/entities/user.dart';
import '../i_local_auth_source.dart';
import 'local_preferences.dart';

class SharedPrefLocalAuthSource implements ILocalAuthSource {
  final _sharedPreferences = LocalPreferences();


  @override
  Future<String> getLoggedUser() async {
    return await _sharedPreferences.retrieveData<String>('email') ?? "noUser";
  }

  @override
  Future<void> logout() async {
    await _sharedPreferences.storeData('logged', false);
  }

  @override
  Future<User> getUserFromEmail(email) async {
    //TODO: implement getUserFromEmail, return a User object
    // if no user is found, throw "User not found"
    final password = await _sharedPreferences.retrieveData<String>('password') ?? "";
    final storedEmail = await _sharedPreferences.retrieveData<String>('email') ?? "noUser";
    
    // Verificar que el email exista y coincida con el almacenado
    if (storedEmail != email) {
      throw Exception("User not found");
    }
    
    // Si llegamos aquí, el usuario existe
    return User(email: email, password: password);
  }

  @override
  Future<bool> isLogged() async {
    //TODO: implement isLogged, return a boolean, default is false
    return await _sharedPreferences.retrieveData<bool>('logged') ?? false;
  }

  @override
  Future<void> signup(email, password) async {
    //TODO: implement signup, stroe the email and pass on shared preferences
    await _sharedPreferences.storeData('email', email);
    await _sharedPreferences.storeData('password', password);
    
  }

  @override
  Future<void> setLoggedIn() async {
    //TODO: implement setLoggedIn, store a boolean on shared preferences
    await _sharedPreferences.storeData('logged', true);
  }
}
