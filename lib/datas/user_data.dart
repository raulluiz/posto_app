class UserData {
  String token;
  String nome;
  int idUsuario;
  String perfil;

  UserData(Map<String, dynamic> data) {
    token = data['token'];
    nome = data['nome'];
    idUsuario = data['id_Usuario'];
    perfil = data['perfil'];
  }
}