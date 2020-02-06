import 'package:carros/pages/carro/carro.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatelessWidget {
  Carro carro;
  CarroPage(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.of(context).pop()),
        title: Text(carro.nome),
      ),
      body: _body(),
    );
  }

  _body() {
    return Image.network(carro.urlFoto);
  }
}
