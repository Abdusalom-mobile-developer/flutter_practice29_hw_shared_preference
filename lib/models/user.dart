class User {
  String userEmailAddress;
  String password;

  User(this.userEmailAddress, this.password);
}

class FullUser {
  String fullName, emailAddress, phoneNumber, password, confirmPassword;

  FullUser(this.fullName, this.emailAddress, this.phoneNumber, this.password,
      this.confirmPassword);
}
