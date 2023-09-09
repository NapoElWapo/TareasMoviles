import 'package:flutter/material.dart';
import 'package:info_lugar/info_lugar.dart';
import 'package:info_lugar/item_actividad.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> _listElements = [
    {
      "dia": "Day 1",
      "place": "Vector's Hideout",
      "image": "images/vector.jpg",
    },
    {
      "dia": "Day 2",
      "place": "Mr O'Hare's Town",
      "image": "images/ohare.jpg",
    },
    {
      "dia": "Day 3",
      "place": "Helmepos's EastBlue",
      "image": "images/helmepo.jpg",
    },
    {
      "dia": "Day 4",
      "place": "Coconut head's School",
      "image": "images/cabezadecoco.jpg",
    },
    {
      "dia": "Day 5",
      "place": "The Lorax's Woods",
      "image": "images/lorax.jpg",
    },
    {
      "dia": "Day 6",
      "place": "Ian Hecox's House",
      "image": "images/ianhecox.jpg",
    },
    {
      "dia": "Day 7",
      "place": "Rock Lee's Dojo",
      "image": "images/rocklee.jpg",
    },
    {
      "dia": "Day 8",
      "place": "Edna Moda's Mansion",
      "image": "images/edna.jpg",
    },
    {
      "dia": "Day 9",
      "place": "Mob's House",
      "image": "images/mob.jpg",
    },
    {
      "dia": "Day 10",
      "place": "Payaso Leito's Circus",
      "image": "images/leito.jpg",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                      image: AssetImage("images/BY.jpg"),
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
              ),
              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top: 64,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _listElements.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemActividad(
                            actividad: _listElements[index],
                          );
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        //snackbar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Reservacion en progreso..."),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      child: Text("Start booking"),
                      color: Colors.grey[200],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
