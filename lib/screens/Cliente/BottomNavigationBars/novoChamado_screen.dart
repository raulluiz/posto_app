import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:posto_app_20_06_19/models/equipamento_model.dart';
import 'package:posto_app_20_06_19/models/posto_model.dart';
import 'package:posto_app_20_06_19/models/produto_model.dart';
import 'package:posto_app_20_06_19/models/sintoma_model.dart';
import 'package:posto_app_20_06_19/models/user_model.dart';
import 'package:posto_app_20_06_19/models/usuario_model.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../chamado_screen.dart';

class NovoChamadoScreen extends StatefulWidget {
  @override
  _NovoChamadoScreenState createState() => _NovoChamadoScreenState();
}

class _NovoChamadoScreenState extends State<NovoChamadoScreen> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _problema = TextEditingController();

  String _selectedProduto;
  String _selectedPosto;
  String _selectedSintoma;
  String _selectedEquipamento;
  List<String> _images = new List<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Novo Chamado"),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<UsuarioModel>(
          builder: (context,child, model){
            if(model.isLoading)
              return Center(child: CircularProgressIndicator(),);
            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  FutureBuilder<List<postos>>(
                      future: _fetchPostos(model.userApp.idUsuario.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<postos> data = snapshot.data;

                          return DropdownButton<String>(
                              hint: Text("Selecione o posto"),
                              value: _selectedPosto,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedPosto = newValue;
                                });
                              },
                              items: data.map((fc) =>
                                  DropdownMenuItem<String>(
                                    child: Text(fc.nome_Fantasia),
                                    value: fc.id_EPosto.toString(),
                                  )).toList()
                          );

                          //return _jobsListView(data);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      }),
                  FutureBuilder<List<equipamento>>(
                      future: _fetchEquipamentos(model.userApp.idUsuario.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<equipamento> data = snapshot.data;

                          return DropdownButton<String>(
                              hint: Text("Selecione o equipamento"),
                              value: _selectedEquipamento,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedEquipamento = newValue;
                                });
                              },
                              items: data.map((fc) =>
                                  DropdownMenuItem<String>(
                                    child: Text(fc.numero_Serie),
                                    value: fc.id_Equipamento.toString(),
                                  )).toList()
                          );

                          //return _jobsListView(data);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      }),
                  FutureBuilder<List<produto>>(
                      future: _fetchProdutos(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<produto> data = snapshot.data;

                          return DropdownButton<String>(
                              hint: Text("Selecione o produto"),
                              value: _selectedProduto,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedProduto = newValue;
                                });
                              },
                              items: data.map((fc) =>
                                  DropdownMenuItem<String>(
                                    child: Text(fc.Nome),
                                    value: fc.Id.toString(),
                                  )).toList()
                          );

                          //return _jobsListView(data);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      }),
                  FutureBuilder<List<sintomas>>(
                      future: _fetchSintomas(model.userApp.idUsuario.toString()),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<sintomas> data = snapshot.data;

                          return DropdownButton<String>(
                              hint: Text("Selecione o sintoma"),
                              value: _selectedSintoma,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedSintoma = newValue;
                                });
                              },
                              isExpanded: true,
                              items: data.map((fc) =>
                                  DropdownMenuItem<String>(
                                    child: Text(fc.nome),
                                    value: fc.id_Sintoma.toString(),
                                  )).toList()
                          );

                          //return _jobsListView(data);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return CircularProgressIndicator();
                      }),
                  SizedBox(height: 16.0,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Descreva o problema"
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                    validator: (text){
                      if(text.isEmpty)
                        return "Favor descrever o problema!";
                    },
                    controller: _problema,
                  ),
                  SizedBox(height: 16.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FloatingActionButton(
                        heroTag: "btnCam",
                        onPressed: getImageFromCam,
                        tooltip: 'Tirar Foto',
                        backgroundColor: Theme.of(context).primaryColor,
                        child: Icon(Icons.add_a_photo),
                      ),
                      FloatingActionButton(
                        heroTag: "btnGallery",
                        onPressed: getImageFromGallery,
                        backgroundColor: Theme.of(context).primaryColor,
                        tooltip: 'Pegar Foto',
                        child: Icon(Icons.add_photo_alternate),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0,),

                  SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                        child: Text("Criar Chamado",
                          style: TextStyle(fontSize: 12.0),
                        ),
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        onPressed: (){
                          if(_formKey.currentState.validate()){
                            Map<String, dynamic> chamado = {
                              "Produto" : _selectedProduto,
                              "Posto" : _selectedPosto,
                              "Sintoma" : _selectedSintoma,
                              "Equipamento": _selectedEquipamento,
                              "Descricao_Problema_Cliente": _problema.text,
                              "Imagens": _images,
                              "IdUsuario": model.userApp.idUsuario
                            };
                            _salvarChamado(chamado, context);
                          }
                        }
                    ),
                  )
                ],
              ),
            );
          },
        )
    );
  }

  void _onSuccess(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Usuário criado com sucesso!"),
          backgroundColor: Theme.of(context).primaryColor,
          duration: Duration(seconds: 2),
        )
    );

    Future.delayed(Duration(seconds: 2)).then((_){
      Navigator.of(context).pop();
    });
  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao criar o usuário!"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        )
    );
  }

  Future getImageFromCam() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState((){
      _images.add(base64Encode(image.readAsBytesSync()));
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState((){
      _images.add(base64Encode(image.readAsBytesSync()));
    });
  }

}

Future<dynamic> _salvarChamado(chamado, context) async {
  //logic for fetching remote data
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse("http://postosobcontrole.com/api/NovoChamado"));
  request.headers.set('content-type', 'application/json');

  request.add(utf8.encode(json.encode(chamado)));
  HttpClientResponse response = await request.close();
  String reply = await response.transform(utf8.decoder).join();
  httpClient.close();

  if(reply == "Ok")
      _onAlertButtonPressed(context);
  else
    _onAlertButtonErrorPressed(context);
}

Future<List<postos>> _fetchPostos(id) async {

  final jobsListAPIUrl = "http://postosobcontrole.com/api/Posto?id=" + id.toString();// + index.toString();
  final response = await http.get(jobsListAPIUrl);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((chamado) => new postos.fromJson(chamado)).toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
}

Future<List<sintomas>> _fetchSintomas(id) async {

  final jobsListAPIUrl = "http://postosobcontrole.com/api/Sintoma?id=" + id.toString();// + index.toString();
  final response = await http.get(jobsListAPIUrl);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((sintoma) => new sintomas.fromJson(sintoma)).toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
}

Future<List<equipamento>> _fetchEquipamentos(id) async {

  final jobsListAPIUrl = "http://postosobcontrole.com/api/equipamento?id=" + id.toString();// + index.toString();
  final response = await http.get(jobsListAPIUrl);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((equipamentos) => new equipamento.fromJson(equipamentos)).toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
}

Future<List<produto>> _fetchProdutos() async {

  final jobsListAPIUrl = "http://postosobcontrole.com/api/Produto";// + index.toString();
  final response = await http.get(jobsListAPIUrl);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((produtos) => new produto.fromJson(produtos)).toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
}



_onAlertButtonPressed(context) {
  Alert(
    context: context,
    type: AlertType.success,
    title: "Chamado",
    desc: "Chamado criado com sucesso!",
    buttons: [
      DialogButton(
        child: Text(
          "Ok",
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
        ),
        onPressed: () =>
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>ChamadoClienteScreen()) //ChamadoClienteScreen
            ),
        width: 120,
      )
    ],
  ).show();
}

_onAlertButtonErrorPressed(context) {
  Alert(
    context: context,
    type: AlertType.error,
    title: "Chamado",
    desc: "Erro ao criar o chamado!",
    buttons: [
      DialogButton(
        child: Text(
          "Ok",
          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
        ),
        onPressed: () =>
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>ChamadoClienteScreen()) //ChamadoClienteScreen
            ),
        width: 120,
      )
    ],
  ).show();
}