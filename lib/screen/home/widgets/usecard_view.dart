import 'package:flutter/material.dart';
import 'package:task/model/user_model.dart';

class UserCardView extends StatelessWidget {
  const UserCardView({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${user.fname} ${user.lname}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text('Email: ${user.email}'),
            const SizedBox(height: 8.0),
            Text('Phone Number: ${user.phone}'),
          ],
        ),
      ),
    );
  }
}

