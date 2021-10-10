import 'package:email_validator/email_validator.dart';

class RegisterLoginValidator {
  static String? validateUserName(String? username) {
    if (username != null) {
      if (username.length < 4) {
        return "Kullanıcı adınız çok kısa!";
      } else if (username.length > 25) {
        return "Kullanıcı adınız çok uzun!";
      }
    } else {
      return "Kullanıcı adınızı giriniz!";
    }
  }

  static String? validateEmail(String? email) {
    if (email != null) {
      if (EmailValidator.validate(email)) {
        if (!(email.endsWith('edu.tr') || email.endsWith('edu.net'))) {
          return "Sadece üniversitenizden aldığınız e-posta adresi ile kayıt olabilirsiniz!";
        }
      } else {
        return "Email adresinizi giriniz!";
      }
    }
  }

  static String? validatePassword(String? password) {
    if (password != null) {
      if (password.length < 4) {
        return "Parolanız çok kısa";
      } else if (password.length > 25) {
        return "Parolanız çok uzun!";
      }
    } else {
      return "Parolanızı giriniz!";
    }
  }
}
