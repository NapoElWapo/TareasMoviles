import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  int numeroAleatorio = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pagina 3'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop("(〜￣▽￣)〜");
                },
                color: Colors.grey[200],
                child: Text("(〜￣▽￣)〜")),
            MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop("ヽ(✿ﾟ▽ﾟ)ノ");
                },
                color: Colors.grey[200],
                child: Text("ヽ(✿ﾟ▽ﾟ)ノ")),
            MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop("(p≧w≦q)");
                },
                color: Colors.grey[200],
                child: Text("(p≧w≦q)")),
          ],
        ));
  }
}
