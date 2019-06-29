import styled from 'styled-components/native';

const TextInput = styled.TextInput`
  width: ${props => props.width};
  height: 50px;
  border-radius: 5;
  margin-top: 30px;
  border-width: 1px;
  border-color: #D1D1D1;
  padding-left: 10px;
  font-size: 16px;
`;

export {
  TextInput
}