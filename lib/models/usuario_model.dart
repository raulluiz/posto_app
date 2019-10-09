import 'dart:convert';
import 'dart:io';

import 'package:scoped_model/scoped_model.dart';


class UsuarioModel extends Model{
  String _nome = "";
  String _token = "";
  String _idUsuario = "";
  bool _isLoading = true;

  String get nome => _nome;
  String get token => _token;
  String get idUsuario => _idUsuario;
  bool get isLoading => _isLoading;


  Future<dynamic> _getUser(login, senha) async {
    //logic for fetching remote data
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse("http://postoapi.com.preview.my-hosting-panel.com/api/Login"));
    request.headers.set('content-type', 'application/json');

    Map map = {
      'data': {
        'login': login,
        'password': senha
      },
    };

    request.add(utf8.encode(json.encode(map)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    return reply;
  }

  Future parseUserFromResponse(String login, String senha) async {
    _isLoading = true;

    notifyListeners();

    var dataFromResponse = await _getUser(login, senha);

    dataFromResponse.forEach(
      //logic for parsing the fetched remote data
    );

    _isLoading = false;

    notifyListeners();
  }

}