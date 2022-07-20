import 'package:flutter/material.dart';

import 'contact.dart';

class NewContactForm extends StatefulWidget {
  @override
  _NewContactFormState createState() => _NewContactFormState();
}

class _NewContactFormState extends State<NewContactForm> {
  final _formKey = GlobalKey<FormState>();

  late String _name;
  late String _phone;

  void addContact(Contact contact) {
    print('Name: ${contact.name}, Age: ${contact.phone}');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  onSaved: (value) => _name = value!,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(labelText: 'Phone number'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) => _phone = value!,
                ),
              ),
            ],
          ),
          ElevatedButton(
            child: const Text('Add New Contact'),
            onPressed: () {
              _formKey.currentState!.save();
              final newContact = Contact(_name, int.parse(_phone));
              addContact(newContact);
            },
          ),
        ],
      ),
    );
  }
}
