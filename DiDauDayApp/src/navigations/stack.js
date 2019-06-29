import { createStackNavigator } from "react-navigation";
import SplashScreen from '../screens/splash';

const StackNavigator = createStackNavigator(
  {
    Splash: SplashScreen,
  },
  {
    headerMode: 'none'
  }
);

export default StackNavigator;