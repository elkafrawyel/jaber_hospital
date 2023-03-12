import 'package:flutter/material.dart';

import '../../general/models/notifications_response.dart';
import '../models/comp_home_orders_response.dart';
import '../models/instruments_response.dart';
import '../models/orders_response.dart';
import 'CompanyHttpMethods.dart';


class CompanyRepository {
  late BuildContext _context;
  late CompanyHttpMethods _companyHttpMethods;

  CompanyRepository(BuildContext context) {
    _context = context;
    _companyHttpMethods =  CompanyHttpMethods(_context);
  }

  Future<CompOrdersResponse?> getCompHomeOrders()=> _companyHttpMethods.fetchCompHomeOrders();

  Future<bool> updateCompProfile(Map<String, dynamic> body)=> _companyHttpMethods.updateCompanyProfile(body);

  Future<OrdersResponse?> getCompInstrumentsOrders()=> _companyHttpMethods.fetchCompInstrumentsOrders();

  Future<OrdersResponse?> getCompMedicationOrders()=> _companyHttpMethods.fetchCompMedicationOrders();

  Future<InstrumentsResponse?> getCompInstruments()=> _companyHttpMethods.fetchCompInstruments();
  Future<NotificationsResponse?> getCompNotifications()=> _companyHttpMethods.fetchCompNotifications();
}
