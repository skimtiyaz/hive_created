import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'models/contact.dart';

class NewContactForm extends StatefulWidget {
  @override
  _NewContactFormState createState() => _NewContactFormState();
}

class _NewContactFormState extends State<NewContactForm> {
  final _formkey = GlobalKey<FormState>();

  String _name = " ";
  String _age = " ";

  void addContact(Contact contact) {
    final contactBox = Hive.box('contacts');
    contactBox.add(contact);
    // print('Name: ${contact.name}, Age: ${contact.age}');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  onSaved: (value) => _name = value,
                )),
                SizedBox(width: 20),
                Expanded(
                    child: TextFormField(
                  decoration: InputDecoration(labelText: 'Age'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _name = value,
                )),
              ],
            ),
          ),
          ElevatedButton(
            child: Text('Add New Contact'),
            onPressed: () {
              _formkey.currentState.save();
              final newContact = Contact(_name, int.parse(_age));
              addContact(newContact);
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
