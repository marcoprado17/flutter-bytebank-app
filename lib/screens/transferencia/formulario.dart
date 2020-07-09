import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da Conta';
const _dicaCampoNumeroConta = '0000';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _contraladorCampoNumeroConta = TextEditingController();
  final TextEditingController _contraladorCampoValor = TextEditingController();

  void _criarTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_contraladorCampoNumeroConta.text);
    final double valor = double.tryParse(_contraladorCampoValor.text);
    if(numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('Transferência criada');
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _contraladorCampoNumeroConta,
              label: _rotuloCampoNumeroConta,
              hint: _dicaCampoNumeroConta,
            ),
            Editor(
              controller: _contraladorCampoValor,
              label: _rotuloCampoValor,
              hint: _dicaCampoValor,
              iconData: Icons.monetization_on,
            ),
            RaisedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criarTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }
}
