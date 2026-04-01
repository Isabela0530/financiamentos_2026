import 'package:flutter/material.dart';
import 'financiamentos.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Financiamentos(),
              ),
            );
          },
          child: Text("Entrar"),
        ),
      ),
    );
  }
}