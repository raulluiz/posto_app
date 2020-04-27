import 'package:flutter/material.dart';
import 'package:posto_app_20_06_19/models/chamado_model.dart';
import 'package:posto_app_20_06_19/models/user_model.dart';
import 'package:posto_app_20_06_19/models/usuario_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ChamadoView extends StatefulWidget {
  final Chamado chamado;

  const ChamadoView({Key key, this.chamado}): super(key: key);

  @override
  _ChamadoViewState createState() => _ChamadoViewState();
}

class _ChamadoViewState extends State<ChamadoView> {

  List<String> _numberserie = ['Serie 01', 'Serie 02', 'Serie 03', 'Serie 04']; // Option 2
  List<String> _produto = ['DC-DC', 'Produto 02', 'Produto 03', 'Produto 04'];
  String _selectedNumberSerie;
  String _selectedProduto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("HUTI-1002444"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.mode_edit,color: Colors.white,),
            )
          ],
        ),
        body: ScopedModelDescendant<UsuarioModel>(
          builder: (context,child, model){
            if(model.isLoading)
              return Center(child: CircularProgressIndicator(),);

            return Form(
//              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  DropdownButton(
                    hint: Text('Escolha o produto com defeito'), // Not necessary for Option 1
                    value: "DC-DC",
                    onChanged: (newValue) {},
                    items: _produto.map((serie) {
                      return DropdownMenuItem(
                        child: new Text(serie),
                        value: serie,
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.0,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Descreva o problema"
                    ),
                    initialValue: "Problema encontrado!",
                    enabled: false,
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                    validator: (text){
                      if(text.isEmpty)
                        return "Favor descrever o problema!";
                    },
                  ),
                  SizedBox(height: 16.0,),
                  Image(
                    image: NetworkImage("https://4.bp.blogspot.com/-0OwFbXE9yyY/WiL-UAc4AuI/AAAAAAAJ2As/_USjR7WS4ioPkFUcNsQ4RHAOAwZ9AcAiACLcBGAs/s640/106e09e0-d355-426c-a541-3523ad13ac95%2B%25281%2529.jpg"),
                  ),
//                  RaisedButton.icon(onPressed: (){}, icon: Icon(Icons.camera_alt), label: Text("Imagem do defeito")),
                  /*SizedBox(height: 16.0,),
                  SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                        child: Text("Criar Chamado",
                          style: TextStyle(fontSize: 12.0),
                        ),
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        onPressed: (){
                          *//*if(_formKey.currentState.validate()){

                          }*//*

                          *//*Map<String, dynamic> userData = {
                            "name" : _nameController.text,
                            "email": _emailController.text,
                            "address": _addressController.text
                          };

                          model.signUp(
                              userData: userData,
                              pass: _passController.text,
                              onSuccess: _onSuccess,
                              onFail: _onFail);*//*
                        }
                    ),
                  )*/
                ],
              ),
            );
          },
        )
    );
  }
}
