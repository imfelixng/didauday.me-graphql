class MutationProfile {
  static const updateProfile = r'''
    mutation ($input: UpdateProfileInput!){
      updateProfile(data: $input) {
        user_info {
          firstname
          lastname
          birthday
          gender
          address
          phone_number
          role
          is_complete
        }
      }
    }
  ''';
}
