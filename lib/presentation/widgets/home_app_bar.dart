import 'package:fast8_payuung/domain/entities/user.dart';
import 'package:fast8_payuung/exports.dart';
import 'package:fast8_payuung/presentation/bloc/user_bloc.dart';
import 'package:fast8_payuung/presentation/pages/user_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  String _getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 11) return 'Selamat Pagi';
    if (hour < 15) return 'Selamat Siang';
    if (hour < 19) return 'Selamat Sore';

    return 'Selamat Malam';
  }

  @override
  Widget build(BuildContext context) {
    final greeting = _getGreeting();

    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      title: Text(
        greeting,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
        ),
      ),
      actions: [
        const Icon(
          Icons.notifications,
          color: Colors.white,
          size: 24,
        ),
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            User? user;

            if (state is GetUserDetailsState && state.isLoaded) {
              user = state.user;
            } else if (state is UpdateUserProfileState && state.isLoaded) {
              user = state.user;
            }

            return InkWell(
              onTap: user != null
                  ? () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => UserPage(user: user!)))
                  : null,
              child: const Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 48,
              ),
            );
          },
        ),
        10.w.width,
      ],
    );
  }
}
