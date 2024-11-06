mixin BiomeFormValidations {
  String? isNotEmpty(String? value) {
    if(value?.isEmpty ?? true) return 'Esse campo é obrigatório';

    return null;
  }

  String? isEmailValid(String? value) {
    final isValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value ?? '');

    if (isValid) {
      return null;
    } else {
      return 'É necessário informar um e-mail válido';
    }
  }

  String? hasMultipleWords(String? value) {
    if((value?.split(' ').length ?? 0) < 2) {
      return 'Campo requer ao menos duas palavras';
    } else if ((value?.split(' ').length ?? 0) == 2 && value?.split(' ').last == '') {
      return 'Campo requer ao menos duas palavras';
    }
    
    return null;
  }

  String? combine(List<String? Function()> validators) {
    for(final validator in validators) {
      final validationResult = validator();

      if(validationResult != null) return validationResult;
    }
    
    return null;
  }
}
