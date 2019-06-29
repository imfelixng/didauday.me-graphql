import React, { Component } from 'react'
import { Text, ImageBackground } from 'react-native'
import { ContainerView } from '@styled';

const Splash = () => {
  return (
    <>
      <ContainerView>
        <ImageBackground
          source = {
            require('@asserts/images/img_splash.jpg')
          }
        />
      </ContainerView>
    </>
  )
}

export default Splash
