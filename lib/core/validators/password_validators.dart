mixin PasswordFormValidations {
  String? isNotEmpty(String? value) {
    if(value?.isEmpty ?? true) 'Esse campo é obrigatório';

    return null;
  }

  String? hasMinimumCharacters(String? value) {
    if(value != null) {
      if(value.length >= 6 && value.length <= 15) {
        return null;
      } else {
        return 'A senha deve conter entre 6 e 15 caracteres';
      }
    } else {
      return isNotEmpty(value);
    }
  }

  String? hasUppercaseAndLowercase(String? value) {
    if(value != null) {
      if(RegExp(r'[A-Z]').hasMatch(value) && RegExp(r'[a-z]').hasMatch(value)) {
        return null;
      } else {
        return 'A senha deve conter caracteres maiúsculos e minúsculos';
      }
    } else {
      return isNotEmpty(value);
    }
  }

  String? hasNumericCharacter(String? value) {
    if(value != null) {
      if(RegExp(r'\d').hasMatch(value)) {
        return null;
      } else {
        return 'A senha deve conter pelo menos um caractere numérico';
      }
    } else {
      return isNotEmpty(value);
    }
  }

  String? hasSpecialCharacter(String? value) {
    if(value != null) {
      if(!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value) && value.isNotEmpty) {
        return null;
      } else {
        return 'A senha deve conter um caractere especial (!@#\$%&*...)';
      }
    } else {
      return isNotEmpty(value);
    }
  } 

  String? combine(List<String? Function()> validators) {
    for(final validator in validators) {
      final validationResult = validator();

      if(validationResult != null) return validationResult;
    }
    
    return null;
  }
}
