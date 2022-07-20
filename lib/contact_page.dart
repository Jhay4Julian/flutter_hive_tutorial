import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'contact.dart';
import 'new_contact_form.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hive Demo'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(child: _buildListView()),
            NewContactForm(),
          ],
        ));
  }

  ListView _buildListView() {
    final contactsBox = Hive.box('contacts');
    return ListView.builder(
      itemCount: contactsBox.length,
      itemBuilder: (BuildContext context, int index) {
        final contact = contactsBox.get(index) as Contact;

        return ListTile(
          title: Text(contact.name),
          subtitle: Text(contact.phone.toString()),
        );
      },
    );
  }
}
