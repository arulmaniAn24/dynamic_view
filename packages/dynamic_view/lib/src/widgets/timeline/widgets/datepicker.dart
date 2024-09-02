import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Datepicker extends StatefulWidget {
  const Datepicker({super.key});

  @override
  State<Datepicker> createState() => _DatepickerState();
}

class _DatepickerState extends State<Datepicker> {
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  int daysInMonth(DateTime date) {
    final firstDayOfNextMonth = DateTime(date.year, date.month + 1, 1);
    final lastDayOfMonth = firstDayOfNextMonth.subtract(const Duration(days: 1));
    return lastDayOfMonth.day;
  }

  String _dayOfWeek(DateTime date) {
    final daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return daysOfWeek[date.weekday % 7];
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          // Horizontal ListView for months
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 12,
              itemBuilder: (context, index) {
                final month = DateTime(_focusedDay.year, index + 1);
                final isSelected = month.month == _focusedDay.month;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _focusedDay = DateTime(
                        _focusedDay.year,
                        month.month,
                        _focusedDay.day,
                      );
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    child: Text(
                      DateFormat('MMMM').format(month),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected ? Colors.black : Colors.grey,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Horizontal ListView for days
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: daysInMonth(_focusedDay),
              itemBuilder: (context, index) {
                final date = DateTime(
                  _focusedDay.year,
                  _focusedDay.month,
                  index + 1,
                );
                final isSelected = date.day == _selectedDay.day &&
                    date.month == _selectedDay.month &&
                    date.year == _selectedDay.year;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDay = date;
                    });
                  },
                  child: Container(
                    width: 70,
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isSelected ?const Color.fromARGB(255, 8, 14, 83) : Colors.grey[50],
                            // border: Border.all(
                            //   color: isSelected ? Colors.black : Colors.grey,
                            //   width: 2,
                            // ),
                          ),
                          child: Center(
                            child: Text(
                              date.day.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.all(4),
                          // decoration: BoxDecoration(
                          //   color: isSelected ? Colors.black : Colors.white,
                          //   borderRadius: BorderRadius.circular(10),
                          // ),
                          child: Text(
                            _dayOfWeek(date),
                            style: TextStyle(
                              color: isSelected ? Colors.black : Colors.grey,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
