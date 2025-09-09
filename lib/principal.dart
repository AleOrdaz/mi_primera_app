import 'package:flutter/material.dart';
import 'package:app1920/constantes.dart' as cons;

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: InkWell( //Da acción de botón a cualquier widget
                      onTap: () {
                        setState(() {
                          //Cambio de color
                        });
                      },
                      child: Container(
                        color: cons.azul2,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: cons.azul3,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: cons.azul1,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: cons.gris,
                    ),
                  ),
                ],
              ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: InkWell( //Da acción de botón a cualquier widget
                    onTap: () {
                      setState(() {
                        //Cambio de color
                      });
                    },
                    child: Container(
                      color: cons.azul1,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: cons.azul2,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: cons.negro,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: cons.azul1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: InkWell( //Da acción de botón a cualquier widget
                    onTap: () {
                      setState(() {
                        //Cambio de color
                      });
                    },
                    child: Container(
                      color: cons.azul2,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: cons.azul3,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: cons.azul1,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: cons.azul1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: InkWell( //Da acción de botón a cualquier widget
                    onTap: () {
                      setState(() {
                        //Cambio de color
                      });
                    },
                    child: Container(
                      color: cons.azul2,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: cons.azul3,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: cons.azul1,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: cons.azul1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: InkWell( //Da acción de botón a cualquier widget
                    onTap: () {
                      setState(() {
                        //Cambio de color
                      });
                    },
                    child: Container(
                      color: cons.azul2,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: cons.azul3,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: cons.azul1,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: cons.azul1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: InkWell( //Da acción de botón a cualquier widget
                    onTap: () {
                      setState(() {
                        //Cambio de color
                      });
                    },
                    child: Container(
                      color: cons.azul2,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: cons.azul3,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: cons.azul1,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: cons.azul1,
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
