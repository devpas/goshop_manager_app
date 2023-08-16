import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../src/core/handlers/handlers.dart';
import '../../../models/models.dart';
import '../../../repository/customers_repository.dart';
import '../../states/states.dart';

class CustomersNotifier extends StateNotifier<CustomersState> {
  CustomersNotifier(this._customersRepository)
      : super(
          const CustomersState(),
        );

  final CustomersRepository _customersRepository;

  Future<void> fetchListCustomers() async {
    final response = await _customersRepository.getListCustomers("");
    response.when(
      success: (data) async {
        state = state.copyWith(customers: data.customers);
      },
      failure: (failure) {
        if (failure == const NetworkExceptions.unauthorisedRequest()) {
          debugPrint('==> get brands failure: $failure');
        }
      },
    );
  }

  Future<void> fetchListShops() async {
    final response = await _customersRepository.getListShops("");
    response.when(
      success: (data) async {
        state = state.copyWith(shops: data.shops);
      },
      failure: (failure) {
        if (failure == const NetworkExceptions.unauthorisedRequest()) {
          debugPrint('==> get brands failure: $failure');
        }
      },
    );
  }

  void selectCustomer(CustomerData customer) {
    state = state.copyWith(customerSelected: customer);
  }
}
