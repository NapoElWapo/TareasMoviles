import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _iconColor1 = Colors.black;
  Color _iconColor2 = Colors.black;
  Color _iconColor3 = Colors.black;
  Color _iconColor4 = Colors.black;
  int _numero = 0;

  void _changeIconColor(int iconNumber) {
    setState(() {
      switch (iconNumber) {
        case 1:
          if (_iconColor1 == Colors.black) {
            _numero++;
            _iconColor1 = Colors.indigo;
          } else {
            _numero--;
            _iconColor1 = Colors.black;
          }
          ;

          break;
        case 2:
          _iconColor2 =
              _iconColor2 == Colors.black ? Colors.indigo : Colors.black;
          break;
        case 3:
          _iconColor3 =
              _iconColor3 == Colors.black ? Colors.indigo : Colors.black;
          break;
        case 4:
          _iconColor4 =
              _iconColor4 == Colors.black ? Colors.indigo : Colors.black;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(
              "https://image.winudf.com/v2/image1/Y29tLm5ld2FuZHJvbW8uZGV2MTg5NjIwNC5hcHAyNTkwNTQ4X3NjcmVlbl8wXzE2NzIwODcwMDFfMDQ3/screen-0.webp?fakeurl=1&type=.webp"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 2,
                child: ListTile(
                  title: Text("El ITESO"),
                  subtitle: Text("San Pedro Tlaquepaque, Jal"),
                ),
              ),
              IconButton(
                onPressed: () {
                  _changeIconColor(1);
                },
                icon: Icon(Icons.thumb_up),
                color: _iconColor1,
              ),
              Text("$_numero"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    iconSize: 48,
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(content: Text("Abriendo el correo...")));
                      _changeIconColor(2);
                    },
                    icon: Icon(Icons.message),
                    color: _iconColor2,
                  ),
                  Text("Correo")
                ],
              ),
              Column(
                children: [
                  IconButton(
                    iconSize: 48,
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(SnackBar(content: Text("Llamando...")));
                      _changeIconColor(3);
                    },
                    icon: Icon(Icons.phone),
                    color: _iconColor3,
                  ),
                  Text("Llamada")
                ],
              ),
              Column(
                children: [
                  IconButton(
                    iconSize: 48,
                    onPressed: () {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                            SnackBar(content: Text("Abriendo Maps...")));
                      _changeIconColor(4);
                    },
                    icon: Icon(Icons.directions),
                    color: _iconColor4,
                  ),
                  Text("Ruta")
                ],
              )
            ],
          ),
          SizedBox(height: 64),
          Text(
            '''El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente) es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957.
          
          La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. La universidad es nombrada como la Universidad Jesuita de Guadalajara. ''',
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
