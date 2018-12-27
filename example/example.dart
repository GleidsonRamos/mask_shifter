import 'package:flutter/material.dart';
//Componentes
import 'package:mask_shifter/mask_shifter.dart';

class UsersData extends StatefulWidget {
  UsersData({Key key}) : super(key: key);

  @override
  _UsersData createState() => _UsersData();
}

class _UsersData extends State<UsersData> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                //HERE IS HOW USE THE LIBRARY
                inputFormatters: [
                  MaskedTextInputFormatterShifter(
                      maskONE: "XXX.XXX.XXX-XX", maskTWO: "XX.XXX.XXX/XXXX-XX"),
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "CPF/CNPJ MASK",
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
