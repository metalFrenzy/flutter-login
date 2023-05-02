import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './text_form_field_wrapper.dart';
import '../providers/auth_provider.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  var _isLogin = true;
  final _form = GlobalKey<FormState>();
  var _email = '';
  var _password = '';
  var _number = '';
  var _natonalId = '';
  var _name = '';

  void _submit() {
    final isValid = _form.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _form.currentState!.save();
      Provider.of<AuthProvider>(context, listen: false).submit(
        _email.trim(),
        _password.trim(),
        _number.trim(),
        _name.trim(),
        _natonalId.trim(),
        context,
        _isLogin,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 139, 132, 233),
              Color.fromARGB(255, 144, 110, 237),
              Color.fromARGB(255, 53, 222, 244),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: const Image(
                  height: 275,
                  width: 275,
                  image: AssetImage(
                    'assets/images/logo1.png',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _form,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormFieldWrapper(
                        child: TextFormField(
                          key: ValueKey('email'),
                          onSaved: (newValue) {
                            _email = newValue!;
                          },
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email address',
                            hintStyle: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      ),
                      TextFormFieldWrapper(
                        child: TextFormField(
                          key: ValueKey('password'),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 7) {
                              return 'Password should be at least 7 characters';
                            }
                            return null;
                          },
                          obscureText: true,
                          onSaved: (newValue) {
                            _password = newValue!;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            hintStyle: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      ),
                      if (!_isLogin)
                        TextFormFieldWrapper(
                          child: TextFormField(
                            onSaved: (newValue) {
                              _number = newValue!;
                            },
                            key: ValueKey('number'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter a valid number ';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: ' Phone Number',
                              hintStyle: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ),
                      if (!_isLogin)
                        TextFormFieldWrapper(
                          child: TextFormField(
                            onSaved: (newValue) {
                              _name = newValue!;
                            },
                            key: ValueKey('name'),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Name',
                              hintStyle: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ),
                      if (!_isLogin)
                        TextFormFieldWrapper(
                          child: TextFormField(
                            onSaved: (newValue) {
                              _natonalId = newValue!;
                            },
                            key: ValueKey('id'),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter a valid national id';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'National ID',
                              hintStyle: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onPressed: _submit,
                        child: Text(
                          _isLogin ? 'Login' : 'signUp',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Text(
                          _isLogin
                              ? 'Create new account'
                              : 'Already have an account',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
