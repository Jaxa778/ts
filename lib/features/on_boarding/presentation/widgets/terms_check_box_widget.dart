import 'package:flutter/material.dart';
import 'package:ts/core/widgets/reusable_button_widget.dart';

class TermsCheckboxWidget extends StatefulWidget {
  final VoidCallback? onPressed;

  const TermsCheckboxWidget({super.key, required this.onPressed});

  @override
  // ignore: library_private_types_in_public_api
  _TermsCheckboxWidgetState createState() => _TermsCheckboxWidgetState();
}

class _TermsCheckboxWidgetState extends State<TermsCheckboxWidget> {
  bool agreePrivacy = false;
  bool agreeTerms = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black, // as in your design
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CheckboxListTile(
            value: agreePrivacy,
            onChanged: (val) {
              setState(() {
                agreePrivacy = val!;
              });
            },
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              "I agree to the processing of my personal data according to Privacy Policy (including, to sharing my personal data with third parties)",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
          CheckboxListTile(
            value: agreeTerms,
            onChanged: (val) {
              setState(() {
                agreeTerms = val!;
              });
            },
            contentPadding: EdgeInsets.zero,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text(
              "I accept the Terms and Conditions of Use",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ),
          SizedBox(height: 60),
          ReusableButton(
            text: "Continue",
            onPressed: agreePrivacy && agreeTerms ? widget.onPressed : null,
            color: agreePrivacy && agreeTerms ? Colors.green : null,
          ),
          SizedBox(height: 10),
          Text(
            "By tapping Continue you agree to the Privacy Policy and Terms and Conditions of Use",
            style: TextStyle(
              fontFamily: "Poppins",
              color: Colors.white,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
