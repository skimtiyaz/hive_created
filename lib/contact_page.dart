import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_created_1/models/contact.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'new_contact_form.dart';

class ContactPage extends StatelessWidget {
  ContactPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text('Hive Tutorial')),
      body: Column(children: <Widget>[
        Expanded(child: _buildListView()),
        NewContactForm(),
      ]));

  Widget _buildListView() => WatchBoxBuilder(
      box: Hive.box('contacts'),
      builder: (context, contactBox) => ListView.builder(
          itemCount: contactBox.length,
          itemBuilder: (context, index) {
            final contact = contactBox.getAt(index) as Contact;
            return ListTile(
                title: Text(contact.name),
                subtitle: Text(contact.age.toString()));
          }));
}
