import React from 'react'
import Icon from 'react-native-vector-icons/Ionicons';

import { TextButton, ButtonCustom } from '../styled';
const Button = (
  {
    onPress,
    background = "#fd5739",
    title,
    width,
    type,
  }
) => {
  return (
    <ButtonCustom
      background = { background }
      width = { width }
    >
      <>
        {
          type && (
            <Icon
              style = {{ marginRight: 10 }}
              name = { type } size={24}
              color="#fff"
            />
          )
        }
        <TextButton>{ title }</TextButton>
      </>
    </ButtonCustom>
  )
}

export default Button
