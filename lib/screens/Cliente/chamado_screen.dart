import 'package:flutter/material.dart';

import 'BottomNavigationBars/chamado_navigationBar.dart';
import 'BottomNavigationBars/novaPreventiva_screen.dart';
import 'BottomNavigationBars/novoChamado_screen.dart';
import 'BottomNavigationBars/preventiva_navigationBar.dart';

class ChamadoClienteScreen extends StatefulWidget {
  @override
  _ChamadoClienteScreenState createState() => _ChamadoClienteScreenState();
}

class _ChamadoClienteScreenState extends State<ChamadoClienteScreen> {
  int _selectedPage = 0;
  final _pageOptions = [
    ChamadoNavigationBar(),
    PreventivaNavigationBar()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              if(_selectedPage == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NovoChamadoScreen()),
                );
              }
              else
                {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NovaPreventivaScreen()),
                  );
                }
            },
          )
        ],
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
