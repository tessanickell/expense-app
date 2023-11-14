import 'package:expense_app/models/category.dart';
import 'package:expense_app/store/category_store.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_input_formatter/money_input_formatter.dart';
import 'package:provider/provider.dart';

class NewCategory extends StatefulWidget {
  const NewCategory({super.key});

  @override
  State<NewCategory> createState() => _NewCategoryState();
}

class _NewCategoryState extends State<NewCategory> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();
  IconData chosenIcon = FontAwesomeIcons.faceSmile;

  bool _validTitle = false;
  bool _validBudget = false;

  List icons = [
    FontAwesomeIcons.faceSmile,
    FontAwesomeIcons.plane,
    FontAwesomeIcons.cakeCandles,
    FontAwesomeIcons.mugHot,
    FontAwesomeIcons.dumbbell,
    FontAwesomeIcons.music,
    FontAwesomeIcons.house,
    FontAwesomeIcons.houseMedical,
    FontAwesomeIcons.utensils,
    FontAwesomeIcons.paw,
    FontAwesomeIcons.car,
    FontAwesomeIcons.cartShopping,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffD2D6C7),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0, bottom: 40),
                        child: Text("New Category",
                            style: Theme.of(context).textTheme.titleLarge),
                      ),
                      GestureDetector(
                        onTap: () => {
                          showModalBottomSheet<void>(
                            backgroundColor: const Color(0xff9FA67C),
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height / 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Wrap(
                                        runSpacing: 10,
                                        spacing: 30,
                                        children: icons
                                            .map(
                                              (icon) => GestureDetector(
                                                onTap: () => {
                                                  setState(() {
                                                    chosenIcon = icon;
                                                  }),
                                                  Navigator.of(context).pop(),
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      color: Colors.white),
                                                  child: Icon(
                                                    icon,
                                                    size: 30,
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        },
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white),
                          child: Icon(
                            chosenIcon,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.titleLarge,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Title',
                          style: Theme.of(context).textTheme.bodyLarge),
                      const TextSpan(
                        text: "*",
                        style:
                            TextStyle(fontSize: 25, color: Color(0xffff0000)),
                      ),
                    ],
                  ),
                ),
                // RichText(text:"Title", style: Theme.of(context).textTheme.bodyLarge),
              ),
              SizedBox(
                height: _validTitle ? 60 : 40,
                child: Material(
                  color: Colors.transparent,
                  elevation: 18,
                  shadowColor: const Color.fromRGBO(0, 0, 0, 0.5),
                  child: TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        errorText:
                            _validTitle ? "This field can't be empty" : null,
                        errorStyle: const TextStyle(fontSize: 12, height: 1),
                        contentPadding: const EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(5)),
                        filled: true,
                        fillColor: Colors.white,
                      )),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.titleLarge,
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Budget',
                          style: Theme.of(context).textTheme.bodyLarge),
                      const TextSpan(
                        text: "*",
                        style:
                            TextStyle(fontSize: 25, color: Color(0xffff0000)),
                      ),
                    ],
                  ),
                ),
                // RichText(text:"Title", style: Theme.of(context).textTheme.bodyLarge),
              ),
              SizedBox(
                height: _validBudget ? 60 : 40,
                child: Material(
                  color: Colors.transparent,
                  elevation: 18,
                  shadowColor: const Color.fromRGBO(0, 0, 0, 0.5),
                  child: TextField(
                      inputFormatters: [MoneyInputFormatter()],
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      controller: _budgetController,
                      decoration: InputDecoration(
                        errorText:
                            _validBudget ? "This field can't be empty" : null,
                        errorStyle: const TextStyle(
                          fontSize: 12,
                        ),
                        contentPadding: const EdgeInsets.all(10.0),
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none),
                            borderRadius: BorderRadius.circular(5)),
                        filled: true,
                        fillColor: Colors.white,
                      )),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 115,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () => {Navigator.of(context).pop()},
                        style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                              width: 1, // the thickness
                            ),
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0))),
                        child: Text(
                          "Cancel",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.black),
                        )),
                  ),
                  SizedBox(
                    width: 115,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () => {
                              setState(() {
                                _validTitle = _titleController.text.isEmpty;
                                _validBudget = _budgetController.text.isEmpty;
                              }),
                              if (!_validTitle && !_validBudget)
                                {
                                  Provider.of<CategoryStore>(context,
                                          listen: false)
                                      .addCategory(Category(
                                          double.parse(_budgetController.text),
                                          _titleController.text,
                                          chosenIcon)),
                                  Navigator.of(context).pop()
                                }
                            },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0))),
                        child: Text(
                          "Add",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        )),
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
