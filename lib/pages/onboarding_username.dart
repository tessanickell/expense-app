import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingUsername extends StatefulWidget {
  const OnboardingUsername({super.key});

  @override
  State<OnboardingUsername> createState() => _OnboardingUsernameState();
}

class _OnboardingUsernameState extends State<OnboardingUsername> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff9FA67C),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 200,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(
                  FluentIcons.chevron_left_20_filled,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text(
                "Back",
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          )),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32, top: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hiya,",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                  Text(
                    "Let's Get Started!",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 54),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xffE4E8D8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40, horizontal: 32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: const Color(0xff848383)),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                          decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff9FA67C), width: 2.0),
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xff848383),
                                width: 1,
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(5)),
                        filled: false,
                        fillColor: const Color(0xffD9D9D9),
                      )),
                      const SizedBox(height: 20),
                      Text(
                        "Password",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: const Color(0xff848383)),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                          keyboardType: TextInputType.visiblePassword,
                          textInputAction: TextInputAction.done,
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xff9FA67C), width: 2.0),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                  color: const Color(0xff9FA67C),
                                  passwordVisible
                                      ? FluentIcons.eye_20_regular
                                      : FluentIcons.eye_off_20_regular),
                              onPressed: () {
                                setState(
                                  () {
                                    passwordVisible = !passwordVisible;
                                  },
                                );
                              },
                            ),
                            suffixIconConstraints:
                                BoxConstraints(maxHeight: 35),
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff848383),
                                    width: 1,
                                    style: BorderStyle.none),
                                borderRadius: BorderRadius.circular(5)),
                            filled: false,
                            fillColor: const Color(0xffD9D9D9),
                          )),
                      const SizedBox(height: 20),
                      Text(
                        "First Name",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: const Color(0xff848383)),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                          decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff9FA67C), width: 2.0),
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xff848383),
                                width: 1,
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(5)),
                        filled: false,
                        fillColor: const Color(0xffD9D9D9),
                      )),
                      const SizedBox(height: 20),
                      Text(
                        "Last Name",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: const Color(0xff848383)),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                          decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff9FA67C), width: 2.0),
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xff848383),
                                width: 1,
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(5)),
                        filled: false,
                        fillColor: const Color(0xffD9D9D9),
                      )),
                      const SizedBox(height: 20),
                      Text(
                        "Enter your monthly budget",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: const Color(0xff848383)),
                      ),
                      const SizedBox(height: 6),
                      TextField(
                          decoration: InputDecoration(
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff9FA67C), width: 2.0),
                        ),
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 8),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xff848383),
                                width: 1,
                                style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(5)),
                        filled: false,
                        fillColor: const Color(0xffD9D9D9),
                      )),
                      const SizedBox(height: 20),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 114,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                              onPressed: () => {
                                Navigator.pushNamed(context, '/avatar_picker')
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Next",
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
