import 'package:flutter/material.dart';
import 'package:posto_app_20_06_19/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class PreventivaTecnicoView extends StatefulWidget {
  @override
  _PreventivaTecnicoViewState createState() => _PreventivaTecnicoViewState();
}

class _PreventivaTecnicoViewState extends State<PreventivaTecnicoView> {

  List<String> _numberserie = ['Serie 01', 'Serie 02', 'Serie 03', 'Serie 04']; // Option 2
  List<String> _produto = ['SH-12', 'Produto 02', 'Produto 03', 'Produto 04'];
  String _selectedNumberSerie;
  String _selectedProduto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("JXIN-0437"),
          centerTitle: true,
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
                    value: "SH-12",
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
                  SizedBox(
                    height: 2.0,
                    child: new Container(
                      margin: new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                      height: 2.0,
                      color: Colors.grey,
                    ),
                  ),
                  DropdownButton(
                    hint: Text('Nº de Série'), // Not necessary for Option 1
                    value: _selectedNumberSerie,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedNumberSerie = newValue;
                      });
                    },
                    items: _numberserie.map((serie) {
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
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                    validator: (text){
                      if(text.isEmpty)
                        return "Favor descrever o problema!";
                    },
                  ),
                  SizedBox(height: 16.0,),
                  RaisedButton.icon(onPressed: (){}, icon: Icon(Icons.camera_alt), label: Text("Imagem do defeito")),
                  SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                        child: Text("Encerrar Preventiva",
                          style: TextStyle(fontSize: 12.0),
                        ),
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        onPressed: (){

                          /*Map<String, dynamic> userData = {
                            "name" : _nameController.text,
                            "email": _emailController.text,
                            "address": _addressController.text
                          };

                          model.signUp(
                              userData: userData,
                              pass: _passController.text,
                              onSuccess: _onSuccess,
                              onFail: _onFail);*/
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
}
