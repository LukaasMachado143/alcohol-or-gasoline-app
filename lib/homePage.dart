import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _alcoholController = TextEditingController();
  TextEditingController _gasolineController = TextEditingController();
  String _result = "";

  double? _parseValue(String value) {
    return double.tryParse(value.replaceAll(",", "."));
  }

  void _calculate() {
    double? parsedAlcohol = _parseValue(_alcoholController.text);
    double? parsedGasoline = _parseValue(_gasolineController.text);

    if (parsedGasoline == null || parsedAlcohol == null) {
      setState(() {
        _result =
            "Algum campo está com valores inválidos, ajuste-os e clique em calcular novamente.";
      });
    } else {
      double division = parsedAlcohol / parsedGasoline;
      setState(() {
        _result = "Melhor usar ${division >= 0.7 ? 'gasolina' : 'álcool'}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 32),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Preço do álcool"),
                  style: TextStyle(fontSize: 22),
                  controller: _alcoholController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Preço do gasolina"),
                  style: TextStyle(fontSize: 22),
                  controller: _gasolineController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: TextButton(
                  onPressed: _calculate,
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  _result,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
