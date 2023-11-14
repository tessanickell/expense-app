import 'package:expense_app/store/avatar_store.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AvatarPicker extends StatefulWidget {
  const AvatarPicker({super.key});

  @override
  State<AvatarPicker> createState() => _AvatarPickerState();
}

class _AvatarPickerState extends State<AvatarPicker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD2D6C7),
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
                  Navigator.of(context).pop();
                },
              ),
              Text(
                "Back",
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Pick Your Avatar",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 30,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50,
                child: (Provider.of<UserStore>(context, listen: true)
                            .chosenAvatar ==
                        "")
                    ? const Icon(
                        FluentIcons.camera_20_regular,
                        color: Color(0xffBAB7B7),
                        size: 45,
                      )
                    : SvgPicture.asset(
                        Provider.of<UserStore>(context, listen: true)
                            .chosenAvatar,
                        fit: BoxFit.fill,
                        height: 100,
                        width: 100),
              ),
              const SizedBox(height: 30),
              Wrap(
                spacing: 14,
                runSpacing: 20,
                children: UserStore()
                    .avatars
                    .map(
                      (avatar) => GestureDetector(
                        onTap: () => {
                          Provider.of<UserStore>(context, listen: false)
                              .setAvatar(avatar)
                        },
                        child: CircleAvatar(
                          backgroundColor: const Color(0xffD2D6C7),
                          radius: 50,
                          child: SvgPicture.asset(avatar,
                              fit: BoxFit.fill, height: 100, width: 100),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 50,
                    width: 130,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                      onPressed: () => {Navigator.pushNamed(context, '/home')},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Finish",
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
    );
  }
}
