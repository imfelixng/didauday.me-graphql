import 'package:didauday_app/src/resources/screens/auth/blocs/login_bloc.dart';
import 'package:didauday_app/src/resources/widgets/dialog/loading_dialog.dart';
import 'package:didauday_app/src/resources/widgets/dialog/message_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc = LoginBloc();

  void _onLogin() async {
    var email = _emailController.text;
    var password = _passwordController.text;
    if (_loginBloc.isValidDataLogin(email, password)) {
      LoadingDialog.showLoadingDialog(context, "Logging in. Please wait...");
      var userInfo;
      try{
        userInfo = await _loginBloc.onLogin(email, password);
        LoadingDialog.hideLoadingDialog(context);
        Navigator.pushNamedAndRemoveUntil(context, '/home', ( _ ) => false);
      } catch(error) {
        LoadingDialog.hideLoadingDialog(context);
        MessageDialog.showMsgDialog(context, "Login", error);
      }
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,),
                  child: StreamBuilder<Object>(
                    stream: _loginBloc.emailStream,
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
                  padding: const EdgeInsets.symmetric(vertical:10,),
                  child: StreamBuilder<Object>(
                    stream: _loginBloc.passwordStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            errorText: snapshot.hasError ? snapshot.error : null,
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.lock,
                            )
                        ),
                      );
                    }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/auth/forgot_password');
                        },
                        child: Text(
                            'Forgot password',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 16,
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10,),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                      color: Color(0xfffd5739),
                      onPressed: _onLogin,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'or',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10,),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                      color: Color(0xfffd5739),
                      onPressed: (){},
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.google,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            'Login with Google',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10,),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: RaisedButton(
                      color: Color(0xff3a5a99),
                      onPressed: () {

                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            FontAwesomeIcons.facebookF,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Text(
                            'Login with Facebook',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10,),
                  child: Row(
                    children: <Widget>[
                      Text(
                          'You don\'t have account?  ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/auth/register');
                        },
                        child: Text(
                            'Create new account',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                              ),
                        ),
                      ),
                    ],
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
    _loginBloc.dispose();
    super.dispose();
  }

}
