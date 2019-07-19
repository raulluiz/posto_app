import 'package:flutter/material.dart';
import 'package:posto_app_20_06_19/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class NovaPreventivaScreen extends StatefulWidget {
  @override
  _NovaPreventivaScreenState createState() => _NovaPreventivaScreenState();
}

class _NovaPreventivaScreenState extends State<NovaPreventivaScreen> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> _numberserie = ['Serie 01', 'Serie 02', 'Serie 03', 'Serie 04']; // Option 2
  List<String> _produto = ['Produto 01', 'Produto 02', 'Produto 03', 'Produto 04'];
  String _selectedNumberSerie;
  String _selectedProduto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Nova Preventiva"),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context,child, model){
            if(model.isLoading)
              return Center(child: CircularProgressIndicator(),);

            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
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
                  DropdownButton(
                    hint: Text('Escolha o produto com defeito'), // Not necessary for Option 1
                    value: _selectedProduto,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedProduto = newValue;
                      });
                    },
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
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                    validator: (text){
                      if(text.isEmpty)
                        return "Favor descrever o problema!";
                    },
                  ),
                  SizedBox(height: 16.0,),
                  RaisedButton.icon(onPressed: (){}, icon: Icon(Icons.camera_alt), label: Text("Imagem do defeito")),
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

                          }

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
}