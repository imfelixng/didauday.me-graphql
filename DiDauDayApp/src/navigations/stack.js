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
);

export default StackNavigator;