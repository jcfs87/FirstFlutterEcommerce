import 'package:flutter/material.dart';
import '../models/Cliente.dart';


class Login extends StatefulWidget {
  final ClienteManager clienteManager;
  const Login({Key? key, required this.clienteManager}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String password = "";
  Cliente? clienteActual;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: 30.0, vertical: 70.0
        ),
        children: <Widget> [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Card(

                child: Image.network(
                    'https://tse2.mm.bing.net/th?id=OIP.RYsKHqksC3450NQnxSYt-wHaFP&pid=Api&P=0&h=180',
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.cover
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Text('Hola de nuevo!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',suffixIcon: Icon(Icons.alternate_email),
                ),
                onChanged: (valor){
                  email = valor;
                  print('el email es: $email');
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
                  labelText: 'Password',suffixIcon: Icon(Icons.lock_outline),
                ),
                onChanged: (valor){
                  password = valor;
                  print('el pasword es: $password');

                },
              ),
              SizedBox(
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {

                    if (email.isEmpty || password.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text('El email y la contraseña no pueden estar vacíos.'),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Aceptar'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } else if(widget.clienteManager.validarCliente(email, password)) {
                      clienteActual = widget.clienteManager.clientes.firstWhere((cliente) => cliente.email == email && cliente.password == password);
                      print('el cliente es loginview:...........'+clienteActual!.email);
                      Navigator.pushNamed(context, 'principal_view', arguments: clienteActual);
                    } else{
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text('Revisar su email y password'),
                              actions: <Widget>[
                                TextButton(
                                child: Text('Aceptar'),
                                    onPressed: () {
                            Navigator.of(context).pop();
                                 },
                                ),
                              ],
                            );
                           }
                          );
                       }
                  },
                  child: Text('Login'),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:<Widget> [
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () { Navigator.pushNamed(context, 'register'); },
                    child: Text('Register'),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {  },
                    child: Text('Forgot Password'),
                  ),
                ],
              )

            ],
          )
        ],
      ),
    );
  }
}
