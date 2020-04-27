class sintomas{
  final int id_Sintoma;
  final String codigo;
  final String nome;

  sintomas({this.id_Sintoma,this.codigo,this.nome});

  factory sintomas.fromJson(Map<String, dynamic> json) {
    return sintomas(
      id_Sintoma: json['id_Sintoma'],
      codigo: json['id_Empresa'],
      nome: json['nome']
    );
  }
}