class Validator {
  static String? validateName({required String? name}) {
    if (name == null) {
      return null;
    }

    if (name.isEmpty) {
      return 'Name can\'t be empty';
    }

    return null;
  }

  static String? validateEmail({required String? email}) {
    if (email == null) {
      return null;
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    if (email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a correct email';
    }

    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null) {
      return null;
    }

    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      return 'Enter a password with length at least 6';
    }

    return null;
  }

  static String? validatePhoneNumber({required String? phone}) {
    if (phone == null) {
      return null;
    }

    // Add this post testing
    RegExp phoneRegEx = RegExp(r"^[0-9]{10,10}$");

    if (phone.isEmpty) {
      return 'Phone Number can\'t be empty';
    } else if (!phoneRegEx.hasMatch(phone)) {
      return 'Enter a valid 10 digit Phone Number';
    }

    return null;
  }

  static String? validateAddress({required String? address}) {
    if (address == null) {
      return null;
    }

    if (address.isEmpty) {
      return 'Address can\'t be empty';
    }

    return null;
  }

  static String? validateCity({required String? city}) {
    if (city == null) {
      return null;
    }

    if (city.isEmpty) {
      return 'City can\'t be empty';
    }

    return null;
  }

  static String? validateState({required String? state}) {
    if (state == null) {
      return null;
    }

    if (state.isEmpty) {
      return 'State can\'t be empty';
    }

    return null;
  }

  static String? validatePincode({required String? pincode}) {
    if (pincode == null) {
      return null;
    }

    if (pincode.isEmpty) {
      return 'Pincode can\'t be empty';
    }
    if (pincode.length != 6) {
      return "Please enter a valid pincode of 6 digits";
    }

    return null;
  }

  static String? validateCountry({required String? country}) {
    if (country == null) {
      return null;
    }

    if (country.isEmpty) {
      return 'Country can\'t be empty';
    }

    return null;
  }

  static String? validateCompanyName({required String? companyName}) {
    if (companyName == null) {
      return null;
    }

    if (companyName.isEmpty) {
      return 'Company Name can\'t be empty';
    }

    return null;
  }

  static String? validateOccupation({required String? occupation}) {
    if (occupation == null) {
      return null;
    }

    if (occupation.isEmpty) {
      return 'Occupation can\'t be empty';
    }

    return null;
  }

  static String? validateYearsOfExperience(
      {required String? yearsOfExperience}) {
    if (yearsOfExperience == null) {
      return null;
    }

    RegExp yearsOfExpRegExp = RegExp(r"^(0|[1-9][0-9]*)$");

    if (yearsOfExperience.isEmpty) {
      return 'Years of Experience can\'t be empty';
    } else if (!yearsOfExpRegExp.hasMatch(yearsOfExperience)) {
      return 'Enter a correct years of experience';
    }

    return null;
  }
}
