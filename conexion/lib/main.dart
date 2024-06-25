import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List avistamiento = [];

  @override
  void initState() {
    super.initState();
    fetchClientes();
  }

  fetchClientes() async {
    final response =
        await http.get(Uri.parse('http://localhost/apiphp/consultar%233.php'));

    if (response.statusCode == 200) {
      setState(() {
        avistamiento = json.decode(response.body);
      });
    } else {
      throw Exception('error al cargar los avistamient');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('avistamiento'),
      ),
      body: ListView.builder(
        itemCount: avistamiento.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
                '${avistamiento[index]['numero']} ${avistamiento[index]['ubicacion']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('hora: ${avistamiento[index]['hora']}'),
                Text('aspecto: ${avistamiento[index]['aspecto']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
