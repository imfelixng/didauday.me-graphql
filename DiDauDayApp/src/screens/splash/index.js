import React, { useEffect } from 'react'
import { ContainerView } from '../../styled';
import { ImageBackground } from './styled';
import Logo from './components/Logo';

const Splash = (props) => {

  useEffect(() => {
    setTimeout(() => {
      props.navigation.navigate('Login');
    }, 2000);
  }, []);

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

Splash.navigationOptions = {
  header: null
};

export default Splash
