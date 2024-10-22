extension Validations on String {
  emptyFieldValidation() {
    if (isEmpty) return "هذا الحقل مطلوب";
    return null;
  }

  fullNameValidator() {
    if (isEmpty) {
      return "الاسم الكامل مطلوب";
    }
    List<String> nameParts = split(' ');
    if (nameParts.length < 2) {
      return "يجب إدخال الاسم واللقب";
    }
    RegExp arabicRegex = RegExp(r'^[\u0621-\u064A]+$');
    if (!arabicRegex.hasMatch(nameParts[0]) ||
        !arabicRegex.hasMatch(nameParts[1])) {
      return "الاسم  واللقب يجب أن يكون باللغة العربية فقط";
    }
    if (nameParts[0].length < 2 || nameParts[1].length < 2) {
      return "يجب أن يتكون الاسم واللقب من حرفين على الأقل";
    }

    return null;
  }

  emailValidation() {
    final pattren = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    if (isEmpty) return "هذا الحقل مطلوب";
    if (!contains('@') || !pattren.hasMatch(this)) {
      return "الرجاء إدخال بريد إلكتروني صالح";
    }

    return null;
  }

  phoneValidation() {
    final pattren = RegExp(r'^09(2|1|4)[0-9]{7}');
    if (isEmpty) return "هذا الحقل مطلوب";

    if (!pattren.hasMatch(this)) {
      return "الرجاء إدخال رقم صالح 09XXXXXXXX";
    }
    return null;
  }

  passwordValidation() {
    if (isEmpty) return "هذا الحقل مطلوب";
    if (length < 8) return "يجب أن تكون كلمة المرور مكونة من 8 أحرف على الأقل";

    return null;
  }

  confirmPasswordValidation({String? newPassController}) {
    if (isEmpty) return "هذا الحقل مطلوب";
    if (length < 8) return "يجب أن تكون كلمة المرور مكونة من 8 أحرف على الأقل";

    if (this != newPassController) {
      return "تأكيد كلمة المرور لا يتطابق مع كلمة المرور";
    }

    return null;
  }

  phoneNumberWithCode() {
    if (startsWith('0')) {
      return '218${substring(1)}';
    }
    return this;
  }

  otpFieldValidation() {
    if (isEmpty) return "هذا الحقل مطلوب";
    if (length < 6) return "هذا الحقل مطلوب";
    return null;
  }
}
