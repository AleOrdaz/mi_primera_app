import 'dart:math';

import 'package:flutter/material.dart';
import 'package:app1920/constantes.dart' as cons;

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  bool r1 =  false;
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
                          r1 = !r1;
                        });
                      },
                      child: Container(
                        color: r1? randomColor() : randomColor(),
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


  /// Devuelve un color aleatorio en formato Color(0xFFxxxxxx)
  Color randomColor() {
    final Random random = Random();
    return Color(0xFF000000 + random.nextInt(0xFFFFFF));
  }
}
