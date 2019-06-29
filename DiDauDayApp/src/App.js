import React from 'react';
import { createAppContainer } from "react-navigation";

import { ContainerView } from './styled';
import AppNavigator from './navigations';

const AppContainer = createAppContainer(AppNavigator);

const App = () => {
  return (
    <AppContainer />
  )
}

export default App;