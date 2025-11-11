import 'package:app1920/mapa.dart';
import 'package:app1920/principal.dart';
import 'package:app1920/widgets/snackbar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:app1920/constantes.dart' as cons;
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late SharedPreferences sharedPreferences;

  bool mostrarOcultar = true;
  final usuario = TextEditingController();
  final password = TextEditingController();

  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _audioPlayer = AudioPlayer();

    // Reproducir música al entrar a la vista
    _reproducirMusica();

    ///No se podemos inicializar nada que sea async
    initShared();
  }

  initShared() async {
    sharedPreferences = await SharedPreferences.getInstance();

    bool tieneSesionAbierta = sharedPreferences.getBool('band') ?? false;
    if(tieneSesionAbierta) {
      ////NUEVA PANTALLA O LA PANTALLA INICIAL
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Mapa()));
    }


    //BOTON DE CERRAR SESIÓN
    sharedPreferences.setBool('band', false);
  }

  Future<void> _reproducirMusica() async {
    await _audioPlayer.setSource(AssetSource('audio/musica_fondo.mp3'));
    await _audioPlayer.setReleaseMode(ReleaseMode.loop); // que suene en bucle
    await _audioPlayer.resume(); // empieza la reproducción
  }

  @override
  void dispose() {
    _audioPlayer.stop(); // Detiene la música al salir
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///Obtiene le valor/tamaño de la pantalla actual
    final size = MediaQuery.of(context).size;

    ///Cada elemento se le conoce como WIDGET
    ///LENGUAJE DART: programación de cascada
    ///- Cada Widget que se escriba se mostrará uno de bajo del otro.
    ///- Widget: trabaja con un hijo (child) o con varios hijos (children)
    ///  depende del widget
    ///- Cada Widget: contiene sus atributos el cual inicia en minuscula
    ///  (parecidos a css) y su valor inicia en mayuscula,
    ///  ej. "color: Colors.deepPurple"
    ///
    ///Buenas Practicas:
    ///- El último atributo o widget no deberá contener la coma "," del final
    ///  ya que la coma indica que siguirá otra widget o atributo
    ///- La linea de código nunca debe de sobrepasar la linea gris ----------->
    ///- Se deben de crear clases de los widgets que más se repitan para evitar
    ///  código repetido.
    //Obtiene el tamaño de vista y nos da los elmentos
    //principales de una app
    return Scaffold(
      body: SingleChildScrollView( //Equivalente a un scroll
        padding: EdgeInsets.all(size.height * 0.1), ///size.height * 1 -> 100%
                                                  ///size.height * 0.5 -> 50%
        child: Column(
          children: [
            /*Image.asset(
                'img/name_img.png', //Ruta y nombre archivo
              width: 100, height: 100,
                fit: BoxFit.cover,
            ),*/
            SizedBox(height: size.height * 0.075,),
            Text(                           //Siempre debe de abrir con "(,[,{"
              'INICIAR SESIÓN',             //Hijo -> String
              style: TextStyle(             //atributo
                  color: Colors.deepPurple, //atributos estilo web css
                  fontSize: 20.0
              ),                            //Debe de cerrarse con "),],}"
            ),
            buildRow('Usuario:'),
            buildTextFormField('Usuario', false),    //Equivalente a un input
            SizedBox(height: size.height * 0.1,),
            buildRow('Contraseña:'),
            buildTextFormField('Contraseña', true),    //Equivalente a un input
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Olvidaste tu contraseña?',
                  style: TextStyle(color: cons.gris),
                )
              ],
            ),
            SizedBox(height: size.height * 0.1,),
            ElevatedButton(     //Equivalente a un botón
              style: ElevatedButton.styleFrom(
                backgroundColor: cons.azul1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                fixedSize: Size(size.width * 0.75, 45)
              ),
              onPressed: (){
                setState(() {
                  print('Se presiono el botón');
                  print('Usuario: ${usuario.text}');
                  print('Contraseña: ${password.text}');
                  
                  if(usuario.text == cons.usuario &&
                      password.text ==  cons.pass){
                    ///vamos a guardar el usuario, contraseña y bandera
                    ///verficar si tiene la sesión abierta o activa
                    sharedPreferences.setString('user', usuario.text);
                    sharedPreferences.setString('pass', password.text);
                    sharedPreferences.setBool('band', true);
                    //Cambiar de vista
                    //Remplazamaos la vista actual y hace push a la nueva
                    Navigator.pushReplacement(context, 
                        MaterialPageRoute(builder:
                            (context) => Principal()));
                  } else {
                    //Mostramos un menesaje de error
                    ShowSnackbar(context, 'texto', 20);
                  }
                });
              },  //Funciones o acción a realizar al presionar el btn
              child: Text('Ingresar'), 
            )
          ],
        ),
      )
    );
  }

  Row buildRow(String text) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontSize: 16),),
      ],
    );
  }

  TextFormField buildTextFormField(String text, bool band) {
    return TextFormField(
      controller: band ? password : usuario,
      obscureText: band ? mostrarOcultar : false, /// Oculta el texto escrito ********
      decoration: InputDecoration( ///Diseño y forma
          filled: true,
          fillColor: cons.blanco,
          suffixIcon: band ? IconButton(
            onPressed: (){
              setState(() { ///Actualiza el estado actual de la vista
                mostrarOcultar = !mostrarOcultar;
              });
            },
            icon: Icon(mostrarOcultar ? Icons.visibility_off : Icons.visibility),
          ) : null,
          prefixIcon: band ? Icon(Icons.password) : Icon(Icons.person),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50)
          ),
          hintText: text
      ),
    );
  }
}
