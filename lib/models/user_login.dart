import 'package:shared_preferences/shared_preferences.dart';

class UserLogin {
  bool? status = false;
  String? token;
  String? message;
  int? id;
  String? nama_user;
  String? email;
  String? role;

  UserLogin({
    this.status,
    this.token,
    this.message,
    this.id,
    this.nama_user,
    this.email,
    this.role,
  });

  Future prefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("status", status ?? false);
    prefs.setString("token", token ?? '');
    prefs.setString("message", message ?? '');
    prefs.setInt("id", id ?? 0);
    prefs.setString("nama_user", nama_user ?? '');
    prefs.setString("email", email ?? '');
    prefs.setString("role", role ?? '');
  }

  Future<UserLogin> getUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return UserLogin(
      status: prefs.getBool("status") ?? false,
      token: prefs.getString("token"),
      message: prefs.getString("message"),
      id: prefs.getInt("id"),
      nama_user: prefs.getString("nama_user"),
      email: prefs.getString("email"),
      role: prefs.getString("role"),
    );
  }
}
