import 'package:flutter/material.dart';
import 'package:posto_app_20_06_19/screens/Terceirizada/tecnicoEditar_screen.dart';
import 'package:posto_app_20_06_19/screens/Terceirizada/users_screen.dart';
import 'package:posto_app_20_06_19/widgets/custom_drawer.dart';

import 'chamadoPreventiva_screen.dart';
import 'chart_screen.dart';
import 'clienteEditar_screen.dart';

class MenuScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text(""),
            centerTitle: true,
          ),
          body: UsersScreen(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Chamado / Preventiva"),
            centerTitle: true,
          ),
          body: ChamadoPreventivaScreen(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Dashboard"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: ChartScreen(),
        )
      ],
    );
  }
}
