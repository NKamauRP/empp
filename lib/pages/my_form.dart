import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final _question1Controller = TextEditingController();
  final _question2Controller = TextEditingController();
  final _question3Controller = TextEditingController();

  @override
  void dispose() {
    _question1Controller.dispose();
    _question2Controller.dispose();
    _question3Controller.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process data.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 16.0), // Padding for left and right sides
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(
                    vertical: 8.0), // Vertical margin for space between cards
                child: Padding(
                  padding:
                      const EdgeInsets.all(16.0), // Padding inside the card
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Question 1: What is your name?',
                        style: TextStyle(fontSize: 18),
                      ),
                      TextFormField(
                        controller: _question1Controller,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Question 2: What is your email?',
                        style: TextStyle(fontSize: 18),
                      ),
                      TextFormField(
                        controller: _question2Controller,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Question 3: What is your phone number?',
                        style: TextStyle(fontSize: 18),
                      ),
                      TextFormField(
                        controller: _question3Controller,
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (!RegExp(r'^\d+$').hasMatch(value)) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
