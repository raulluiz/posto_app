class Chamado{
  final int id_Chamado;
  final int id_Cliente;
  final int id_Tecnico;
  final int id_Empresa;
  final int id_Equipamento;
  final int id_EPosto;
  final int id_Sintoma;
  final String data_Inicial;
  final String data_Prazo;
  final String data_Final;
  final String descricao_Problema_Cliente;
  final String defeito_Encontrado_Tecnico;
  final String nota_Tempo;
  final String nota_Tecnico;
  final String nota_Eficacia;
  final String DataInicialSTR;
  final String DataPrazoSTR;
  final String DataFimSTR;
  final int status;
  final String nome_Cliente;
  final String nome_Tecnico;
  final bool corretiva;

  Chamado({this.id_Chamado, this.id_Cliente, this.id_Tecnico,this.id_Empresa,this.id_Equipamento, this.id_EPosto,this.id_Sintoma,this.data_Inicial, this.data_Prazo,this.data_Final,
    this.descricao_Problema_Cliente,this.defeito_Encontrado_Tecnico,this.nota_Tempo,this.nota_Tecnico,this.nota_Eficacia,this.DataInicialSTR,this.DataPrazoSTR, this.DataFimSTR,this.status,this.nome_Cliente,this.nome_Tecnico,this.corretiva});


  factory Chamado.fromJson(Map<String, dynamic> json) {
    return Chamado(
      id_Chamado: json['id_Chamado'],
      id_Cliente: json['id_Cliente'],
      id_Tecnico: json['id_Tecnico'],
      id_Empresa: json['id_Empresa'],
      id_Equipamento: json['id_Equipamento'],
      id_EPosto: json['id_EPosto'],
      id_Sintoma: json['id_Sintoma'],
      data_Inicial: json['data_Inicial'],
      data_Prazo: json['data_Prazo'],
      data_Final: json['data_Final'],
      descricao_Problema_Cliente: json['descricao_Problema_Cliente'],
      defeito_Encontrado_Tecnico: json['defeito_Encontrado_Tecnico'],
      nota_Tempo: json['nota_Tempo'],
      nota_Tecnico: json['nota_Tecnico'],
      nota_Eficacia: json['nota_Eficacia'],
      status: json['status'],
      nome_Cliente: json['nome_Cliente'],
      nome_Tecnico: json['nome_Tecnico'],
      corretiva: json['corretiva'],
      DataInicialSTR: json['dataInicialSTR'],
      DataPrazoSTR: json['dataPrazoSTR'],
      DataFimSTR: json['dataFimSTR']
    );
  }
}