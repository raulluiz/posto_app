import 'package:flutter/material.dart';
import 'package:posto_app_20_06_19/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ClienteEdit extends StatefulWidget {
  @override
  _ClienteEditState createState() => _ClienteEditState();
}

class _ClienteEditState extends State<ClienteEdit> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cliente Tal"),
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
}
