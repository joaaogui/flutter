import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  final List<CheckBoxModel> itens = [
    CheckBoxModel(text: "Matheus"),
    CheckBoxModel(text: "Renato"),
    CheckBoxModel(text: "Julio"),
    CheckBoxModel(text: "Miguel"),
    CheckBoxModel(text: "Murilo"),
    CheckBoxModel(text: "Leticia"),
    CheckBoxModel(text: "Nadir"),
  ];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
          backgroundColor: CupertinoColors.white,
          activeColor: CupertinoColors.darkBackgroundGray,
          items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.airplane)),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.clock)),
          ]),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return Scaffold(
              backgroundColor: CupertinoColors.white,
              body: SafeArea(
                child: Padding(
                  padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',
                            labelText: 'Enter your username',
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter a search term',
                            labelText: 'Enter your username',
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Submit'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          case 1:
            return Text('.text');
          case 2:
          default:
            return Text('widget.item.text');
        }
      });
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

class CheckBoxModel {
  String text;
  bool checked;

  CheckBoxModel({required this.text, this.checked = false});
}

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({Key? key, required this.item}) : super(key: key);

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
      onChanged: (bool? value) {
        setState(() {
          widget.item.checked = value ?? false;
          showAlertDialog(context);
        });
      },
    );
  }
}
