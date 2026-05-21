import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({super.key});

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  TextEditingController amountController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  double interest = 0.0;
  double totalResult = 0.0;

  void totalCalculate() {
    final result = (double.parse(rateController.text) / 100 / 12) *
        int.parse(monthController.text);
    final total = result * int.parse(amountController.text);
    setState(() {
      interest = total;
      totalResult = int.parse(amountController.text) + interest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: Column(
        children: <Widget>[
          // Красный заголовок
          Container(
            height: 170,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Практическая работа',
                      style: GoogleFonts.robotoMono(
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Nº 1 - 1 - 1',
                      style: GoogleFonts.robotoMono(
                        fontSize: 32,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Поля ввода и кнопка
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 10, 40, 0),
            child: Column(
              children: [
                // Депозит
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Депозит',
                      style: GoogleFonts.robotoMono(fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: amountController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Руб',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                // Процент
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '%',
                      style: GoogleFonts.robotoMono(fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: rateController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: '%',
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                // Месяцев
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Месяцев',
                      style: GoogleFonts.robotoMono(fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextField(
                        controller: monthController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: '0-12',
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                // Кнопка Рассчитать
                GestureDetector(
                  onTap: () {
                    totalCalculate();
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        'Рассчитать',
                        style: GoogleFonts.robotoMono(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Результат
                // ignore: unnecessary_null_comparison
                interest != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Результат :',
                            style: GoogleFonts.robotoMono(fontSize: 20),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Text(
                              '%: ${interest.toStringAsFixed(2)}',
                              style: GoogleFonts.robotoMono(fontSize: 20),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Text(
                              'Итого : ${totalResult.toStringAsFixed(2)}',
                              style: GoogleFonts.robotoMono(fontSize: 20),
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}