import React from 'react'
import { Dimensions } from 'react-native';

import { ContainerViewLogin, ViewSocialButton } from './styled';
import InputField from './components/InputField';
import Button from './components/Button';

const width = Dimensions.get('screen').width;

const Login = () => {
  return (
    <ContainerViewLogin
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
      <Button
        title = "Login"
        background = "#fd5739"
        width = { width - 20 }
      />
      <ViewSocialButton
        width = { width -20 }
      >
        <Button
          title = "Google"
          background = "#dd4b39"
          width = { "45%" }
          type = "logo-google"
        />
        <Button
          title = "Facebook"
          background = "#415dae"
          width = { "45%" }
          type = "logo-facebook"
        />
      </ViewSocialButton>
    </ContainerViewLogin>
  )
}

Login.navigationOptions = {
  title: "Login"
};

export default Login
