import 'package:flutter/material.dart';
import 'package:user_management/model/user_model.dart';

class UserDetailsScreen extends StatefulWidget {
  UserDetailsScreen({
    super.key,
    required this.userModel,
  });

  UserModel userModel;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: const Text(
              "User Name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              widget.userModel!.name.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            leading: const Icon(
              Icons.person,
              size: 34,
            ),
          ),
          ListTile(
            title: const Text(
              "Email",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              widget.userModel!.email.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            leading: const Icon(
              Icons.email,
              size: 34,
            ),
          ),
          ListTile(
            title: const Text(
              "Phone",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              widget.userModel!.phone.toString(),
              style: const TextStyle(fontSize: 16),
            ),
            leading: const Icon(
              Icons.phone,
              size: 34,
            ),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12),
            child: Text(
              "Address",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: const Text(
              "City",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              widget.userModel.address?.street ?? "",
              style: const TextStyle(fontSize: 16),
            ),
            leading: const Icon(
              Icons.location_city,
              size: 34,
            ),
          ),
          ListTile(
            title: const Text(
              "Street",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              widget.userModel.address?.city ?? "",
              style: const TextStyle(fontSize: 16),
            ),
            leading: const Icon(
              Icons.location_on,
              size: 34,
            ),
          ),
        ],
      ),
    );
  }
}
