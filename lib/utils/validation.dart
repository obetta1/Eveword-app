
import 'package:get/get.dart';



class Validate{
  static String? validatePassword(String password,){
    if( password.isEmpty || password.length < 6){
      return 'password must be more that 6 character';
    } else{
      return null;
    }
  }

  static String? validateEmail(String email,){
    if( email.isNotEmpty && email.isEmail){
      return  null;
    } else{
      return '* invalid email';
    }
  }

  static String? validateField(String email,){
    if( email.isEmpty){
      return '* Field is required';
    } else{
      return null;
    }
  }
}
