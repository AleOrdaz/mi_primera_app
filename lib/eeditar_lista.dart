import 'package:app1920/utils/singletton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EeditarLista extends StatefulWidget {
  const EeditarLista({super.key});

  @override
  State<EeditarLista> createState() => _EeditarListaState();
}

class _EeditarListaState extends State<EeditarLista> {
  Singleton singleton = Singleton();
  final v1 = TextEditingController();
  final v2 = TextEditingController();
  final v3 = TextEditingController();
  final v4 = TextEditingController();
  final v5 = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(singleton.edit) {
      var u = singleton.usuarioE.toString().split('#');
      //Inicializamos los inputs con valores
      v1.text = u[1];
      v2.text = u[2];
      v3.text = u[3];
      v4.text = u[4];
      v5.text = u[5];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Column(
        children: [
          TextFormField(controller: v1,),
          TextFormField(controller: v2,),
          TextFormField(controller: v3,),
          TextFormField(controller: v4,),
          TextFormField(controller: v5,),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  //actuliza a la lista singleton
                  //Navigator.pushresplecament
                });
              },
              child: Text('Guardar'),
          )
        ],
      ),
    );
  }
}
