import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const String squiggle = 'assets/squiggle.svg';
    const String sittingMan = 'assets/splash_man.svg';

    return Material(
      color: const Color(0xff9FA67C),
      child: Stack(
        children: [
          SvgPicture.asset(
            squiggle,
            fit: BoxFit.fill,
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 17, left: 17.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.titleLarge,
                          children: const <TextSpan>[
                            TextSpan(text: 'Welcome to\n'),
                            TextSpan(
                              text: "SmartTracker",
                              style: TextStyle(color: Color(0xff336527)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "The smarter way to manage your money",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: const Color(0xff848383)),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                        height: 50,
                        width: 180,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                          ),
                          onPressed: () => {
                            Navigator.pushNamed(context, '/onboarding_username')
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Get Started",
                                style: GoogleFonts.jost(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Icon(FluentIcons.arrow_right_20_filled),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 13),
                      Row(
                        children: [
                          Text("Already a user?",
                              style: GoogleFonts.jost(
                                  color: const Color(0xff848383),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                          TextButton(
                              onPressed: () =>
                                  {Navigator.pushNamed(context, '/login')},
                              child: Text("Sign in",
                                  style: GoogleFonts.jost(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600))),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SvgPicture.asset(
                  sittingMan,
                  fit: BoxFit.fill,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
