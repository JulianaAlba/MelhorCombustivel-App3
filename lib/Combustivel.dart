import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Combustivel extends StatefulWidget {
  @override
  _CombustivelState createState() => _CombustivelState();
}



class _CombustivelState extends State<Combustivel> {
  TextEditingController _textEditingControllerAlcool = TextEditingController();
  TextEditingController _textEditingControllerGasolina = TextEditingController();
  String _textoResultado = "";
  String menorValor = "";


  /*void limparCampos(){
    _textEditingControllerAlcool.text="";
    _textEditingControllerGasolina.text="";

  }*/



  void _calcular(){
    double precoAlcool = double.tryParse(_textEditingControllerAlcool.text);
    double precoGasolina = double.tryParse(_textEditingControllerGasolina.text);

    if (precoGasolina == null || precoAlcool == null){
      //print("Preço gasolina NULO ${precoGasolina} - Preço álcool NULO ${precoAlcool}");
      //print("Número inválido. Insira o valor, conforme o exemplo!");
      setState(() {
        _textoResultado = "Número inválido. Insira um valor positivo e com (.), conforme o exemplo!";
      });

    }
    else{
      //print("Preço gasolina ${precoGasolina} - Preço alcool ${precoAlcool}");
      //print("Número válido. calculando...");

      if (precoAlcool/precoGasolina < 0.7){
        menorValor = "No momento, o Álcool é o combustível mais adequado, para o abastecimento!";
      }
      else if (precoAlcool/precoGasolina >= 0.7){
        menorValor = "No momento, a Gasolina é o combustível mais adequado, para o abastecimento!";
      }
      else{
        menorValor = "No momento, tanto faz a escolha, pois o benefício é o mesmo!";
      }

      setState(() {
        _textoResultado = menorValor;
      });

    }

//    limparCampos();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Combustível"),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),

          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: <Widget>[

              Image.asset(
                "imagens/combustivel.png",
                //height: 200,
                //descobrir pq a imagem não modifica dentro de Scaffold
                //fit: BoxFit.cover,
              ),

              Text("Saiba qual é o melhor combustível, para o abastecimento do seu veículo.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),

                child: TextField(
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(
                    labelText: "Insira o valor do Álcool (Ex: 1.59)",
                  ),

                  //habilitar ou desabilitar campo de TextField
                  enabled: true,
                  //número máximo de caracteres, porém permite que a digitação continue no TextField
                  //maxLength: 11,
                  //como verdadeira, impede que seja digitado mais caracteres do que o definido anteriormente, ideal para cpf, tel
                  //maxLengthEnforced: true,

                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey,
                  ),

                  //verdadeiro oculta o valor inserido, ideal para senhas
                  //obscureText: true,

                  //captura o que foi capturado, a cada caracter, sempre que muda o valor
                  /*onChanged: (String texto){
                      print("valor teste ${texto}");
                    },*/

                  //captura o que foi capturado, porém, apenas quando o usuário confirma a finalização da digitação, mas envia tudo de uma vez, quando envia
                  /*onSubmitted: (String texto){
                    print("valor teste ${texto}");
                  },*/

                  controller: _textEditingControllerAlcool,

                ),

              ),

              Padding(
                padding: EdgeInsets.fromLTRB(40, 10, 40, 10),


                child: TextField(
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(
                    labelText: "Insira o valor da Gasolina (Ex: 2.99)",
                  ),

                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey,
                  ),

                  controller: _textEditingControllerGasolina,

                ),

              ),

              RaisedButton(
                child: Text("Comparar",
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                color: Colors.blueGrey,
                onPressed: _calcular,

                /*onPressed: (){
                  print("Valor Alcool ${_textEditingControllerAlcool.text}");
                  print("Valor Gasolina ${_textEditingControllerGasolina.text}");
                },*/

              ),

              Text(_textoResultado,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),

            ],
          ),

        ),

      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        child: Padding(
          //esse valor define o tamanho da barra inferior
          padding: EdgeInsets.all(20),

        ),
      ),


    );


  }
}
