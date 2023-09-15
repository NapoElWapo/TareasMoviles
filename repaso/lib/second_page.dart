import 'dart:math';

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int numeroAleatorio = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue, Colors.white])),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Pagina 2'),
          ),
          backgroundColor: Colors.transparent,
          body: Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Text(
                  "Genere numero random",
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: "SourceCodePro",
                      color: Colors.purple),
                ),
                SizedBox(height: 10),
                Text(
                  "${numeroAleatorio}",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: "SourceCodePro",
                      color: Colors.red),
                ),
                SizedBox(height: 10),
                MaterialButton(
                    onPressed: () {
                      generarNumero();
                    },
                    color: Colors.white,
                    child: Text("Generar")),
                SizedBox(height: 5),
                MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop("$numeroAleatorio");
                    },
                    color: Colors.white,
                    child: Text("Guardar"))
              ],
            ),
          )),
    );
  }

  void generarNumero() {
    setState(() {
      numeroAleatorio = Random().nextInt(200);
    });
  }
}
