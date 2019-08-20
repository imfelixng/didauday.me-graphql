import 'package:didauday_app/src/ui/views/auth/blocs/forgot_password_bloc.dart';
import 'package:didauday_app/src/ui/widgets/dialog/loading_dialog.dart';
import 'package:didauday_app/src/ui/widgets/dialog/message_dialog.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _emailController = TextEditingController();
  ForgotPasswordBloc _forgotPasswordBloc = ForgotPasswordBloc();


  void _onReset() async {

    var email = _emailController.text;
    if (_forgotPasswordBloc.isValidDataReset(email)) {
      LoadingDialog.showLoadingDialog(context, 'Reseting password. Please wait ...');
      try{
        await _forgotPasswordBloc.onResetPassword(email);
        LoadingDialog.hideLoadingDialog(context);
        _emailController.text = "";
        MessageDialog.showMsgDialog(context, "Success", 'Please check your email to reset pasword.');
      } catch(error) {
        print(error);
        LoadingDialog.hideLoadingDialog(context);
        MessageDialog.showMsgDialog(context, "Reset Password", error);
      }
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
