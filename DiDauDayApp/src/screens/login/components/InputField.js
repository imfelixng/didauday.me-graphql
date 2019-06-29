import React from 'react'
import { View } from 'react-native'

import { TextInput } from '../styled';

const InputField = (
  {
    hidden = false,
    placeholder,
    width = 50,
    secureTextEntry,
  }
) => {
  return (
    <TextInput
      placeholder = { placeholder }
      width = { width }
      hidden = { hidden }
      secureTextEntry = { secureTextEntry }
    />
  )
}

export default InputField
