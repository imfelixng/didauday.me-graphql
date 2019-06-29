import styled from 'styled-components/native';

const ButtonCustom = styled.TouchableHighlight`
  width: ${props => props.width};
  height: 50px;
  border-radius: 5;
  margin-top: 30px;
  background: ${ props => props.background };
  justify-content: center;
  align-items: center;
  flex-direction: row;
`;

export {
  ButtonCustom
}