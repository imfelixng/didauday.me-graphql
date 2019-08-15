class QueryProfile {
  static const checkProfile = r'''
    query{
      check: checkProfile {
        is_complete
      }
    }
  ''';
}
