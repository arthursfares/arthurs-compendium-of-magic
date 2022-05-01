import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: size.width,
            height: size.height,
            child: FittedBox(
              child: Image.network(
                  'https://64.media.tumblr.com/bb376a19666025cf58901c76612d4a48/332bc6d644d4bf2d-ad/s1280x1920/5382ab89f56da3a466ca6bc78de257eb95006e96.gifv'),
              // child: Image.network(
              //   'https://c.tenor.com/snMJlTp3YzYAAAAC/wave-vaporwave.gif',
              //   color: Colors.black54,
              //   colorBlendMode: BlendMode.darken,
              // ),
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomCenter,
            child: Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 27,
                ),
                children: [
                  const TextSpan(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                    text: 'via ',
                  ),
                  TextSpan(
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                    text: "tumblr",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        String url =
                            "https://ericaofanderson.tumblr.com/post/681891443630080000/slow-jam-twitter-instagram-gumroad-patreon";
                        var urlLaunchable = await canLaunchUrl(Uri.parse(url));
                        if (urlLaunchable) {
                          await launchUrl(Uri.parse(url));
                        }
                      },
                  ),
                ],
              ),
            ),
          ),
          // BackdropFilter(
          //   filter: ImageFilter.blur(sigmaX: 13, sigmaY: 13),
          //   child: child,
          // ),
          child,
        ],
      ),
    );
  }
}
