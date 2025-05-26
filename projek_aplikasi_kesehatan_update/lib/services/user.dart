import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projek_aplikasi_kesehatan/views/Login/login_healthyme.dart';
import 'package:projek_aplikasi_kesehatan/services/url.dart' as url;
import 'package:projek_aplikasi_kesehatan/models/response_data_map.dart';
import 'package:projek_aplikasi_kesehatan/models/user_login.dart';

class UserService {
  Future loginUser(data) async {
    var uri = Uri.parse("${url.BaseUrl}/login");
    var response = await http.post(uri, body: data);

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      if (result["status"] == true) {
        UserLogin userLogin = UserLogin(
          status: result["status"],
          token: result["authorisation"]["token"],
          message: result["message"],
          id: result["data"]["id"],
          nama_user: result["data"]["name"],
          email: result["data"]["email"],
          role: result["data"]["role"],
        );
        await userLogin.prefs();

        return ResponseDataMap(
            status: true, message: "Login sukses", data: result);
      } else {
        return ResponseDataMap(
            status: false, message: "Email atau password salah");
      }
    } else {
      return ResponseDataMap(
          status: false,
          message: "Gagal login. Error ${response.statusCode}");
    }
  }

  Future registerUser(data) async {
    var uri = Uri.parse("${url.BaseUrl}/register_admin");
    var response = await http.post(uri, body: data);

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      if (result["status"] == true) {
        return ResponseDataMap(
            status: true, message: "Registrasi sukses", data: result);
      } else {
        String error = "";
        result["message"].forEach((key, value) {
          error += "$key: ${value[0]}\n";
        });
        return ResponseDataMap(status: false, message: error);
      }
    } else {
      return ResponseDataMap(
          status: false,
          message: "Gagal register. Error ${response.statusCode}");
    }
  }
}
