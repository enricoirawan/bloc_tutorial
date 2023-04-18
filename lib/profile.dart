import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:you_app/bloc/profile_bloc/profile_bloc.dart';
import 'package:you_app/bloc/profile_new/profile_new_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool showAboutForm = false;
  final TextEditingController nameController = TextEditingController();
  final List<String> genderItems = [
    'Male',
    'Female',
  ];
  String selectedGender = "";

  // Widget _mainProfile() {
  //   return Container(
  //     height: 200,
  //     decoration: BoxDecoration(
  //       color: const Color(0xFF162329),
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: Stack(
  //       children: [
  //         BlocBuilder<ProfileBloc, ProfileState>(
  //           builder: (context, state) {
  //             if (state is ProfileLoaded) {
  //               return Positioned(
  //                 bottom: 17,
  //                 left: 13,
  //                 child: Text(
  //                   "${state.name} - ${state.gender}",
  //                   style: const TextStyle(
  //                     color: Colors.white,
  //                   ),
  //                 ),
  //               );
  //             }

  //             return const Positioned(
  //               bottom: 17,
  //               left: 13,
  //               child: Text(
  //                 "@johndoe123",
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                 ),
  //               ),
  //             );
  //           },
  //         )
  //       ],
  //     ),
  //   );
  //
  // }

  Widget _mainProfile() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF162329),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          BlocBuilder<ProfileNewBloc, ProfileNewState>(
            builder: (context, state) {
              if (state.status == "LOADED") {
                return Positioned(
                  bottom: 17,
                  left: 13,
                  child: Text(
                    "${state.name} - ${state.gender}",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                );
              }

              return const Positioned(
                bottom: 17,
                left: 13,
                child: Text(
                  "@johndoe123",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Widget _about() {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 120,
      margin: const EdgeInsets.only(top: 24),
      decoration: const BoxDecoration(
        color: Color(0xFF0E191F),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "About",
                style: TextStyle(color: Colors.white),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    showAboutForm = true;
                  });
                },
                icon: const Icon(Icons.edit, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Add in your your to help others know you better",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _interest() {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 120,
      margin: const EdgeInsets.only(top: 24),
      decoration: const BoxDecoration(
        color: Color(0xFF0E191F),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Interest",
                style: TextStyle(color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.edit, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Add in your interest to find a better match",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _aboutForm() {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 200,
      margin: const EdgeInsets.only(top: 24),
      decoration: const BoxDecoration(
        color: Color(0xFF0E191F),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "About",
                style: TextStyle(color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showAboutForm = false;
                  });
                  // context.read<ProfileBloc>().add(UpdateProfileEvent(
                  //       name: nameController.text,
                  //       gender: selectedGender,
                  //     ));
                  context.read<ProfileNewBloc>().add(UpdateProfileNewEvent(
                        name: nameController.text,
                        gender: selectedGender,
                      ));
                },
                child: const Text(
                  "Save and Update",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text(
                "Display name",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text(
                "Gender",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: DropdownButtonFormField2(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                  isExpanded: true,
                  hint: const Text(
                    'Select Your Gender',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: genderItems
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select gender.';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                  onSaved: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    height: 60,
                    padding: EdgeInsets.only(left: 20, right: 10),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 30,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09141A),
      appBar: AppBar(
        title: const Text("@johndoe123"),
        backgroundColor: const Color(0xFF09141A),
        centerTitle: true,
        leading: Row(
          children: const [
            Icon(Icons.chevron_left),
            Text("Back"),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            _mainProfile(),
            showAboutForm ? _aboutForm() : _about(),
            _interest(),
          ],
        ),
      ),
    );
  }
}
