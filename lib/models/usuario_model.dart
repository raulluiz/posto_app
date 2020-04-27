import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:posto_app_20_06_19/datas/user_data.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;


class UsuarioModel extends Model{
  String _nome = "";
  String _token = "";
  String _idUsuario = "";
  bool _isLoading = false;
  UserData _userData;

  String get nome => _nome;
  String get token => _token;
  String get idUsuario => _idUsuario;
  bool get isLoading => _isLoading;
  UserData get userApp => _userData;

  static UsuarioModel of(BuildContext context) =>
      ScopedModel.of<UsuarioModel>(context);


  Future<dynamic> _getUser(login, senha) async {
    //logic for fetching remote data
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse("http://postosobcontrole.com/api/Login"));
    request.headers.set('content-type', 'application/json');

    Map map = {
        'login': login,
        'password': senha
    };

    request.add(utf8.encode(json.encode(map)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    return reply;
  }

  Future parseUserFromResponse({@required String login,
    @required String senha,
    @required VoidCallback onSuccess,
    @required VoidCallback onFail}) async {
    _isLoading = true;

    notifyListeners();

    String url =
        'http://postosobcontrole.com/api/Login';

    //print(await apiRequest(url, login,senha));

    var dataFromResponse = await _getUser(login, senha);
    Map mapResponse = json.decode(dataFromResponse);

    _userData = UserData(mapResponse);

    onSuccess();
    _isLoading = false;

    notifyListeners();
  }

  Future<String> apiRequest(String url, String login, String senha) async {
    var response = await http.post(url, body: {'login': login, 'password': senha});
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    return response.body.toString();
  }

}