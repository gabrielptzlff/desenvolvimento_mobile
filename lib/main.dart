import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AccessForm(),
    );
  }
}

class AccessForm extends StatefulWidget {
  @override
  _AccessFormState createState() => _AccessFormState();
}

class _AccessFormState extends State<AccessForm> {
  // Controladores para os campos de texto
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String selectedAccessType = 'Acesso Normal';

  // Opções de tipo de acesso
  List<String> accessTypes = [
    'Acesso Normal',
    'Acesso Premium',
    'Acesso de Administrador'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Acesso'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Nome:'),
            TextFormField(
              controller: nameController,
            ),
            SizedBox(height: 20.0),
            Text('Email:'),
            TextFormField(
              controller: emailController,
            ),
            SizedBox(height: 20.0),
            Text('Tipo de Acesso:'),
            DropdownButton(
              value: selectedAccessType,
              onChanged: (newValue) {
                setState(() {
                  selectedAccessType = newValue.toString();
                });
              },
              items: accessTypes.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Aqui você pode acessar os valores inseridos pelo usuário:
                final name = nameController.text;
                final email = emailController.text;

                // Faça o que desejar com os valores, por exemplo, exiba-os em um diálogo:
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Valores inseridos:'),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Nome: $name'),
                          Text('Email: $email'),
                          Text('Tipo de Acesso: $selectedAccessType'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Fechar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
