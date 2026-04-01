import 'dart:math';
import 'package:flutter/material.dart';

class Financiamentos extends StatefulWidget {
  const Financiamentos({super.key});

  @override
  State<Financiamentos> createState() => _FinanciamentosState();
}

class _FinanciamentosState extends State<Financiamentos> {
  double valor = 0;
  double taxa = 0;
  int parcelas = 0;
  double taxasExtras = 0;

  double total = 0;
  double parcela = 0;

void calcular() {
  double i = taxa / 100;

  if (valor > 0 && parcelas > 0 && i > 0) {
    double montante = valor * pow(1 + i, parcelas);

    parcela = montante / parcelas;
    total = montante + taxasExtras;
  } else {
    parcela = 0;
    total = 0;
  }

  setState(() {});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simulador de Financiamento"),
        backgroundColor: Colors.brown,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: "Valor do financiamento",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    valor = double.tryParse(value) ?? 0,
              ),
              const SizedBox(height: 15),

              TextField(
                decoration: const InputDecoration(
                  labelText: "Taxa de juros ao mês (%)",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    taxa = double.tryParse(value) ?? 0,
              ),
              const SizedBox(height: 15),

              TextField(
                decoration: const InputDecoration(
                  labelText: "Número de parcelas",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    parcelas = int.tryParse(value) ?? 0,
              ),
              const SizedBox(height: 15),

              TextField(
                decoration: const InputDecoration(
                  labelText: "Demais taxas e custos",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) =>
                    taxasExtras = double.tryParse(value) ?? 0,
              ),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: calcular,
                child: const Text("Calcular"),
              ),

              const SizedBox(height: 20),

              Text(
                "Valor total: R\$ ${total.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                "Parcela: R\$ ${parcela.toStringAsFixed(2)}",
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Voltar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}