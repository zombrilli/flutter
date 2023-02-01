import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  String infoText = '';

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String errorTextWeight = '';
  String errorTextHeight = 'informe uma altura válido';

  void calcImc() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = weight / (height * height);

    if (imc < 18.6) {
      infoText = 'Abaixo do peso,  IMC: ${imc.toStringAsPrecision(4)}';
    } else if (imc >= 18.6 && imc < 24.9) {
      infoText = 'Peso ideal,  IMC: ${imc.toStringAsPrecision(4)}';
    } else if (imc >= 24.9 && imc < 29.9) {
      infoText = 'Levemente acima do peso,  IMC: ${imc.toStringAsPrecision(4)}';
    } else if (imc >= 29.9 && imc < 34.9) {
      infoText = 'Obesidade grau I,  IMC: ${imc.toStringAsPrecision(4)}';
    } else if (imc >= 34.9 && imc < 39.9) {
      infoText = 'Obesidade grau II,  IMC: ${imc.toStringAsPrecision(4)}';
    } else if (imc >= 40) {
      infoText = 'Obesidade grau III,  IMC: ${imc.toStringAsPrecision(4)}';
    }

    setState(() {
      infoText;
    });
  }

  void _resetFields() {
    setState(() {
      weightController.text = '';
      heightController.text = '';
      infoText = '';
      formKey = GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora de IMC'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      errorTextWeight = 'informe um peso válido';
                      return errorTextWeight;
                    }
                  },
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Peso (kg)',
                    labelStyle: TextStyle(color: Colors.blue),
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.blue, fontSize: 25.0),
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      errorTextHeight = 'informe uma altura válida';
                      return errorTextHeight;
                    }
                  },
                  controller: heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Altura (cm)',
                    labelStyle: TextStyle(color: Colors.blue),
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.blue, fontSize: 25.0),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: SizedBox(
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          calcImc();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      child: const Text(
                        'Calcular',
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                      ),
                    ),
                  ),
                ),
                Text(
                  infoText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.blue, fontSize: 25.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
