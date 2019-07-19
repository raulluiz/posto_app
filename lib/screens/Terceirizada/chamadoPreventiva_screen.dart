import 'package:flutter/material.dart';

import 'BottomNavigationBars/chamado_navigationBar.dart';
import 'BottomNavigationBars/cliente_navigatioBar.dart';
import 'BottomNavigationBars/preventiva_NavigationBar.dart';
import 'BottomNavigationBars/tecnico_navigationBar.dart';

class ChamadoPreventivaScreen extends StatefulWidget {
  @override
  _ChamadoPreventivaScreenState createState() => _ChamadoPreventivaScreenState();
}

class _ChamadoPreventivaScreenState extends State<ChamadoPreventivaScreen> {
  int _selectedPage = 0;
  final _pageOptions = [
    ChamadoTerceirizadaNavigationBar(),
    PreventivaTerceirizadaNavigationBar()
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
