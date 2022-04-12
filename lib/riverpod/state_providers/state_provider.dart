import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:machine_test/model/model.dart';
import 'package:machine_test/riverpod/service_providers/contact_service.dart';
import 'package:machine_test/riverpod/service_providers/service.dart';
import 'package:machine_test/riverpod/service_providers/validation_service.dart';
import 'package:machine_test/riverpod/states/states.dart';

final loaderIndicatorProvider =
    StateNotifierProvider<LoaderIndicatorService, bool>(
        (ref) => LoaderIndicatorService());

final validationProvider =
    StateNotifierProvider<ValidationService, ValidationState>(
        (ref) => ValidationService());

final userProvider =
    StateNotifierProvider<UserService, User>((ref) => UserService());

final contactProvider = StateNotifierProvider<ContactService, List<User>>(
    (ref) => ContactService());


final bottomNavigationProvider =
    StateNotifierProvider<BottomNavigationService, int>(
        (ref) => BottomNavigationService());
