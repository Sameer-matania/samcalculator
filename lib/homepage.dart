// ignore: unused_import
import 'dart:math';

import 'package:flutter/material.dart';

class HOMEPAGE1 extends StatefulWidget {
  const HOMEPAGE1({super.key});

  @override
  State<HOMEPAGE1> createState() => _HOMEPAGE1State();
}

class _HOMEPAGE1State extends State<HOMEPAGE1> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();
  TextEditingController num3 = TextEditingController();
  TextEditingController num4 = TextEditingController();
  double distance = 0.0;
  double snfkg = 0.0;
  double avgrate = 0.0;
  double amount = 0.0;
  double fatkg = 0.0;

  void distancefinder() {
    double x1 = double.tryParse(num1.text) ?? 0;
    double y1 = double.tryParse(num2.text) ?? 0;
    double x2 = double.tryParse(num3.text) ?? 0;
    double y2 = double.tryParse(num4.text) ?? 0;
    setState(() {
      distance = calculatedistance(x1, y1, x2, y2);
      snfkg = calculatesnfkg(x1, y1, x2, y2);
      fatkg = calculatefatkg(x1, y1, x2, y2);
      avgrate = calculateavgrate(x1, y1, x2, y2);
      amount = calculateamount(x1, y1, x2, y2);
    });
  }

  double calculateamount(
    double x1,
    double y1,
    double x2,
    double y2,
  ) {
    return (avgrate * x1);
  }

  double calculateavgrate(
    double x1,
    double y1,
    double x2,
    double y2,
  ) {
    double dx = ((y2 / 6.5) * (60 / 100)) * y1 / 100;
    double dy = ((y2 / 8.5) * (40 / 100)) * distance / 100;
    return (dx + dy);
  }

  double calculatedistance(
    double x1,
    double y1,
    double x2,
    double y2,
  ) {
    double dx = (x2 / 4) + .14;
    double dy = .20 * y1;
    return (dx + dy);
  }

  double calculatesnfkg(
    double x1,
    double y1,
    double x2,
    double y2,
  ) {
    double dx = distance;
    double dy = x1 / 100;
    return (dx * dy);
  }

  double calculatefatkg(
    double x1,
    double y1,
    double x2,
    double y2,
  ) {
    return (y1 * (x1 / 100));
  }

  void clearFields() {
    setState(() {
      num1.clear();
      num2.clear();
      num3.clear();
      num4.clear();
      distance = 0.0; // Reset calculated distance
      snfkg = 0.0;
      fatkg = 0.0;
      avgrate = 0.0;
      amount = 0.0; // Reset calculated SNF kg
    });
  }

  @override
  void dispose() {
    num1.dispose();
    num2.dispose();
    num3.dispose();
    num4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text('Kamaal Milk Calculator'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              /*const Text(
                'ENTER THE COORDINATES OF POINT A',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),*/
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "QTY",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 60,
                    width: 100,
                    child: TextField(
                      controller: num1,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Quantity',
                          hintStyle: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "FAT",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 60,
                    width: 100,
                    child: TextField(
                      controller: num2,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'FAT%',
                          hintStyle: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              /*const Text(
                'ENTER THE COORDINATES OF POINT B',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),*/
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "CLR",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 60,
                    width: 100,
                    child: TextField(
                      controller: num3,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'CLR',
                          hintStyle: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "RATE",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    height: 60,
                    width: 100,
                    child: TextField(
                      controller: num4,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'RATE',
                          hintStyle: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: distancefinder,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white),
                      child: const Text(
                        'Calculate',
                        style: TextStyle(fontSize: 20),
                      )),
                  const SizedBox(
                    width: 30,
                  ),
                  ElevatedButton(
                      onPressed: clearFields,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white),
                      child: const Text(
                        "RESET",
                        style: TextStyle(fontSize: 20),
                      ))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'SNF = ${distance.toStringAsFixed(2)} ',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'SNF Kg = ${snfkg.toStringAsFixed(2)} Kg',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'FAT Kg = ${fatkg.toStringAsFixed(2)} Kg',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'AVG. RATE = Rs ${avgrate.toStringAsFixed(2)} /Kg',
                style: const TextStyle(fontSize: 20),
              ),
              Text(
                'AMOUNT = Rs ${amount.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
