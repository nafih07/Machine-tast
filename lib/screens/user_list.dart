import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:machine_test/generated/l10n.dart';
import 'package:machine_test/helper/helper.dart';
import 'package:machine_test/model/model.dart';
import 'package:machine_test/resources/resources.dart';
import 'package:machine_test/riverpod/state_providers/state_provider.dart';
import 'package:machine_test/screens/login.dart';
import 'package:machine_test/widget/app_bar.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      bool loaderState = watch(loaderIndicatorProvider);
      List<User> contacts = watch(contactProvider);

      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBarWidget(title: "Users", actions: [
            IconButton(
                onPressed: () => Screens.pushReplacement(context, Login()),
                icon: Icon(Icons.logout, color: Colors.red, size: 40))
          ]),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildListViewWidget(contacts),
              ]));
    });
  }

  @override
  void initState() {
    Future.delayed(
        Duration.zero,
        () => context.read(contactProvider.notifier).fetchUsers(
            onComplete: (value) =>
                GenericFunctions.showToastBar(value, context)));
    super.initState();
  }

  Widget _buildListViewWidget(List<User> contacts) => ListView.builder(
      itemCount: contacts.length,
      shrinkWrap: true,
      itemBuilder: (context, index) =>
          GestureDetector(child: _buildListItemWidget(contacts[index])));

  Widget _buildListItemWidget(User contact) {
    return Column(children: [
      Container(
          child: ListTile(
              title: Text(contact.firstName ?? "",
                  style: AppTextStyles.mediumTextStyle(
                      16, AppColors.primaryTextColor)),
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(22),
                  child: GenericWidgets.buildCachedNetworkImage(
                      height: 45, width: 45, imageURL: contact.avatar ?? "")),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(contact.email ?? "",
                      style: AppTextStyles.regularTextStyle(
                          13, AppColors.hintColor)),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: AppColors.lightGrey,
                    height: 5,
                    thickness: .15,
                  )
                ],
              ))),
    ]);
  }
}
