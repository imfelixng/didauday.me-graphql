import { createStackNavigator } from "react-navigation";
import SplashScreen from '../screens/splash';
import LoginScreen from '../screens/login';

const StackNavigator = createStackNavigator(
  {
    Splash: {
      screen: SplashScreen
    },
    Login: {
      screen: LoginScreen
    }
  },
);

export default StackNavigator;