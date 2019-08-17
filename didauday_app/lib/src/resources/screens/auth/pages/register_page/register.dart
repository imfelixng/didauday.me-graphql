import 'package:didauday_app/src/resources/screens/auth/blocs/register_bloc.dart';
import 'package:didauday_app/src/resources/widgets/dialog/loading_dialog.dart';
import 'package:didauday_app/src/resources/widgets/dialog/message_dialog.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  RegisterBloc registerBloc = RegisterBloc();


  void _onRegister() async {
    var email = _emailController.text;
    var password = _passwordController.text;
    var confirmPassword = _confirmPasswordController.text;

    if (registerBloc.isValidDataRegister(email, password, confirmPassword)) {
      LoadingDialog.showLoadingDialog(context, "Signing up. Please wait...");
      var userInfo;
      try{
        userInfo = await registerBloc.onRegister(email, password);
        LoadingDialog.hideLoadingDialog(context);
        MessageDialog.showMsgDialog(context, "Register", "Please check your email inbox to verify this account.");
        Navigator.pushNamed(context, '/auth/login');
      } catch(error) {
        LoadingDialog.hideLoadingDialog(context);
        MessageDialog.showMsgDialog(context, "Register", error);
      }
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(
            20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: StreamBuilder<Object>(
                      stream: registerBloc.emailStream,
                      builder: (context, snapshot) {
                        return TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              labelText: 'Email',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.email,
                              )),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: StreamBuilder<Object>(
                      stream: registerBloc.passwordStream,
                      builder: (context, snapshot) {
                        return TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              errorText:
                                  snapshot.hasError ? snapshot.error : null,
                              labelText: 'Password',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.lock,
                              )),
                        );
                      }),
                ),
                StreamBuilder<Object>(
                  stream: registerBloc.confirmPasswordStream,
                  builder: (context, snapshot) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: TextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            errorText:
                            snapshot.hasError ? snapshot.error : null,
                            labelText: 'Confirm Password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.lock,
                            )),
                      ),
                    );
                  }
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                      color: Color(0xfffd5739),
                      onPressed: _onRegister,
                      child: Text(
                        'Register',
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
      ),
    );
  }

  @override
  void dispose() {
    registerBloc.dispose();
    super.dispose();
  }

}
