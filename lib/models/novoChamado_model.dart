import 'dart:convert';

import 'package:posto_app_20_06_19/models/posto_model.dart';
import 'package:posto_app_20_06_19/models/sintoma_model.dart';
import 'package:flutter/material.dart';

class NovoChamado {
  List<postos> posto;
  List<sintomas> sintoma;

  NovoChamado({this.posto, this.sintoma});

  factory NovoChamado.fromJson(Map<String, dynamic> json) {
    return NovoChamado(
      posto: json['postos'],
      sintoma: json['sintomas'],

    );
  }
}