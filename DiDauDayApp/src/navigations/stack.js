import React from 'react';
import Icon from 'react-native-vector-icons/MaterialCommunityIcons';

import { createStackNavigator } from "react-navigation";
import SplashScreen from '../screens/splash';
import LoginScreen from '../screens/login';
import RegisterScreen from '../screens/register';

const StackNavigator = createStackNavigator(
  {
    Splash: {
      screen: SplashScreen
    },
    Login: {
      screen: LoginScreen
    },
    Register: {
      screen: RegisterScreen
    }
  },
  {
    defaultNavigationOptions: ({ navigation }) => ({
      headerStyle: {
        backgroundColor: '#fd5739',
      },
      headerTintColor: '#fff',
      headerTitleStyle: {
        fontWeight: 'bold',
      },
      headerLeft: (
        <Icon
          name="arrow-left"
          size={30}
          color="#fff"
          style = {{
            margin: 10
          }}
          onPress = { () => {
            navigation.goBack();
          } }
        />
      )
    }),
  }
);

export default StackNavigator;