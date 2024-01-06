// import 'package:flutter/material.dart';
// import 'package:booking_calendar/booking_calendar.dart';
// import 'package:intl/date_symbol_data_local.dart';
//
//
// class BookCalendar extends StatefulWidget {
//   const BookCalendar({
//     Key? key,
//     this.width,
//     this.height,
//   }) : super(key: key);
//
//   final double? width;
//   final double? height;
//
//   @override
//   _BookCalendarState createState() => _BookCalendarState();
// }
//
// class _BookCalendarState extends State<BookCalendar> {
//   final now = DateTime.now();
//   late BookingService mockBookingService;
//
//   @override
//   void initState() {
//     super.initState();
//     mockBookingService = BookingService(
//       serviceName: 'Mock Service',
//       serviceDuration: 60,
//       bookingEnd: DateTime(now.year, now.month, now.day, 18, 0),
//       bookingStart: DateTime(now.year, now.month, now.day, 8, 0),
//     );
//   }
//
//   Stream<dynamic>? getBookingStreamMock(
//       {required DateTime end, required DateTime start}) {
//     return Stream.value([]);
//   }
//
//   Future<dynamic> uploadBookingMock(
//       {required BookingService newBooking}) async {
//     await Future.delayed(const Duration(seconds: 1));
//     converted.add(DateTimeRange(
//         start: newBooking.bookingStart, end: newBooking.bookingEnd));
//     print('${newBooking.toJson()} has been uploaded');
//   }
//
//   List<DateTimeRange> converted = [];
//
//   List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
//     // ...
//     // (same as the provided template code)
//     // ...
//     return converted;
//   }
//
//   List<DateTimeRange> generatePauseSlots() {
//     return [
//       DateTimeRange(
//         start: DateTime(now.year, now.month, now.day, 12, 0),
//         end: DateTime(now.year, now.month, now.day, 13, 0),
//       )
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Booking Calendar Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Booking Calendar Demo'),
//         ),
//         body: Center(
//           child: BookingCalendar(
//             bookingService: mockBookingService,
//             convertStreamResultToDateTimeRanges: convertStreamResultMock,
//             getBookingStream: getBookingStreamMock,
//             uploadBooking: uploadBookingMock,
//             pauseSlots: generatePauseSlots(),
//             pauseSlotText: 'LUNCH',
//             hideBreakTime: false,
//             loadingWidget: const Text('Fetching data...'),
//             uploadingWidget: const CircularProgressIndicator(),
//             locale: 'hu_HU',
//             startingDayOfWeek: StartingDayOfWeek.tuesday,
//             wholeDayIsBookedWidget:
//             const Text('Sorry, for this day everything is booked'),
//             //disabledDates: [DateTime(2023, 1, 20)],
//             //disabledDays: [6, 7],
//           ),
//         ),
//       ),
//     );
//   }
// }