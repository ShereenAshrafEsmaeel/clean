import 'package:cleanapp/core/const/constant.dart';
import 'package:cleanapp/core/theming/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'feature/Auth/presentation/view/widget/custom_text_form_field.dart';
import 'feature/Auth/presentation/view/widget/drop_down.dart';
import 'feature/Homepage/drawer.dart';
import 'generated/l10n.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    // Fetch user data when the booking screen is loaded
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    try {
      // Assuming you have a user ID or unique identifier
      String userId = 'Constant.uid'; // Fill in with the actual user ID

      // Fetch user data from Firestore
      DocumentSnapshot userData =
          await _firestore.collection('UsserData').doc(Constant.uid).get();

      if (userData.exists) {
        Map<String, dynamic> data = userData.data() as Map<String, dynamic>;

        // Check if 'name' field exists and is not null
        if (data.containsKey('firstName')) {
          _firstnameController.text = data['firstName'];
        } else {
          print('Error: User data does not contain name field or it is null.');
        }

        // Check if 'phone' field exists and is not null
        if (data.containsKey('phone')) {
          _phoneController.text = data['phone'];
        } else {
          print('Error: User data does not contain phone field or it is null.');
        }

        // Check if 'address' field exists and is not null
        if (data.containsKey('address')) {
          _addressController.text = data['address'];
        } else {
          print(
              'Error: User data does not contain address field or it is null.');
        }

        // Check if 'location' field exists and is not null
        if (data.containsKey('location')) {
          DropdownManager.initialValueLocation = data['location'];
        } else {
          print(
              'Error: User data does not contain location field or it is null.');
        }

        // Check if 'lastname' field exists and is not null
        if (data.containsKey('lastName')) {
          _lastNameController.text = data['lastName'];
        } else {
          print(
              'Error: User data does not contain lastname field or it is null.');
        }
      } else {
        print('Error: User data does not exist.');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  void dispose() {
    _firstnameController.dispose();
    _phoneController.dispose();
    _locationController.dispose();
    _addressController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Book Now",
          style: TextStyle(
              color: Colors.white, fontSize: 23.sp, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      // drawer
      endDrawer: const Directionality(
          textDirection: TextDirection.rtl, child: MyDrawer()),
      body: Stack(children: [
        Container(
          width: 390.w,
          height: 812.h,
          color: Colors.amber,
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding:EdgeInsets.only(left: 2.w),
            child: Container(
              width: 380.w,
              height: 780.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r), color: Colors.white),
              child: Column(
                children: [
                  TableCalendar(
                    calendarFormat: _calendarFormat,
                    focusedDay: _focusedDay,
                    firstDay: DateTime(2022),
                    lastDay: DateTime(2030),
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                        _focusedDay = focusedDay;
                      });
                    },
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    calendarStyle: CalendarStyle(
                      selectedDecoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      todayDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                      ),
                    ),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(color: Colors.green),
                      weekendStyle: TextStyle(color: Colors.red),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Selected Day: ${_selectedDay.toLocal()}',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 15.h),
//===============================================================
                  //first name field
                  CustomTextFormField(
                    label: S.of(context).firstname,
                    controller: _firstnameController,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.person_2_outlined,
                        color: ColorManger.iconColor),
                    validator: 'Please Enter your First Name',
                    hint: S.of(context).firstnamehint,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  //last name
                  CustomTextFormField(
                    label: S.of(context).lastname,
                    controller: _lastNameController,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.person_2_outlined,
                        color: ColorManger.iconColor),
                    validator: 'Please Enter your Last Name',
                    hint: S.of(context).secondnamehint,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  //location dropdown
                  DropdownButtonFormField(
                    menuMaxHeight: 300,
                    isExpanded: true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: S.of(context).location,
                      labelStyle: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                      prefixIcon: const Icon(
                        Icons.location_on_outlined,
                        color: ColorManger.iconColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0.r)),
                        //background TextFormField ====>>> white
                        borderSide:
                            const BorderSide(color: ColorManger.textColor1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0.r)),
                        borderSide:
                            BorderSide(color: Colors.blue.withOpacity(.5)),
                      ),
                    ),

                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: DropdownManager.itemLocation.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),

                    onChanged: (String? newValue) {
                      setState(() {
                        DropdownManager.initialValueLocation = newValue!;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  //address in detail field
                  CustomTextFormField(
                    label: S.of(context).address,
                    controller: _addressController,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.location_city_sharp,
                        color: ColorManger.iconColor),
                    validator: 'Please Enter your Address In Detail',
                    hint: S.of(context).addressindetailhint,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  //phone number field
                  IntlPhoneField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone_android_outlined,
                          color: ColorManger.iconColor),
                      fillColor: Colors.white,
                      filled: true,
                      labelText: '',
                      labelStyle: TextStyle(
                          fontSize: 15.sp, color: ColorManger.textDarkColor),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0.r)),
                        //background TextFormField ====>>> white
                        borderSide:
                            const BorderSide(color: ColorManger.textColor1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0.r)),
                        borderSide:
                            BorderSide(color: Colors.blue.withOpacity(.5)),
                      ),
                    ),
                    initialCountryCode: 'EG',
                    controller: _phoneController,
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),

                  //booking button
                  GestureDetector(
                    onTap: () {
                      _addEvent(
                          _selectedDay,
                          _firstnameController.text,
                          _phoneController.text,
                          DropdownManager.initialValueLocation,
                          _addressController.text,
                          _lastNameController.text);
                    },

                    child: Container(
                      width: 250.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                          colors: [
                            Colors.amber.shade400,
                            Colors.red.shade200,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          S.of(context).booknow,
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

//==============================================================================
//==============================================================================
  Future<void> _addEvent(DateTime selectedDay, String firstName, String phone,
      String location, String address, String lastName) async {
    try {
      // Create the 'bookings' collection
      CollectionReference bookings = _firestore.collection('bookings');

      // Add the booking document to the 'bookings' collection
      await bookings.add({
        'firstName': firstName,
        'phone': phone,
        'location': location,
        'selectedDay': selectedDay,
        'address': address,
        'lastName': lastName
      });

      // Clear text fields after adding event
      _firstnameController.clear();
      _phoneController.clear();
      _locationController.clear();
      _addressController.clear();
      _lastNameController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Booking added successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding booking: $e')),
      );
    }
  }
}
