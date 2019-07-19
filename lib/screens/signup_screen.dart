import 'package:flutter/material.dart';
import 'package:posto_app_20_06_19/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _addressController = TextEditingController();
  final _cpfController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Criar Conta"),
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
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        hintText: "Nome"
                    ),
                    validator: (text){
                      if(text.isEmpty)
                        return "Nome inválido!";
                    },
                  ),
                  SizedBox(height: 16.0,),
                  TextFormField(
                    controller: _cpfController,
                    decoration: InputDecoration(
                        hintText: "CPF"
                    ),
                    keyboardType: TextInputType.number,
                    validator: (text){
                      if(text.isEmpty)
                        return "Nome inválido!";
                    },
                  ),
                  SizedBox(height: 16.0,),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: "E-mail"
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text){
                      if(text.isEmpty || !text.contains("@"))
                        return "E-mail inválido!";
                    },
                  ),
                  SizedBox(height: 16.0,),
                  TextFormField(
                    controller: _passController,
                    decoration: InputDecoration(
                        hintText: "Senha"
                    ),
                    obscureText: true,
                    validator: (text){
                      if(text.isEmpty || text.length < 5)
                        return "Senha inválida!";
                    },
                  ),
                  SizedBox(height: 16.0,),
                  TextFormField(
                    controller: _addressController,
                    decoration: InputDecoration(
                        hintText: "Endereço"
                    ),
                    validator: (text){
                      if(text.isEmpty)
                        return "Endereço inválido!";
                    },
                  ),
                  SizedBox(height: 16.0,),
                  SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                        child: Text("Criar Conta",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        textColor: Colors.white,
                        color: Theme.of(context).primaryColor,
                        onPressed: (){
                          if(_formKey.currentState.validate()){

                          }

                          Map<String, dynamic> userData = {
                            "name" : _nameController.text,
                            "cpf" : _cpfController.text,
                            "email": _emailController.text,
                            "address": _addressController.text
                          };

                          model.signUp(
                              userData: userData,
                              pass: _passController.text,
                              onSuccess: _onSuccess,
                              onFail: _onFail);
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
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context)=>LoginScreen())
    );
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