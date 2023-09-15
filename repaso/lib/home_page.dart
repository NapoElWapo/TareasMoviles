import 'package:flutter/material.dart';
import 'package:repaso/second_page.dart';
import 'package:repaso/third_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? valorRetornadoPag2;
  String? valorRetornadoPag3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarea 1'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "BIENVENIDOS",
              style: TextStyle(
                  fontSize: 34,
                  fontFamily: "Pacifico",
                  color: Colors.grey[600]),
            ),
            Image.asset("assets/images/dartside.png"),
            SizedBox(height: 50),
            Text(
              "Seleccione la accion a realizar:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Ingrese datos"),
                            content: TextField(
                              decoration: InputDecoration(
                                hintText: "Ingrese palabra",
                              ),
                              maxLength: 10,
                            ),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cerrar"),
                              ),
                              MaterialButton(
                                onPressed: () async {
                                  final variableRecibida =
                                      await Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SecondPage()));

                                  setState(() {
                                    valorRetornadoPag2 = variableRecibida;
                                    Navigator.pop(context);
                                  });
                                },
                                child: Text("Aceptar"),
                              ),
                            ],
                          );
                        });
                  },
                  child: Text(
                    "Pagina 2",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
                MaterialButton(
                  onPressed: () async {
                    final variableRecibida = await Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ThirdPage()));

                    setState(() {
                      valorRetornadoPag3 = variableRecibida;
                    });
                  },
                  child: Text(
                    "Pagina 3",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue,
                ),
              ],
            ),
            SizedBox(height: 40),
            Text("Pg.2 => ${valorRetornadoPag2}"),
            SizedBox(height: 50),
            Text("Pg.3 => ${valorRetornadoPag3}"),
          ],
        ),
      ),
    );
  }
}
