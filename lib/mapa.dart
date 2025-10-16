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

    } catch(e) {
      print('Hubo un error al extraer las coordenadas');
    }
  }

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
      ),
    );
  }
}
