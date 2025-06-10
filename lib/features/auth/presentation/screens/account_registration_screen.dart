import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ts/core/widgets/gap.dart';
import 'package:ts/features/auth/presentation/screens/login_screen.dart';
import '../../../../core/widgets/global_text.dart';
import '../widgets/gradient_button.dart';
import '../widgets/password_textfield.dart';

class AccountRegistrationScreen extends StatefulWidget {
  const AccountRegistrationScreen({super.key});

  @override
  State<AccountRegistrationScreen> createState() =>
      _AccountRegistrationScreenState();
}

class _AccountRegistrationScreenState extends State<AccountRegistrationScreen> {
  bool? membershipAnswer;
  bool? termsAgreement;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        centerTitle: true,
        title: const GlobalText(
          "Account registration",
          fontSize: 18,
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/workout1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.9)),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 37),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTextField("Enter your name"),
                  const Gap(40),
                  _buildTextField("Enter your email"),
                  const Gap(40),
                  const IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const PasswordTextfield(hintText: " * * * * "),
                  const Gap(40),
                  const PasswordTextfield(hintText: "Confirm password"),
                  const Gap(30),
                  _buildMembershipRadio(),
                  const Gap(30),
                  const GlobalText(
                    "We're all set. Now let's create your account.",
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  const Gap(20),
                  _buildTermsAgreement(),
                  const Gap(90),
                  GradientButton(
                    text: "CREATE AN ACCOUNT",
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    ),
                    isItEmail: false,
                    
                  ),
                  const Gap(25),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintStyle: TextStyle(color: Colors.white54),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildMembershipRadio() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          child: GlobalText(
            "Do you have TOPSTRETCHING membership?",
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        Row(
          children: [
            Row(
              children: [
                Radio<bool>(
                  value: true,
                  groupValue: membershipAnswer,
                  onChanged: (value) =>
                      setState(() => membershipAnswer = value),
                  activeColor: Colors.white,
                  fillColor: MaterialStateProperty.all(const Color(0xFFF41671)),
                ),
                const Text("Yes", style: TextStyle(color: Colors.white)),
              ],
            ),
            const Gap(20),
            Row(
              children: [
                Radio<bool>(
                  value: false,
                  groupValue: membershipAnswer,
                  onChanged: (value) =>
                      setState(() => membershipAnswer = value),
                  activeColor: Colors.white,
                  fillColor: MaterialStateProperty.all(const Color(0xFFF41671)),
                ),
                const Text("No", style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTermsAgreement() {
    return Column(
      children: [
        _buildAgreementRow(
          value: true,
          text: "I agree to TOPSTRETCHING Terms & Conditions",
          groupValue: termsAgreement,
        ),
        _buildAgreementRow(
          value: false,
          text: "I agree to Privacy Policy",
          groupValue: termsAgreement,
        ),
      ],
    );
  }

  Widget _buildAgreementRow({
    required bool? value,
    required String text,
    required bool? groupValue,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Radio<bool>(
            value: true,
            groupValue: groupValue,
            onChanged: (value) => setState(() => termsAgreement = value),
            activeColor: Colors.white,
            fillColor: MaterialStateProperty.all(const Color(0xFFF41671)),
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
