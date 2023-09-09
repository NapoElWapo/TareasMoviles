import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final Map<String, String> actividad;
  ItemActividad({
    super.key,
    required this.actividad,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              margin: EdgeInsets.all(10),
              width: 160,
              height: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                child: Stack(
                  children: [
                    Positioned.fill(child: _imagenPlace()),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Text(
                        "${actividad["dia"]} \n ${actividad["place"]}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                // bottomLeft
                                offset: Offset(-1.5, -1.5),
                                color: Colors.black),
                            Shadow(
                                // bottomRight
                                offset: Offset(1.5, -1.5),
                                color: Colors.black),
                            Shadow(
                                // topRight
                                offset: Offset(1.5, 1.5),
                                color: Colors.black),
                            Shadow(
                                // topLeft
                                offset: Offset(-1.5, 1.5),
                                color: Colors.black),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _imagenPlace() {
    return Image.asset(
      fit: BoxFit.fill,
      "${actividad["image"]}",
    );
  }
}
