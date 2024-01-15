
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_management/model/user_model.dart';
import 'package:user_management/provider/user_provider.dart';
import 'package:user_management/ui/user_details_screen.dart';



class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late final UserProvider userProvider;
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(24),
            bottomLeft: Radius.circular(24),
          ),
        ),
        backgroundColor: Colors.blue,
        title: const Text(
          'User Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
              decoration:  InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search by UserName',
              ),
            ),
          ),
          Expanded(
            child: Consumer<UserProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.userList.length,
                  itemBuilder: (context, index) {
                    UserModel user = provider.userList[index];
                    if (searchQuery.isEmpty ||
                        user.username.toString().toLowerCase().contains(searchQuery)) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserDetailsScreen(
                                  userModel: user,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.username.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(user.email.toString()),
                                  const Spacer(),
                                  const Icon(Icons.arrow_forward_ios)
                                ],
                              ),
                              Text(user.phone.toString()),
                              const Divider(),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }

                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}