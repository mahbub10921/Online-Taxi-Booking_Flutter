import 'package:first_flutter_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyWidget22 extends StatefulWidget {
  const MyWidget22({super.key});

  @override
  State<MyWidget22> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget22> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register Here'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SignUpForm(),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _passkey = GlobalKey<FormFieldState>();
  String _name = '';
  String _email = '';
  int _age = -1;
  String _maritalStatus = 'single';
  int _selectedGender = 0;
  String _password = '';
  bool _termChecked = true;
  List<DropdownMenuItem<int>> genderList = [];
  void loadGenderList() {
    genderList = [];
    genderList.add(const DropdownMenuItem(
      child: Text('Male'),
      value: 0,
    ));
    genderList.add(const DropdownMenuItem(
      child: Text('Female'),
      value: 1,
    ));
    genderList.add(const DropdownMenuItem(
      child: Text('Others'),
      value: 2,
    ));
  }

  @override
  Widget build(BuildContext context) {
    loadGenderList();
    return Form(
      child: ListView(
        children: getFormWidget(),
      ),
    );
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = [];
    formWidget.add(TextFormField(
      decoration:
          const InputDecoration(labelText: 'enter name', hintText: 'name'),
      validator: (value) {
        if (value!.isEmpty) {
          return 'please enter a name';
        } else {
          return null;
        }
      },
      onChanged: (value) {
        // setState(() {
        //   _name = value.toString();
        // });
        _name = value.toString();
      },
    ));

    formWidget.add(TextFormField(
      decoration:
          const InputDecoration(labelText: 'enter mail', hintText: 'email'),
      keyboardType: TextInputType.emailAddress,
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return 'please enter a name';
      //   } else {
      //     return null;
      //   }
      // },
      onChanged: (value) {
        // setState(() {
        //   _email = value.toString();
        // });
        _email = value.toString();
      },
    ));

    formWidget.add(TextFormField(
      decoration:
          const InputDecoration(hintText: 'Age', labelText: 'Enter Age'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Enter age';
        } else {
          return null;
        }
      },
      onChanged: (value) {
        // setState(() {
        //   _age = int.parse(value.toString());
        // });
        _age = int.parse(value.toString());
      },
    ));

    formWidget.add(DropdownButton(
        hint: const Text('Select Gender'),
        items: genderList,
        value: _selectedGender,
        onChanged: (value) {
          setState(() {
            _selectedGender = int.parse(value.toString());
          });
        }));

    formWidget.add(Column(
      children: <Widget>[
        RadioListTile<String>(
          title: Text('Married'),
          value: 'single',
          groupValue: _maritalStatus,
          onChanged: (value) {
            setState(() {
              _maritalStatus = value.toString();
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('Married'),
          value: 'married',
          groupValue: _maritalStatus,
          onChanged: (value) {
            setState(() {
              _maritalStatus = value.toString();
            });
          },
        ),
      ],
    ));

    formWidget.add(
      TextFormField(
          key: _passkey,
          obscureText: true,
          decoration: const InputDecoration(
              hintText: 'Password', labelText: 'Enter Password'),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Enter password';
            } else if (value.length < 8) {
              return 'Password should be more than 8 characters';
            } else {
              return null;
            }
          }),
    );
    formWidget.add(
      TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              hintText: 'Confirm Password',
              labelText: 'Enter Confirm Password'),
          validator: (confirmPassword) {
            if (confirmPassword != null && confirmPassword.isEmpty) {
              return 'Enter confirm password';
            }
            var password = _passkey.currentState?.value;
            if (confirmPassword != null &&
                confirmPassword.compareTo(password) != 0) {
              return 'Password mismatch';
            } else {
              return null;
            }
          },
          onChanged: (value) {
            setState(() {
              _password = value.toString();
            });
          }),
    );

    formWidget.add(CheckboxListTile(
      value: _termChecked,
      onChanged: (value) {
        setState(() {
          _termChecked = value.toString().toLowerCase() == 'true';
        });
      },
      subtitle: !_termChecked
          ? const Text(
              'Required',
              style: TextStyle(color: Colors.red, fontSize: 12.0),
            )
          : null,
      title: const Text(
        'I agree to the terms and condition',
      ),
      controlAffinity: ListTileControlAffinity.leading,
    ));
    Future<void> onPressedSubmit() async {
      // if (_formKey.currentState!.validate() && _termsChecked) {
      //   _formKey.currentState?.save();

      // Product product = new Product();

      // product.name = _name;
      // product.email = _email;
      // product.price = _age.toString();
      // product.quantity = _password;

      // (await ProductApiService().createProduct(product));
      // // print("Delete Call!");

      print("Name " + _name);
      print("Email " + _email);
      print("Age " + _age.toString());
      switch (_selectedGender) {
        case 0:
          print("Gender Male");
          break;
        case 1:
          print("Gender Female");
          break;
        case 3:
          print("Gender Others");
          break;
      }
      print("Marital Status " + _maritalStatus);
      print("Password " + _password);
      print("Termschecked " + _termChecked.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Form Submitted')));

      // Navigator.pushAndRemoveUntil<dynamic>(
      //   context,
      //   MaterialPageRoute<dynamic>(
      //     builder: (BuildContext context) => MyLogin(),
      //   ),
      //   (route) => false,
      // );
      // }
    }

    formWidget.add(ElevatedButton(
        child: const Text('Sign Up'), onPressed: onPressedSubmit));

    formWidget.add(ElevatedButton(
        child: const Text('Home'),
        onPressed: () {
          // Navigator.pushAndRemoveUntil<dynamic>(
          //   context,
          //   MaterialPageRoute<dynamic>(
          //     builder: (BuildContext context) => MyLogin(),
          //   ),
          //   (route) => false,
          // );
        }));

    return formWidget;
  }
}
