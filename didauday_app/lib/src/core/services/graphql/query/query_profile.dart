class QueryProfile {
  static const checkProfile = r'''
    query{
      checkProfile {
        is_complete
      }
    }
  ''';

  static const checkAccount = r'''
    query ($input: CheckAccountInput!){
      checkAccount(data: $input) {
        is_exist
      }
    }
  ''';
}
