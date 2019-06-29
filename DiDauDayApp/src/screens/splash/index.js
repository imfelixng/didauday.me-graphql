import React from 'react'
import { ContainerView } from '../../styled';
import { ImageBackground } from './styled';
import Logo from './components/Logo';

const Splash = () => {
  return (
    <ContainerView>
      <ImageBackground
        source = {
          require('../../asserts/images/img_splash.jpg')
        }
      >
        <Logo />
      </ImageBackground>
    </ContainerView>
  )
}

Splash.navigationOptions = null;

export default Splash
