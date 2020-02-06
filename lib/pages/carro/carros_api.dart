import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class TipoCarros {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";

}

class CarrosApi {


  static Future<List<Carro>> getCarros(String tipo) async {

    Usuario user = await Usuario.get();

    var url = 'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo';

    Map<String,String> headers = {"Content-Type" : "application/json","Authorization" : "Bearer ${user.token}"};


    var response = await http.get(url,headers: headers);
    
    List list = convert.json.decode(response.body);

    final carros = list.map<Carro>((map) => Carro.fromJson(map)).toList();
    return carros;
  }
}