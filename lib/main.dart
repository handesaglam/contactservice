import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Iterable<Contact> _contacts;
  GlobalKey<State> _counterState;


  void dene23() async {




    await Future.delayed(Duration(milliseconds: 1500));

    PermissionStatus permission = await Permission.contacts.status;

    if (permission != PermissionStatus.granted) {
      await Permission.contacts.request();
      PermissionStatus permission = await Permission.contacts.status;

      if (permission == PermissionStatus.granted) {
        print("saving");
        Contact newContact = new Contact();

        newContact.givenName =
        "sssssss";
        newContact.emails = [
          Item(label: "email", value: "aaaa")
        ];
        newContact.company = "saglam";
        newContact.phones =
        [
          Item(label: "mobile", value: "aaaaaaa")
        ];
        newContact.postalAddresses = [
          PostalAddress(region: "")
        ];
        await ContactsService.addContact(newContact);
        dene22();
      }

    }else{

      print("saving");
      Contact newContact = new Contact();
      newContact.givenName =
         "sss";
      newContact.emails = [
        Item(label: "email", value: "aaa")
      ];
      newContact.company = "gggg";
      newContact.phones = [
        Item(label: "mobile", value: "öööö")
      ];
      newContact.postalAddresses = [
        PostalAddress(region: "")
      ];
      await ContactsService.addContact(newContact);

dene22();


    }
  }




  void dene22(){

    print("hande");

dene();


  }


  void dene() async {
    Contact newContact = new Contact();
    PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted) {
      await Permission.contacts.request();
      PermissionStatus permission = await Permission.contacts.status;

      final Iterable<Contact> contacts = await ContactsService.getContacts();

      setState(() {
        _contacts = contacts;
      });

      print(_contacts.length);
      Dialogs.showLoadingDialog(context, "sssss");

      if (_contacts.length == 54) {
        print("aa");
      } else {
        print("bbbb");
      }
    } else {
      final Iterable<Contact> contacts = await ContactsService.getContacts();

      setState(() {
        _contacts = contacts;
      });

      print(_contacts.length);


      Dialogs.showLoadingDialog(context, "sssss");

      if (_contacts.length > 54) {
        Dialogs1.showLoadingDialog(context, "sssss");
      } else {
        print("bbbb");
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
          child: Text('Current counter is $_counter')
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
    dene23();
        },
        child: Icon(Icons.add),
      ),
    );
  }


}



class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, String key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(

                  backgroundColor: Colors.lightBlue,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Please Wait....",style: TextStyle(color: Colors.amber),)
                      ]),
                    )
                  ]));
        });
  }
}


class Dialogs1 {
  static Future<void> showLoadingDialog(
      BuildContext context, String key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(

                  backgroundColor: Colors.lightBlue,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Please Wait....",style: TextStyle(color: Colors.black38),)
                      ]),
                    )
                  ]));
        });
  }
}

