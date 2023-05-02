import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:study_flutter/text_field_validator.dart';
import 'package:study_flutter/validating_texfield.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    //
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ValidatingTextField(
            controller: firstNameController,
            outerTitle: 'First Name',
            validator: (value) => TextFieldValidator.firstName(value),
          ),
          ValidatingTextField(
            outerTitle: 'Last Name',
            controller: lastNameController,
            validator: (value) => TextFieldValidator.lastname(value),
          ),
          ValidatingTextField(
            outerTitle: 'Phone Number',
            controller: phoneNumberController,
            validator: (value) => TextFieldValidator.phoneNumber(value),
          ),
          ValidatingTextField(
            outerTitle: 'Email',
            controller: emailController,
            validator: (value) => TextFieldValidator.email(value),
          ),
          ValidatingTextField(
            outerTitle: 'Password',
            controller: passwordController,
            validator: (value) => TextFieldValidator.password(value),
          ),
        ],
      ),
    );
  }
}
