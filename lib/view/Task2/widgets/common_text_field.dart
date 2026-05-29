import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_app/controller/login_controller.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController textFieldController;
  final bool isPasswordField;
  final String? Function(dynamic) validator;
  final String labelTxt;
  final String hintTxt;
  final TextInputType textInputType;

  const CommonTextField({
    super.key,
    required this.textFieldController,
    this.isPasswordField = false,
    required this.validator,
    required this.labelTxt,
    required this.hintTxt,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();

    // 1. Create a helper method/variable to build the actual TextFormField
    Widget buildTextField({required bool obscure}) {
      return TextFormField(
        keyboardType: textInputType,
        controller: textFieldController,
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: labelTxt,
          hintText: hintTxt,
          labelStyle: TextStyle(color: Colors.grey, fontSize: 20.sp),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 0.8),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF4A61D1), width: 1.5),
          ),
          suffixIcon: isPasswordField
              ? IconButton(
                  icon: Icon(
                    controller.showPass.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    controller.showPass.value = !controller.showPass.value;
                  },
                )
              : null,
        ),
        validator: validator,
      );
    }

    // 2. ONLY wrap with Obx if it is a password field
    if (isPasswordField) {
      return Obx(() => buildTextField(obscure: controller.showPass.value));
    } else {
      return buildTextField(obscure: false);
    }
  }
}
