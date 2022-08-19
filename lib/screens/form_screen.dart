import 'package:electronicss_shop/screens/constant.dart';
import 'package:electronicss_shop/screens/home_screen.dart';
import 'package:electronicss_shop/screens/rounded_button.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  static const id = "formscreen";
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  String? _name;
  String? _billingAddress;
  String? _deliveryAddress;
  String? _phoneNumber;
  String? _currentDate;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: kTextFieldDecoration.copyWith(
          labelText: 'Name', hintText: 'enter you name'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is require';
        }
      },
      onSaved: (String? value) {
        _name == value;
      },
    );
  }

  Widget _buildBillingAddress() {
    return TextFormField(
      decoration: kTextFieldDecoration.copyWith(
          labelText: 'BillingAddresss', hintText: 'enter billing address'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'BillingAddresss is require';
        }
      },
      onSaved: (String? value) {
        _billingAddress == value;
      },
    );
  }

  Widget _buildDeliveryAddress() {
    return TextFormField(
      decoration: kTextFieldDecoration.copyWith(
          labelText: 'deliveryAddress', hintText: 'enter delivery address'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'DeliveryAddress is required';
        }
      },
      onSaved: (String? value) {
        _deliveryAddress == value;
      },
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      decoration: kTextFieldDecoration.copyWith(
        labelText: 'PhoneNumber',
        hintText: 'enter phone number',
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'PhoneNumber is require';
        }
      },
      onSaved: (String? value) {
        _phoneNumber == value;
      },
    );
  }

  Widget _buildCurrentDate() {
    return TextFormField(
      decoration: kTextFieldDecoration.copyWith(
        labelText: 'CurrentDate',
        hintText: 'enter current date',
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'NameName is require';
        }
      },
      onSaved: (String? value) {
        _currentDate == value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Screen'),
      ),
      body: Container(
        margin: EdgeInsets.all(25),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildName(),
                SizedBox(
                  height: 20,
                ),
                _buildBillingAddress(),
                SizedBox(
                  height: 20,
                ),
                _buildDeliveryAddress(),
                SizedBox(
                  height: 20,
                ),
                _buildPhoneNumber(),
                SizedBox(
                  height: 20,
                ),
                _buildCurrentDate(),
                SizedBox(
                  height: 70,
                ),
                RoundedButton(
                  title: 'submit',
                  colour: Colors.lightBlue,
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    _formKey.currentState?.save();
                    Navigator.pushNamed(context, HomeScreen.id);
                    print(_name);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
