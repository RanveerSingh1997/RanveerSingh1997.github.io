import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furnizor/Modals/furnizorModal.dart';
import 'package:furnizor/Utils/utils.dart';

class DataProvider extends ChangeNotifier {

  FurnizorFormModel _formModel=FurnizorFormModel();
  var _currentIndex = 0;
  List<Benefits> _benefits = <Benefits>[
    Benefits(title: "High Speed Wi-Fi"),
    Benefits(title: "Cafeteria"),
    Benefits(title: "Meeting & Conference Rooms"),
    Benefits(title: "Centralised AC"),
    Benefits(title: "Safety Lockers"),
    Benefits(title: "CCTV"),
    Benefits(title: "Parking"),
    Benefits(title: "Suitable for Freelancers"),
  ];

  List<SpaceType> _spaceTypeList = <SpaceType>[
    SpaceType(
      title: "Private Desk",
      image: "office1.jpg",
      subtitle: "Any Sized Teams an office for startup and Corporate",
    ),
    SpaceType(
      title: "Dedicated Office",
      image: "office2.jpg",
      subtitle: "Shared Office for teams and Individual",
    ),
    SpaceType(
      title: "Hot Desk",
      image: "office3.jpg",
      subtitle:
          "Dynamic Desk that are designed for professionals  to work and connect",
    ),
  ];

  get currentIndex => _currentIndex;

  set currentIndex(value) {
    _currentIndex = value;
    notifyListeners();
  }

  List<SpaceType> get spaceTypeList{
    return  _spaceTypeList;
  }

  set spaceTypeList(List<SpaceType> value) {
    _spaceTypeList = value;
    notifyListeners();
  }

  List<Benefits> get benefits => _benefits;

  set benefits(List<Benefits> value) {
    _benefits = value;
    notifyListeners();
  }

  FurnizorFormModel get formModel => _formModel;

  set formModel(FurnizorFormModel value) {
    _formModel = value;
    notifyListeners();
  }
}
