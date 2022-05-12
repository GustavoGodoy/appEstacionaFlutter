import 'package:flutter/material.dart';
import 'package:gustavogodoyapp/components/gustavoCard.dart';
import 'package:gustavogodoyapp/components/gustavoForm.dart';

import 'model/carroModel.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListPageStage();
  }
}

class ListPageStage extends State<ListPage> {
  List<Car> carList = [];
  FocusNode placaCar = FocusNode();
  FocusNode modeloCar = FocusNode();
  TextEditingController placaController = TextEditingController();
  TextEditingController modeloController = TextEditingController();

  addCar({
    required String modeloCar,
    required String placaCar,
  }) {
    setState(
      () {
        carList.insert(
          0,
          Car(
            modelo: modeloCar,
            placa: placaCar,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addCar(
              modeloCar: modeloController.text, placaCar: placaController.text);
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 45,
            right: 45,
            top: 100,
          ),
          child: Column(
            children: [
              GustavoForm(
                  label: 'Digite o modelo do carro!',
                  focusNode: modeloCar,
                  userInputController: modeloController,
                  onEditingComplete: () {
                    modeloCar.nextFocus();
                  }),
              const SizedBox(
                height: 15,
              ),
              GustavoForm(
                label: 'Digite a placa do carro!',
                focusNode: placaCar,
                userInputController: placaController,
              ),
              const SizedBox(
                height: 40,
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: carList.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 15,
                ),
                itemBuilder: (context, index) {
                  var cars = carList[index];
                  return GustavoCard(
                      leftText: cars.modelo, rightText: cars.placa);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
