import 'package:flutter/material.dart';
import 'package:batalha_series/model/model_serie.dart';
import 'package:batalha_series/controller/controller_serie.dart';

class CadastrarSerieView extends StatelessWidget {
  final SeriesController controller = SeriesController();
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _generoController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _capaController = TextEditingController();

  void _salvarSerie(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      controller.adicionarSerie(
        Serie(
          id: DateTime.now().toString(),
          nome: _nomeController.text,
          genero: _generoController.text,
          descricao: _descricaoController.text,
          capaUrl: _capaController.text,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastrar Série')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) => value!.isEmpty ? 'Informe o nome' : null,
              ),
              TextFormField(
                controller: _generoController,
                decoration: InputDecoration(labelText: 'Gênero'),
                validator: (value) => value!.isEmpty ? 'Informe o gênero' : null,
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(labelText: 'Descrição'),
                validator: (value) => value!.isEmpty ? 'Informe a descrição' : null,
              ),
              TextFormField(
                controller: _capaController,
                decoration: InputDecoration(labelText: 'URL da Capa'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _salvarSerie(context),
                child: Text('Salvar Série'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
