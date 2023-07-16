import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/home_provider.dart';
import 'package:task/screen/home/widgets/usecard_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final userViewModel = Provider.of<UserViewModel>(context, listen: false);
      userViewModel.fetchUsers();
    });
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (userViewModel.isLoading)
              const CircularProgressIndicator()
            else if (userViewModel.error != null)
              Text(userViewModel.error!)
            else if (userViewModel.users != null)
              _cardList(userViewModel),
          ],
        ),
      ),
    );
  }

  ListView _cardList(UserViewModel userViewModel) {
    return ListView.builder(
      itemCount: userViewModel.users?.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var user = userViewModel.users![index];
        return UserCardView(user: user);
      },
    );
  }
}