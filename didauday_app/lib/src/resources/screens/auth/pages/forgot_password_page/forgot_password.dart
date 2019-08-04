import 'package:didauday_app/src/resources/screens/auth/blocs/forgot_password_bloc.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailController = TextEditingController();
  ForgotPasswordBloc _forgotPasswordBloc = ForgotPasswordBloc();


  void _onReset() {

    var email = _emailController.text;
    print('aaa');
    if (_forgotPasswordBloc.isValidDataReset(email)) {
      print('oke');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot password'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,),
                child: StreamBuilder<Object>(
                  stream: _forgotPasswordBloc.emailStream,
                  builder: (context, snapshot) {
                    return TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        errorText: snapshot.hasError ? snapshot.error : null,
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(
                            Icons.email,
                          )
                      ),
                    );
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10,),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Color(0xfffd5739),
                    onPressed: _onReset,
                    child: Text(
                      'Reset password',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _forgotPasswordBloc.dispose();
    super.dispose();
  }
}
