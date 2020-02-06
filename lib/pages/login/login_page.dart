import 'dart:convert';

import 'package:carros/pages/api_response.dart';
import 'package:carros/pages/carro/home_page.dart';
import 'package:carros/pages/login/login_api.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:carros/utils/alert.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _tLogin = TextEditingController();

  final _tSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _focusSenha = FocusNode();

  bool _showProgress = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future<Usuario> future = Usuario.get();

    setState(() {
//      future.then((Usuario user) =>  user != null ? _tLogin.text = user.login : _tLogin.text = "");
      future.then((Usuario user) {
        if (user != null) {
          _tLogin.text = user.login;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Olá Flutter!"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        child: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              AppText(
                "Login",
                "Digite seu login",
                controller: _tLogin,
                validator: (text) => validate(text, "Informe o login!"),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                nextFocus: _focusSenha,
              ),
              SizedBox(
                height: 16,
              ),
              AppText(
                "Senha",
                "Digite sua senha",
                password: true,
                controller: _tSenha,
                validator: (text) => validate(text, "Informe a senha!"),
                keyboardType: TextInputType.number,
                focusNode: _focusSenha,
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 46,
                child: AppButton("login",
                    onPressed: _onClickLogin, showProgress: _showProgress),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onClickLogin() async {
    _tLogin.text = "user";
    _tSenha.text = "123";

    bool formOk = _formKey.currentState.validate();
    if (!formOk) {
      return;
    }

    String login = _tLogin.text;
    String senha = _tSenha.text;

    setState(() {
      _showProgress = true;
    });

    ApiResponse response = await LoginApi.login(login, senha);

    if (response.ok) {
      Usuario user = response.result;
      push(context, HomePage());

      print(" >>> $user");
    } else {
      alert(context, response.msg);
    }
    setState(() {
      _showProgress = false;
    });

    print("Login: $login, Senha $senha");
  }

  validate(String text, String msg) {
    if (text.isEmpty) {
      return msg;
    }
    return null;
  }
}
