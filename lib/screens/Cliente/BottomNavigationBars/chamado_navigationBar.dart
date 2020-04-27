import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:posto_app_20_06_19/models/chamado_model.dart';
import 'package:posto_app_20_06_19/models/user_model.dart';
import 'package:posto_app_20_06_19/models/usuario_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

import '../chamadoView_screen.dart';

class ChamadoNavigationBar extends StatelessWidget {
  final UsuarioModel user;

  ChamadoNavigationBar({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Chamado>>(
      future: _fetchChamados(user.userApp.idUsuario),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Chamado> data = snapshot.data;
          return _jobsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}
Future<List<Chamado>> _fetchChamados(index) async {

  final jobsListAPIUrl = 'http://postosobcontrole.com/api/Chamado?idUsuario=' + index.toString();
  final response = await http.get(jobsListAPIUrl);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((chamado) => new Chamado.fromJson(chamado)).toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
}

ListView _jobsListView(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        String status = "";
        if(data[index].status == 1)
          status = "Aberto";
        else if(data[index].status == 2)
          status = "Pendente";
        else if (data[index].status == 3)
          status = "Em Atendimento";
        else if (data[index].status == 4)
          status = "Encerrado";
        else if(data[index].status == 5)
          status = "Cancelado";
        else
          status = "";
        return InkWell(
          onTap: (){

            var tst = data;
            var ind = index;
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>ChamadoView(chamado: data[index],))
            );
          },
          child: Card(
              elevation: 3.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                  child: _tile2(data[index].id_Chamado.toString(), data[index].nome_Cliente,data[index].DataPrazoSTR.toString(),status, Icons.work)
              )
          ),
        );
      });
}

ListTile _tile2(String id, String nomeCliente,String data, String status, IconData icon) => ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: EdgeInsets.only(right: 2.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Text(id,style: TextStyle(color: Colors.white),),
    ),
    title: Text(
      nomeCliente,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    subtitle: Text(
      data,
      style: TextStyle(color: Colors.white),
    ),
    trailing: Text(status, style: TextStyle(color: Colors.white),)
);