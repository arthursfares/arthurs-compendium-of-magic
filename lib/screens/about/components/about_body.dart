import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutBody extends StatelessWidget {
  const AboutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 100,
            backgroundImage:
                Image.asset('assets/images/bermuda-mage.png').image,
          ),
          const SizedBox(height: 15.0),
          Text.rich(
            TextSpan(
              style: const TextStyle(
                fontSize: 27,
              ),
              children: [
                TextSpan(
                  style: TextStyle(
                    color: Colors.purple.shade400,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  text: "github.com/arthursfares",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      String url = "https://github.com/arthursfares";
                      var urlLaunchable = await canLaunchUrl(Uri.parse(url));
                      if (urlLaunchable) {
                        await launchUrl(Uri.parse(url));
                      }
                    },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Container(height: 2, width: size.width / 1.2, color: Colors.grey.shade800),
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'App for storing Dungeons & Dragons characters\' spell list, in order to make them easier to consult during the game.\n\nDeveloped for Flutter class.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(height: 2, width: size.width / 1.2, color: Colors.grey.shade800),
          const SizedBox(height: 20.0),
          const Text(
            'by',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 4.0),
          const Text(
            'Arthur S. Fares',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Space Quest',
              fontSize: 28,
            ),
          ),
          const SizedBox(height: 20.0),
          Container(height: 2, width: size.width / 1.2, color: Colors.grey.shade800),
          const SizedBox(height: 20.0),
          const Text(
            'Made with 💙 and ☕.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 80.0),
          Text(
            'Powered by D&D 5e API',
            style: TextStyle(
              color: Colors.grey.shade200,
              fontStyle: FontStyle.italic,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
