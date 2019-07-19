import 'package:flutter/material.dart';
import 'package:posto_app_20_06_19/screens/Terceirizada/tecnicoEditar_screen.dart';
import 'package:posto_app_20_06_19/screens/Terceirizada/tecnicoNew_screen.dart';

import 'BottomNavigationBars/cliente_navigatioBar.dart';
import 'BottomNavigationBars/tecnico_navigationBar.dart';
import 'clienteEditar_screen.dart';
import 'clienteNew_screen.dart';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  int _selectedPage = 0;
  String appBar = "Usuários";
  final _pageOptions = [
    ClienteNavigationBar(),
    TecnicoNavigationBar()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index){
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.local_gas_station),
                title: Text("Cliente")
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity),
                title: Text("Técnico")
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(_selectedPage == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ClienteNew()),
            );
          }
          else
          {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TecnicoNew()),
            );
          }
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
