import 'package:fast8_payuung/domain/entities/user.dart';
import 'package:fast8_payuung/exports.dart';
import 'package:fast8_payuung/presentation/widgets/user_form.dart';

class UserPage extends StatelessWidget {
  final User user;

  const UserPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Pribadi'),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: UserForm(user: user),
    );
  }
}
