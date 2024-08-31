class User {
  String userEmailAddress;
  String password;

  User(this.userEmailAddress, this.password);
}

class FullUser {
  String fullname, emailAddress, phoneNumber, password, confirmPassword;

  FullUser(this.fullname, this.emailAddress, this.phoneNumber, this.password,
      this.confirmPassword);
}
