import 'package:alif/data/models/user_model.dart';
import 'package:alif/data/providers/user_provider.dart';
import 'package:get_it/get_it.dart';

class UserRepo {
  final _userProvider = UserProvider();
  final _getIt = GetIt.I;

  Future<UserModel?> getUserData() async {
    final response = await _userProvider.getUserData();
    final user = UserModel.fromMap(response.data['data']['user']);
    if (_getIt.isRegistered<UserModel>()) {
      _getIt.unregister<UserModel>();
    }
    _getIt.registerLazySingleton<UserModel>(() => user);
    return user;
  }
}
