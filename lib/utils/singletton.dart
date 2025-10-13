///Es un punto de acceso global
///BD o memoria chache durante el uso de la app
class Singleton {
  static Singleton? _instance;

  Singleton._internal() {
    _instance = this;
  }

  // Verifica si singleton es null, si es crea la instancia nueva y
  // si no devuelve la instancia del cache
  factory Singleton() => _instance ?? Singleton._internal();

  List listUsuarios = [];
  var usuarioE;
  bool edit = false;


}