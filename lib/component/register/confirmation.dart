import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Confirmation extends StatelessWidget {
  final String name;

  const Confirmation({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    var sizedBox = const SizedBox(height: 10);
    return Column(
      children: [
        const Align( alignment: AlignmentDirectional.topStart, child: Text('Confirmation: Your Details are Being Processed', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),),
        const SizedBox(height: 16),
        text("Dear $name,"),
        const SizedBox(height: 16),
        text("We would like to inform you that we have received your details and are currently in the process of reviewing and processing them. We appreciate your patience and cooperation throughout this procedure."),
        sizedBox,
        text("At QcDart, we understand the importance of accurate and timely processing of information, and we assure you that we are working diligently to ensure that your details are handled efficiently. Our team is carefully reviewing the information you provided to ensure its accuracy and completeness."),
        sizedBox,
        text("Once your details have been thoroughly reviewed and processed, we will notify you promptly regarding the outcome and any subsequent steps, if applicable."),
        sizedBox,
        const ContactLine(),
        sizedBox,
        text("Thank you once again for choosing QcDart. We greatly value your trust and look forward to serving you with our utmost dedication."),
        const SizedBox(height: 16),
        text("Best regards,"),
        text("QcDart Team"),    
      ],
    );
  }

  Align text(content) => Align(alignment: AlignmentDirectional.topStart, child: Text(content));
}


class ContactLine extends StatelessWidget {
  const ContactLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Should you have any urgent questions or concerns during this process, please feel free to reach out to our dedicated support team at ",
          ),
          WidgetSpan(
            child: InkWell(
              onTap: () async {
                final Uri uri = Uri.parse('tel:+919272120122');
                if (!await launchUrl(uri)) {
                  throw 'Could not launch $uri';
                }
              },
              child: Text(
                "+91 9272120122",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          )
        ]
      ),
    );
  }
}
