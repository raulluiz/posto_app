class postos{
  final int id_EPosto;
  final int id_Empresa;
  final String cnpj;
  final String nome_Fantasia;
  final String razao_Social;
  final String endereco;
  final int uf;
  final String linkGoogleMaps;
  final bool ativo;
  final String data_Preventiva;
  final int prazo_Atendimento;
  final int id_Tecnico;
  final String nome_Tecnico;

  postos({this.id_EPosto,this.id_Empresa,this.cnpj,this.nome_Fantasia, this.razao_Social, this.endereco, this.uf,this.linkGoogleMaps, this.ativo, this.data_Preventiva,
      this.prazo_Atendimento,this.id_Tecnico,this.nome_Tecnico});

  factory postos.fromJson(Map<String, dynamic> json) {
    return postos(
      id_EPosto: json['id_EPosto'],
      id_Empresa: json['id_Empresa'],
      cnpj: json['cnpj'],
      nome_Fantasia: json['nome_Fantasia'],
      razao_Social: json['razao_Social'],
      endereco: json['endereco'],
      uf: json['uf'],
      linkGoogleMaps: json['linkGoogleMaps'],
      ativo: json['ativo'],
      data_Preventiva: json['data_Preventiva'],
      prazo_Atendimento: json['prazo_Atendimento'],
      id_Tecnico: json['id_Tecnico'],
      nome_Tecnico: json['nome_Tecnico'],
    );
  }
}