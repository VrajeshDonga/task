import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/home_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    super.initState();
    // userViewModel = Provider.of<UserViewModel>(context);

  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (userViewModel.isLoading)
              const CircularProgressIndicator()
            else if (userViewModel.error != null)
              Text(userViewModel.error!)
            else if (userViewModel.user != null)
                Column(
                  children: [
                    Text('Name: ${userViewModel.user!.fname} ${userViewModel.user!.lname}'),
                    Text('Email: ${userViewModel.user!.email}'),
                    Text('Phone Number: ${userViewModel.user!.phone}'),
                  ],
                ),
            ElevatedButton(
              onPressed: () => userViewModel.fetchUser(),
              child: const Text('Fetch User'),
            ),
          ],
        ),
      ),
    );
  }
}
