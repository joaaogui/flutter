import 'package:flutter/material.dart';
import 'dart:developer';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.red),
      debugShowCheckedModeBanner: false,

      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
 final List<CheckBoxModel> itens = [
    CheckBoxModel(text: "Matheus"),
    CheckBoxModel(text: "Renato"),
    CheckBoxModel(text: "Julio"),
    CheckBoxModel(text: "Miguel"),
    CheckBoxModel(text: "Murilo"),
    CheckBoxModel(text: "Leticia"),
    CheckBoxModel(text: "Nadir"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: itens.length,
        itemBuilder: (_, int index){
          return CheckboxWidget(item: itens[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          List<CheckBoxModel> itensMarcados = List.from(itens.where((item) => item.checked));
          log('data: item');

          itensMarcados.forEach((item){
            log('data: item');

            print(item.text);
            Navigator.of(context).pop(); // dismiss dialog

          });

          showAlertDialog(context);
          },
        child: Icon(Icons.apps),
      ),
    );
  }
}
showAlertDialog(BuildContext context) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop(); // dismiss dialog

    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("My title"),
    content: Text("This is my message."),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class CheckBoxModel{

  String text;
  bool checked;
  CheckBoxModel({required this.text, this.checked = false});

}

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({ Key? key, required this.item }) : super(key: key);

  final CheckBoxModel item;

  @override
  _CheckboxWidgetState createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.item.text),
      value: widget.item.checked,
      onChanged: (bool? value){
        setState((){
          widget.item.checked = value ?? false;
          showAlertDialog(context);

        });
      },
    );
  }
}