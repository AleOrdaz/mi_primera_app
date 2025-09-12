import 'package:app1920/utils/singletton.dart';
import 'package:flutter/material.dart';
import 'package:app1920/constantes.dart' as cons;

class Listas extends StatefulWidget {
  const Listas({super.key});

  @override
  State<Listas> createState() => _ListasState();
}

class _ListasState extends State<Listas> {
  Singleton singleton = Singleton();

  //Antes de craer la vista carga/actualiza/asigna/etc...
  //a las varables dentro de ella
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///Lista inmutable o de tipo que no permita tener cambios
    singleton.listUsuarios =  cons.usuarios;
    /// Crea una copia mutable de la lista original
    singleton.listUsuarios = List.from(singleton.listUsuarios);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: singleton.listUsuarios.length,
            padding: EdgeInsets.all(25),
            itemBuilder: (BuildContext context, int index){
              //Separamos elementos
              var usuario = singleton.listUsuarios[index].toString().split('#');
              return Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(usuario[0]),
                        Text('${usuario[1]} ${usuario[2]}'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(usuario[3])
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex:10,child: Text(usuario[4]),),
                        InkWell(
                          onTap: (){
                            setState(() {
                              singleton.edit = true;
                              String cambioIndex = 'id#';
                              singleton.usuarioE = usuario;
                              singleton.listUsuarios[index] = cambioIndex;
                            });
                          },
                          child: Icon(Icons.edit),
                        ),
                        InkWell(
                          onTap: (){
                            setState(() {
                              print(usuario[0]);
                              ///Eliminamos un elemento con el index/id
                              singleton.listUsuarios.removeAt(index);
                              ///Eliminamos un elemento por elemento
                              singleton.listUsuarios.remove(usuario);
                            });
                          },
                          child: Icon(Icons.delete),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
          Align(
            child: IconButton(
                onPressed: (){
                  setState(() {
                    singleton.edit = false;
                    singleton.listUsuarios.add('id#nombre#ape#contr#fecha#1');
                  });
                },
                icon: Icon(Icons.add, size: 40, color: cons.azul4,),
            ),
          )
        ],
      )
    );
  }

  showDialogImei(BuildContext context, String imei) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context){
          return AlertDialog(
            backgroundColor: cons.blanco,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(26.0))
            ),
            title: const Text(
              'SINGLETON', style: TextStyle(color: cons.azul3),
            ),
            content: Text(
              imei.toUpperCase(), style: const TextStyle(color: cons.negro, fontSize: 18),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                style: TextButton.styleFrom(
                  backgroundColor: cons.azul2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  ' Cerrar ', style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        }
    );
  }
}
