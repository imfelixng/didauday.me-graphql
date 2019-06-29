import React from 'react'
import { Dimensions, ScrollView } from 'react-native';
import DatePicker from 'react-native-datepicker'

import { ContainerViewCustom } from './styled';

import InputField from './components/InputField';
import Button from './components/Button';

const width = Dimensions.get('screen').width;

const Register = () => {
  return (
    <ScrollView>
      <ContainerViewCustom
      >
        <InputField
          width = { width - 20 }
          placeholder = "Email"
          autoCapitalize="none"
          autoCorrect={false}
        />
        <InputField
          width = { width - 20 }
          placeholder = "Password"
          secureTextEntry={ true }
        />
        <InputField
          width = { width - 20 }
          placeholder = "Repeat password"
          secureTextEntry={ true }
        />
        <InputField
          width = { width - 20 }
          placeholder = "First name"
        />
        <InputField
          width = { width - 20 }
          placeholder = "Last name"
        />
        <DatePicker
          date = "01/01/2019"
          mode="date"
          placeholder="Birthday"
          format="DD-MM-YYYY"
          confirmBtnText="Confirm"
          cancelBtnText="Cancel"
          style = {{
            marginTop: 30,
            width: width - 20,
          }}
          customStyles = {{
            dateInput: {
              borderRadius: 5,
              borderColor: "#D1D1D1",
            },
            dateText: {
              fontSize: 16,
            }
          }}
        />
        <Button
          title = "Register"
          background = "#fd5739"
          width = { width - 20 }
        />
      </ContainerViewCustom>
    </ScrollView>
  )
}

Register.navigationOptions = {
  title: "Register"
};

export default Register
