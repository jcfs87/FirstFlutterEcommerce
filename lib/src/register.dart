import 'package:flutter/material.dart';
import '../models/Cliente.dart';

class Register extends StatefulWidget {
  final ClienteManager clienteManager;
  const Register({Key? key, required this.clienteManager}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email = "";
  String password = "";
  String name = "";


  void _register() {
    final cliente = Cliente(
      name: name,
      email: email,
      password: password,
    );

   widget.clienteManager.registrarCliente(cliente);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Cliente registrado'),
          content: Text('El cliente se registró exitosamente.'),
          actions: <Widget>[
            TextButton(
              child: Text('Aceptar'),
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 70.0),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                child: Image.network(
                  'https://tse2.mm.bing.net/th?id=OIP.RYsKHqksC3450NQnxSYt-wHaFP&pid=Api&P=0&h=180',
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Text(
                    'Te damos la bienvenida!',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Name',
                  labelText: 'Name',
                ),
                onChanged: (valor) {
                  setState(() {
                    name = valor;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  suffixIcon: Icon(Icons.alternate_email),
                ),
                onChanged: (valor) {
                  setState(() {
                    email = valor;
                  });
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                enableInteractiveSelection: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  suffixIcon: Icon(Icons.lock_outline),
                ),
                onChanged: (valor) {
                  setState(() {
                    password = valor;
                  });
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor:
                    MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: _register,
                  child: Text('Register'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

