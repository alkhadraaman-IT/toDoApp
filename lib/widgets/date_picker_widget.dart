import 'package:flutter/material.dart';

Future<DateTime?> datePrickerWidget(BuildContext context, DateTime today) {
    return showDatePicker(
            switchToCalendarEntryModeIcon: Icon(
              Icons.calendar_month,
              color: Color(0xfff596a1),
            ),
            switchToInputEntryModeIcon: Icon(
              Icons.edit_calendar,
              color: Color(0xff45496a),
            ),
            context: context,
            initialDate: today,
            firstDate: DateTime(2025),
            lastDate: DateTime(2050),
            initialEntryMode: DatePickerEntryMode.calendar, //
            selectableDayPredicate: (DateTime date) {
              if (date.weekday == DateTime.friday) {
                return false;
              }
              return true;
            },
            helpText: 'Select a Date',
            cancelText: 'Cancel',
            confirmText: 'Confirm',
            // locale: const Locale('ar'),
            barrierDismissible: false, // هل يغلق عند الضغط خارج النافذة
            barrierColor: Color(0xff45496a),
            useRootNavigator: true,

            // builder: (BuildContext context, Widget? child) {
            //   return Theme(
            //     data: ThemeData.light().copyWith(
            //       colorScheme: const ColorScheme.light(
            //         primary: Colors.green,
            //         onPrimary: Color.fromARGB(255, 230, 227, 227),
            //         surface: Colors.white,
            //         onSurface: Colors.black,
            //       ),
            //       textTheme: const TextTheme(
            //         bodyMedium: TextStyle(color: Colors.black, fontSize: 14),
            //       ),
            //     ),
            //     child: child!,
            //   );
            // },
            //   initialDatePickerMode: DatePickerMode.year,
            errorFormatText: 'Invalid format.',
            errorInvalidText: 'Out of range.',
            fieldHintText: 'Month/Date/Year',
            fieldLabelText: 'Enter date',
            keyboardType: TextInputType.datetime,
            anchorPoint: Offset(-100, -100),
          );
  }


