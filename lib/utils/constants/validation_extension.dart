extension Validations on String {
  emptyFieldValidation() {
    if (isEmpty) return "هذا الحقل مطلوب";
    return null;
  }

  emailValidation() {
    if (isEmpty) return "الرجاء إدخال بريد إلكتروني صالح";
    if (!contains('@')) return "الرجاء إدخال بريد إلكتروني صالح";

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
