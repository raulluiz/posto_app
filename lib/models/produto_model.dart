class produto{
  final int Id;
  final String Nome;
  produto({this.Id,this.Nome});

  factory produto.fromJson(Map<String, dynamic> json) {
    return produto(
        Id: json['id'],
        Nome: json['nome']
    );
  }
}