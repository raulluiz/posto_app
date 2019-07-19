import 'package:flutter/material.dart';

import 'BottomNavigationBars/chamadoTecnico_navigationBar.dart';
import 'BottomNavigationBars/novaPreventivaTecnico_screen.dart';
import 'BottomNavigationBars/novoChamadoTecnico_screen.dart';
import 'BottomNavigationBars/preventivaTecnico_navigationBar.dart';

class ChamadoTecnicoScreen extends StatefulWidget {
  @override
  _ChamadoTecnicoScreenState createState() => _ChamadoTecnicoScreenState();
}

class _ChamadoTecnicoScreenState extends State<ChamadoTecnicoScreen> {
  int _selectedPage = 0;
  final _pageOptions = [
    ChamadoTecnicoNavigationBar(),
    PreventivaTecnicoNavigationBar()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(""),
          leading: Text("")
      ),
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
              icon: Icon(Icons.note_add),
              title: Text("Chamados")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              title: Text("Preventivas")
          ),
        ],
      ),
    );
  }
}
