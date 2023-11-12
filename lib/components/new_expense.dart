import 'package:expense_app/models/category.dart';
import 'package:expense_app/models/expense.dart';
import 'package:expense_app/store/expense_store.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_input_formatter/money_input_formatter.dart';
import 'package:provider/provider.dart';

class NewExpenseDialog extends StatefulWidget {
  List<Category> categories;
  NewExpenseDialog({super.key, required this.categories});

  @override
  State<NewExpenseDialog> createState() => _NewExpenseDialogState();
}

class _NewExpenseDialogState extends State<NewExpenseDialog> {
  Category? selectedCategory;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      backgroundColor: Color(0xffD2D2C2),
      title: Text("New Expense", style: Theme.of(context).textTheme.titleLarge),
      content: Container(
        height: 400.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.titleLarge,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Title',
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                      text: "*",
                      style: TextStyle(fontSize: 25, color: Color(0xffff0000)),
                    ),
                  ],
                ),
              ),
              // RichText(text:"Title", style: Theme.of(context).textTheme.bodyLarge),
            ),
            SizedBox(
              height: 40,
              child: Material(
                color: Colors.transparent,
                elevation: 18,
                shadowColor: const Color.fromRGBO(0, 0, 0, 0.5),
                child: TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0, style: BorderStyle.none),
                          borderRadius: BorderRadius.circular(5)),
                      filled: true,
                      fillColor: Colors.white,
                    )),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.titleLarge,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Expense Category',
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                      text: "*",
                      style: TextStyle(fontSize: 25, color: Color(0xffff0000)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 40,
              child: Material(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                elevation: 18,
                shadowColor: const Color.fromRGBO(0, 0, 0, 0.5),
                child: DropdownButton(
                  value: (selectedCategory == null) ? null : selectedCategory,
                  underline: Container(),
                  borderRadius: BorderRadius.circular(5),
                  hint: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 45.0),
                    child: Text(
                      'Please select an expense category',
                      style: GoogleFonts.asap(fontSize: 14),
                    ),
                  ),
                  items: widget.categories.map((category) {
                    return DropdownMenuItem(
                        value: category,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 13, right: 45.0),
                          child: Text(category.title,
                              style: GoogleFonts.asap(
                                  fontSize: 14, color: Colors.black)),
                        ));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value!;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.titleLarge,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Amount',
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(
                      text: "*",
                      style: TextStyle(fontSize: 25, color: Color(0xffff0000)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: Material(
                color: Colors.transparent,
                elevation: 18,
                shadowColor: const Color.fromRGBO(0, 0, 0, 0.5),
                child: TextField(
                    inputFormatters: [MoneyInputFormatter()],
                    keyboardType: TextInputType.number,
                    controller: _amountController,
                    decoration: InputDecoration(
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
            Center(
              child: SizedBox(
                width: 100,
                height: 40,
                child: ElevatedButton(
                    onPressed: () => {
                          Provider.of<ExpenseStore>(context, listen: false)
                              .addExpense(Expense(
                                  _titleController.text,
                                  selectedCategory!.title,
                                  double.parse(_amountController.text))),
                          Navigator.pop(context)
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
            ),
          ],
        ),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
    );
  }
}
