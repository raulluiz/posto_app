class equipamento{
  final int id_Equipamento;
  final String numero_Serie;

  equipamento({this.id_Equipamento,this.numero_Serie});

  factory equipamento.fromJson(Map<String, dynamic> json) {
    return equipamento(
      id_Equipamento: json['id_Equipamento'],
      numero_Serie: json['numero_Serie'],
    );
  }
}