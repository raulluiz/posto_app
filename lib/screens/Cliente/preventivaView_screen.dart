import 'package:flutter/material.dart';
import 'package:posto_app_20_06_19/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class PreventivaView extends StatefulWidget {
  @override
  _PreventivaViewState createState() => _PreventivaViewState();
}

class _PreventivaViewState extends State<PreventivaView> {

  List<String> _numberserie = ['Serie 01', 'Serie 02', 'Serie 03', 'Serie 04']; // Option 2
  List<String> _produto = ['DC', 'Produto 02', 'Produto 03', 'Produto 04'];
  String _selectedNumberSerie;
  String _selectedProduto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("DC-15680612"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.mode_edit,color: Colors.white,),
            )
          ],
        ),
        body: ScopedModelDescendant<UserModel>(
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
                    value: "DC",
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
                    initialValue: "Problema na Preventiva encontrado!",
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
                    image: NetworkImage("data:image/jpeg;base64,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"),
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
