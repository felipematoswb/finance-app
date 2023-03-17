import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/ModelProvider.dart';
import 'package:date_field/date_field.dart';

class TodoCreatePage extends StatefulWidget {
  const TodoCreatePage({super.key});

  @override
  State<TodoCreatePage> createState() => _TodoCreatePageState();
}

class _TodoCreatePageState extends State<TodoCreatePage> {
  final _formKey = GlobalKey<FormState>();
  String _assets = '';
  bool _buy = false;
  double _quantity = 0.0;
  double _price = 0.0;
  TemporalDate _date = TemporalDate.now();
  String _notes = '';
  double _spend = 0.0;

  Future<void> savePost() async {
    final newPost = TodoApp(
      assets: _assets,
      date: _date,
      price: _price,
      quantity: _quantity,
      spend: _spend,
      userId: 'dffgdfgdfgdfgdfe',
      notes: _notes,
    );

    await Amplify.DataStore.save(newPost);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('My Form Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Fund",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um ativo';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _assets = value!;
                    },
                  ),
                  CheckboxListTile(
                    title: const Text('Compra?'),
                    value: _buy,
                    onChanged: (value) {
                      setState(() {
                        _buy = value!;
                      });
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Amont',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira uma quantidade';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _quantity = double.parse(value!);
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'How Much?',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um preço';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _price = double.parse(value!);
                    },
                  ),
                  DateTimeFormField(
                    mode: DateTimeFieldPickerMode.date,
                    decoration: const InputDecoration(
                      labelText: 'Date',
                    ),
                    onSaved: (value) {
                      _date = TemporalDate.now();
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Notes',
                    ),
                    onSaved: (value) {
                      _notes = value!;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Spend',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um gasto';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _spend = double.parse(value!);
                    },
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          savePost();
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
