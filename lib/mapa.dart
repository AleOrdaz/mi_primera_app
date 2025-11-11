import 'package:app1920/utils/get_api.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {
  const Mapa({super.key});

  @override
  State<Mapa> createState() => _MapaState();
}

class _MapaState extends State<Mapa> {
  late GoogleMapController mapController; //Variable para manipular el mapa

  late LatLng _center = const LatLng(22.144596, -101.009064);
  //Coordenadas para posisciar el mapa

  //Coordenadas para dibujar los marcadores
  static const LatLng sourceLocation = LatLng(22.144596, -101.009064);
  static const LatLng destination = LatLng(22.14973, -100.992221);

  //Guardar los puntos con las coordenadas (lat, lng)
  final List<LatLng> polyPoints = [];
  //Guardar las lineas sobre el mapa (P1-----P2)
  final Set<Polyline> polyLines = {};

  @override
  void initState() {
    getJsonData(); // Función que realiza el llamado a la api

    super.initState();
  }

  //Inicializar y crear el mapa
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> getJsonData() async {
    NetworkHelper nh = NetworkHelper(
      startLat: 22.144596,
      startLng: -101.009064,
      endLat: 22.149730,
      endLng: -100.992221,);
    try {
      var data;
      //LLamado a la funcion que solicita a la api las coordenadas
      data = await nh.getData();
      print("1 $data"); //json completo
      print("2 ${data['features']}"); // atributo 1er nivel
      print("3 ${data['features'][0]}");
      print("4 ${data['features'][0]["geometry"]}");
      print("5 ${data['features'][0]["geometry"]["coordinates"]}");

      //Variable para controlar las coordenadas y craer la polyline
      LineString ls = LineString(data['features'][0]["geometry"]["coordinates"]);

      for(int i = 0; i < ls.lineString.length; i++){
        //[22.13223451, 101.2156526]
        polyPoints.add(LatLng(ls.lineString[i][1], ls.lineString[i][0]));
      }

      setPolyLines();

    } catch(e) {
      print('Hubo un error al extraer las coordenadas');
    }
  }

  setPolyLines() {
    setState(() {
      print("p1--------p2");
      Polyline polyline = Polyline(
        polylineId: PolylineId('poly'),
        color: Colors.red,
        width: 6,
        points: polyPoints
      );
      print("p1--------p2--------p3");
      polyLines.add(polyline);
    });
  }

  ///
  ///       |                        |
  ///       MO                       MD
  ///

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _onMapCreated, //Crea el mapa
        myLocationEnabled: true, //detecta mi posición actual
        myLocationButtonEnabled: true, //muestra el botón para encontrar mi posicion
        initialCameraPosition: CameraPosition( //Coloca el centro del mapa
          target: _center, //en cierta posisción
          zoom: 11.0,
        ),
        polylines: polyLines,
        markers: {
          Marker(
              markerId: MarkerId('Origen'),
            position: LatLng(22.144596, -101.009064),
            infoWindow: InfoWindow(title: 'Marca origen'),
            onTap: () {
                setState(() {
                  ///AQUI PUEDEN AGREGAR UN ALERT DIALOG O CUALQUIER OTRO WIDGET
                });
            }
          ),
          Marker(
              markerId: MarkerId('Destino'),
              position: LatLng(22.149730, -100.992221),
              infoWindow: InfoWindow(title: 'Marca destino'),
              onTap: () {
                setState(() {
                  ///AQUI PUEDEN AGREGAR UN ALERT DIALOG O CUALQUIER OTRO WIDGET
                });
              }
          ),
        }
      ),
    );
  }
}

class LineString {
  LineString(this.lineString);
  List<dynamic> lineString;
}