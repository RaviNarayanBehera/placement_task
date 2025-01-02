import 'package:flutter/material.dart';
import 'package:placement_task/task_2/model/model.dart';

class UserDetailPage extends StatelessWidget {
  final User user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.firstName} ${user.lastName}'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: user.image.isNotEmpty
                        ? NetworkImage(user.image)
                        : const AssetImage('assets/placeholder.png') as ImageProvider,
                  ),
                ),
                const SizedBox(height: 20),
                _buildUserDetail('ID:', '${user.id}'),
                const SizedBox(height: 10),
                _buildUserDetail('Name:', '${user.firstName} ${user.lastName}'),
                const SizedBox(height: 10),
                _buildUserDetail('Age:', '${user.age}'),
                const SizedBox(height: 10),
                _buildUserDetail('Gender:', '${user.gender}'),
                const SizedBox(height: 10),
                _buildUserDetail('Phone:', '${user.phone}'),
                const SizedBox(height: 10),
                _buildUserDetail('Email:', '${user.email}'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUserDetail(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '$label ',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.teal,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 18,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
