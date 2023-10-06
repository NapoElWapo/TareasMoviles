// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers
import 'package:tip_time/tip_time_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tip Time"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.room_service),
                SizedBox(width: 20.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Cost of Service',
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      context.read<TipTimeProvider>().updateTotalAmount(value);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Icon(Icons.dinner_dining_outlined),
                SizedBox(width: 20.0),
                Text(
                  "How was the service?",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            Column(
                children: [
                  ListTile(
                    title: Text(
                      "Amazing 20%",
                      style: TextStyle(fontSize: 20),
                    ),
                    leading: Radio(
                      value: 0,
                      groupValue: context.watch<TipTimeProvider>().currentSelectedRadio,
                      onChanged: (value) {
                        context.read<TipTimeProvider>().updateRadio(value);
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Good 18%",
                      style: TextStyle(fontSize: 20),
                    ),
                    leading: Radio(
                      value: 1,
                      groupValue: context.watch<TipTimeProvider>().currentSelectedRadio,
                      onChanged: (value) {
                        context.read<TipTimeProvider>().updateRadio(value);
                      },
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Okay 15%",
                      style: TextStyle(fontSize: 20),
                    ),
                    leading: Radio(
                      value: 2,
                      groupValue: context.watch<TipTimeProvider>().currentSelectedRadio,
                      onChanged: (value) {
                        context.read<TipTimeProvider>().updateRadio(value);
                      },
                    ),
                  ),
                ],
              
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Icon(Icons.credit_card),
                SizedBox(width: 20.0),
                Text(
                  "Round up tip",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Spacer(),
                 Switch(value: context.watch<TipTimeProvider>().sValue, onChanged: (sValue){
                    context.read<TipTimeProvider>().updateSwitch(sValue);
                  }),
                
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(onPressed: (){
                    context.read<TipTimeProvider>().calculate();
                  }, child: Text("CALCULATE"),
                  color: Colors.green,),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                Spacer(),
                Text(
                  "Tip amount: \$${context.read<TipTimeProvider>().tipAmount.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
