import 'package:didauday_app/src/core/services/graphql/config/config.dart';
import 'package:didauday_app/src/core/services/graphql/mutation/mutation_profile.dart';
import 'package:didauday_app/src/ui/views/user/blocs/update_profile_bloc.dart';
import 'package:didauday_app/src/ui/widgets/dialog/loading_dialog.dart';
import 'package:didauday_app/src/ui/widgets/dialog/message_dialog.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final DateFormat format = DateFormat("dd/MM/yyy");

  var _valueGender = 'MALE';
  DateTime _valueBirthday;

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _birthdayController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  UpdateProfileBloc _updateProfileBloc = UpdateProfileBloc();

  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  void _onUpdate() async {
    var firstName = _firstNameController.text;
    var lastName = _lastNameController.text;
    var birthday = _valueBirthday;
    var address = _addressController.text;
    var phoneNumber = _phoneNumberController.text;

    var gender = _valueGender;

    if (_updateProfileBloc.isValidDataUpdate(firstName, lastName, birthday, gender, address, phoneNumber)) {
      LoadingDialog.showLoadingDialog(context, "Updating profile. Please wait...");
      GraphQLClient _client = graphQLConfiguration.clientToQuery();
      QueryResult result;

      int birthday = _valueBirthday.millisecondsSinceEpoch ~/ 1000;

      try {
        result = await _client.mutate(
          MutationOptions(
            document: MutationProfile.updateProfile,
            variables: {
              "input": {
                "firstname": firstName,
                "lastname": lastName,
                "birthday": birthday,
                "address": address,
                "phone_number": phoneNumber,
                "gender": gender
              }
            }
          ),
        );
      } catch(error) {
        LoadingDialog.hideLoadingDialog(context);
        MessageDialog.showMsgDialog(
            context, "Update profile", "You have an occour. Please try again later.");
        return;
      }

      if (!result.hasErrors) {
        var profile = result.data.data["updateProfile"]["user_info"];
        LoadingDialog.hideLoadingDialog(context);
          Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
      } else {
        print(result.errors);
        LoadingDialog.hideLoadingDialog(context);
        MessageDialog.showMsgDialog(
            context, "Update profile", result.errors.toString());
      }
    }

  }

  @override
  Widget build(BuildContext context) {

    Future _selectDate() async {
      DateTime picked = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(1900),
          lastDate: new DateTime(2100)
      );
      if(picked != null) setState(() {
        _birthdayController.text = format.format(picked);
        _valueBirthday = picked;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
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
                      stream: _updateProfileBloc.firstNameStream,
                      builder: (context, snapshot) {
                        return TextField(
                          controller: _firstNameController,
                          decoration: InputDecoration(
                              errorText:
                              snapshot.hasError ? snapshot.error : null,
                              labelText: 'First name',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.person,
                              )),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: StreamBuilder<Object>(
                      stream: _updateProfileBloc.lastNameStream,
                      builder: (context, snapshot) {
                        return TextField(
                          controller: _lastNameController,
                          decoration: InputDecoration(
                              errorText:
                              snapshot.hasError ? snapshot.error : null,
                              labelText: 'Last name',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.person,
                              )),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: StreamBuilder<Object>(
                    stream: _updateProfileBloc.birthdayStream,
                    builder: (context, snapshot) {
                      return TextField(
                        readOnly: true,
                        controller: _birthdayController,
                        decoration: InputDecoration(
                            errorText:
                            snapshot.hasError ? snapshot.error : null,
                            labelText: 'Birthday',
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(
                              Icons.date_range,
                            )),
                        onTap: _selectDate,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                          labelText: "Gender", border: OutlineInputBorder()),
                      items: [
                        DropdownMenuItem(
                          value: "MALE",
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.male,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Male",
                              ),
                            ],
                          ),
                        ),
                        DropdownMenuItem(
                          value: "FEMALE",
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(
                                FontAwesomeIcons.female,
                                color: Colors.grey,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Female",
                              ),
                            ],
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _valueGender = value;
                        });
                      },
                      value: _valueGender,
                      hint: Text(
                        "Please choose gender",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: StreamBuilder<Object>(
                      stream: _updateProfileBloc.addressStream,
                      builder: (context, snapshot) {
                        return TextField(
                          controller: _addressController,
                          decoration: InputDecoration(
                              errorText:
                              snapshot.hasError ? snapshot.error : null,
                              labelText: 'Address',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.location_on,
                              )),
                        );
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: StreamBuilder<Object>(
                      stream: _updateProfileBloc.phoneNumberStream,
                      builder: (context, snapshot) {
                        return TextField(
                          controller: _phoneNumberController,
                          decoration: InputDecoration(
                            errorText:
                            snapshot.hasError ? snapshot.error : null,
                            labelText: 'Phone number',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.phone,
                            ),
                          ),
                        );
                      }),
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
                      onPressed: _onUpdate,
                      child: Text(
                        'Update',
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
    super.dispose();
  }

}
