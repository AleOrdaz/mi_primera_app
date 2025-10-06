import 'package:flutter/material.dart';

class SQLite extends StatefulWidget {
  const SQLite({super.key});

  @override
  State<SQLite> createState() => _SQLiteState();
}

class _SQLiteState extends State<SQLite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _insert(context);
            },
            child: Text('Agregar datos'),
          )
        ],
      ),
    );
  }

  // Button onPressed methods
  void _insert(BuildContext context) async {
    final name = TextEditingController();
    final age = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
      return AlertDialog(
          title: const Text('Insertar nuevo usuario'),
    content: Column(
      children: [

      ],
    ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Cerrar el AlertDialog
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              ///JSON
              Map<String, dynamic> row = {
                DatabaseHelper.columnName: name.text,
                DatabaseHelper.columnAge: int.parse(age.text)
              };
              final id = await dbHelper.insert(row);

              debugPrint('inserted row id: $id'); // = print("");

              Navigator.of(context).pop(); // Cerrar el AlertDialog
            },
            child: const Text('Guardar'),
          ),
        ],

      );
    )
  }
}
