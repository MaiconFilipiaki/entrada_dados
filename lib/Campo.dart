import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Campo extends StatefulWidget {
  @override
  _CampoState createState() => _CampoState();
}

class _CampoState extends State<Campo> {

  TextEditingController _textEditingControllerAlcool = TextEditingController();
  TextEditingController _textEditingControllerGas = TextEditingController();
  String _textResult = "";

  void _calcular() {
    double priceAlcool = double.tryParse(_textEditingControllerAlcool.text);
    double priceGas = double.tryParse(_textEditingControllerGas.text);
    _limparCampos();
    if (priceAlcool == null || priceGas == null){
      setState(() {
        _textResult = "Digite um valor valido";
      });
      return;
    }
    if((priceAlcool / priceGas) >= 0.7) {
      setState(() {
        _textResult = "Melhor abastecer com gasolina";
      });
      return;
    }
    setState(() {
      _textResult = "Melhor abastecer com alcool";
    });
  }

  void _limparCampos() {
    _textEditingControllerGas.text = "";
    _textEditingControllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Preço Alcool, ex.: 1.59",
                ),
                style: TextStyle(
                  fontSize: 20,
                ),
                controller: _textEditingControllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Preço Gasolina, ex.: 3.15",
                ),
                style: TextStyle(
                  fontSize: 20,
                ),
                controller: _textEditingControllerGas,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: RaisedButton(
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold

                    ),
                  ),
                  color: Colors.blue,
                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textResult,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

