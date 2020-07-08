import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormularioTransferencia(),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _contraladorCampoNumeroConta = TextEditingController();
  final TextEditingController _contraladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            controller: _contraladorCampoValor,
            label: 'Número da Conta',
            hint: '0000',
          ),
          Editor(
            controller: _contraladorCampoValor,
            label: 'Valor',
            hint: '0.00',
            iconData: Icons.monetization_on,
          ),
          RaisedButton(
            child: Text('Confirmar'),
            onPressed: () {
//              debugPrint('clicou no confirmar');
//              debugPrint(_contraladorCampoNumeroConta.text);
//              debugPrint(_contraladorCampoValor.text);
              final int numeroConta = int.tryParse(_contraladorCampoNumeroConta.text);
              final double valor = double.tryParse(_contraladorCampoValor.text);
              if(numeroConta != null && valor != null) {
                final transferenciaCriada = Transferencia(valor, numeroConta);
                debugPrint('$transferenciaCriada');
              }
            },
          ),
        ],
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData iconData;

  const Editor({Key key, this.controller, this.label, this.hint, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
            fontSize: 24.0
        ),
        decoration: InputDecoration(
          icon: iconData != null ? Icon(iconData) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}


class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(105.5, 1000)),
          ItemTransferencia(Transferencia(52.0, 1000)),
          ItemTransferencia(Transferencia(14400, 1000)),
        ],
      ),
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
