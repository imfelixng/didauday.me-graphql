import styled from 'styled-components/native';
import { ContainerView } from '../../../styled';

const ContainerViewLogin = styled(ContainerView)`
  justify-content: flex-start;
`;

const ViewSocialButton = styled.View`
  justify-content: space-between;
  width: ${props => props.width};
  flex-direction: row;
`;

export {
  ContainerViewLogin,
  ViewSocialButton
}