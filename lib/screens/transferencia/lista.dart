import 'package:bytebank/components/item_transferencia.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ListaTransferenciaState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    debugPrint("ListaTransferenciaState.build chamado");
    debugPrint('${widget._transferencias}');

    return Scaffold(
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, idx) {
          return ItemTransferencia(widget._transferencias[idx]);
        },
      ),
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return FormularioTransferencia();
                },
              )
          ).then((transferencia) {
            _atualiza(transferencia);
          });
        },
      ),
    );
  }

  void _atualiza(Transferencia transferencia) {
    if(transferencia != null) {
      debugPrint('Transferência recebida no future then');
      debugPrint('$transferencia');
      setState((){
        widget._transferencias.add(transferencia);
      });
    }
  }
}
