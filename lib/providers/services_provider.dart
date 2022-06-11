import 'package:flutter/material.dart';
import 'package:tire_manager/models/service.dart';

import '../datasources/local_datasource.dart';

class ServicesProvider extends ChangeNotifier {
  final LocalDatasource datasource;

  ServicesProvider({required this.datasource});

  List<Service> get services => datasource.services;

  void addService(Service service) {
    datasource.addService(service);
    notifyListeners();
  }

  void editService(Service service) {
    datasource.updateService(service);
    notifyListeners();
  }

  void deleteService(Service service) {
    datasource.deleteService(service.id!);
  }
}
