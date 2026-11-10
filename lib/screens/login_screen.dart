import 'package:flutter/material.dart';

import '../theme/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedRole = 'Citizen';
  bool obscurePassword = true;
  bool rememberMe = false;

  final TextEditingController mobileController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  @override
  void dispose() {
    mobileController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // ------------------------------------------------------------
  // ROLE INFORMATION
  // ------------------------------------------------------------

  String get roleDescription {
    switch (selectedRole) {
      case 'Worker':
        return 'Manage your services, bookings and availability';

      case 'Cooperative':
        return 'Manage workers, operations and cooperative services';

      case 'Citizen':
      default:
        return 'Find and book verified local service workers';
    }
  }

  IconData get roleIcon {
    switch (selectedRole) {
      case 'Worker':
        return Icons.engineering_outlined;

      case 'Cooperative':
        return Icons.account_balance_outlined;

      case 'Citizen':
      default:
        return Icons.person_outline;
    }
  }

  Color get roleColor {
    switch (selectedRole) {
      case 'Worker':
        return const Color(0xFFE86A2A);

      case 'Cooperative':
        return const Color(0xFF159447);

      case 'Citizen':
      default:
        return AppColors.primaryBlue;
    }
  }

  Color get roleBackground {
    switch (selectedRole) {
      case 'Worker':
        return const Color(0xFFFFEBDD);

      case 'Cooperative':
        return const Color(0xFFE7F7EC);

      case 'Citizen':
      default:
        return const Color(0xFFE7F1FF);
    }
  }

  // ------------------------------------------------------------
  // BUILD
  // ------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
            18,
            18,
            18,
            24,
          ),
          child: Column(
            children: [
              _topBranding(),

              const SizedBox(height: 28),

              _welcomeSection(),

              const SizedBox(height: 24),

              _roleSelector(),

              const SizedBox(height: 22),

              _loginCard(),

              const SizedBox(height: 22),

              _registerSection(),

              const SizedBox(height: 18),

              _footer(),
            ],
          ),
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // TOP BRANDING
  // ------------------------------------------------------------

  Widget _topBranding() {
    return Column(
      children: [
        Container(
          width: 78,
          height: 78,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFDCE5EF),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x12000000),
                blurRadius: 16,
                offset: Offset(0, 6),
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Icons.account_balance,
              size: 43,
              color: AppColors.darkBlue,
            ),
          ),
        ),

        const SizedBox(height: 13),

        const Text(
          'Cooperative Services',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w800,
            color: AppColors.darkBlue,
          ),
        ),

        const SizedBox(height: 3),

        const Text(
          'Cooperative Gig Services Platform',
          style: TextStyle(
            fontSize: 9.5,
            color: AppColors.textGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // WELCOME
  // ------------------------------------------------------------

  Widget _welcomeSection() {
    return Column(
      children: [
        const Text(
          'Welcome Back',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.w800,
            color: AppColors.textDark,
          ),
        ),

        const SizedBox(height: 7),

        const Text(
          'Login to continue to your account',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            color: AppColors.textGrey,
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // ROLE SELECTOR
  // ------------------------------------------------------------

  Widget _roleSelector() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          _roleTab('Citizen'),
          _roleTab('Worker'),
          _roleTab('Cooperative'),
        ],
      ),
    );
  }

  Widget _roleTab(String role) {
    final bool selected = selectedRole == role;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedRole = role;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(
            vertical: 11,
            horizontal: 4,
          ),
          decoration: BoxDecoration(
            color: selected
                ? roleColor
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            role,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              color: selected
                  ? Colors.white
                  : AppColors.textGrey,
            ),
          ),
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // LOGIN CARD
  // ------------------------------------------------------------

  Widget _loginCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.border,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x08000000),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _selectedRoleHeader(),

          const SizedBox(height: 20),

          const Text(
            'Mobile Number',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),

          const SizedBox(height: 7),

          _mobileField(),

          const SizedBox(height: 15),

          const Text(
            'Password',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: AppColors.textDark,
            ),
          ),

          const SizedBox(height: 7),

          _passwordField(),

          const SizedBox(height: 12),

          _rememberForgotRow(),

          const SizedBox(height: 20),

          _loginButton(),
        ],
      ),
    );
  }

  // ------------------------------------------------------------
  // SELECTED ROLE HEADER
  // ------------------------------------------------------------

  Widget _selectedRoleHeader() {
    return Row(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: roleBackground,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            roleIcon,
            color: roleColor,
            size: 25,
          ),
        ),

        const SizedBox(width: 11),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$selectedRole Login',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                roleDescription,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 8.5,
                  color: AppColors.textGrey,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // MOBILE FIELD
  // ------------------------------------------------------------

  Widget _mobileField() {
    return TextField(
      controller: mobileController,
      keyboardType: TextInputType.phone,
      style: const TextStyle(
        fontSize: 11,
        color: AppColors.textDark,
      ),
      decoration: InputDecoration(
        hintText: 'Enter mobile number',
        hintStyle: const TextStyle(
          fontSize: 10,
          color: Color(0xFF98A2B3),
        ),
        prefixIcon: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '+91',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),
              SizedBox(width: 8),
              SizedBox(
                height: 20,
                child: VerticalDivider(
                  width: 1,
                  color: AppColors.border,
                ),
              ),
            ],
          ),
        ),
        prefixIconConstraints: const BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
        filled: true,
        fillColor: const Color(0xFFFAFBFC),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 13,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: AppColors.border,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: AppColors.border,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide(
            color: roleColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // PASSWORD FIELD
  // ------------------------------------------------------------

  Widget _passwordField() {
    return TextField(
      controller: passwordController,
      obscureText: obscurePassword,
      style: const TextStyle(
        fontSize: 11,
        color: AppColors.textDark,
      ),
      decoration: InputDecoration(
        hintText: 'Enter password',
        hintStyle: const TextStyle(
          fontSize: 10,
          color: Color(0xFF98A2B3),
        ),
        prefixIcon: const Icon(
          Icons.lock_outline,
          size: 18,
          color: AppColors.textGrey,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              obscurePassword = !obscurePassword;
            });
          },
          icon: Icon(
            obscurePassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            size: 18,
            color: AppColors.textGrey,
          ),
        ),
        filled: true,
        fillColor: const Color(0xFFFAFBFC),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 13,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: AppColors.border,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: const BorderSide(
            color: AppColors.border,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9),
          borderSide: BorderSide(
            color: roleColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // REMEMBER + FORGOT
  // ------------------------------------------------------------

  Widget _rememberForgotRow() {
    return Row(
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: Checkbox(
            value: rememberMe,
            onChanged: (value) {
              setState(() {
                rememberMe = value ?? false;
              });
            },
            activeColor: roleColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),

        const SizedBox(width: 5),

        const Text(
          'Remember me',
          style: TextStyle(
            fontSize: 8.5,
            color: AppColors.textGrey,
          ),
        ),

        const Spacer(),

        GestureDetector(
          onTap: () {},
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              fontSize: 8.5,
              fontWeight: FontWeight.w700,
              color: roleColor,
            ),
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // LOGIN BUTTON
  // ------------------------------------------------------------

  Widget _loginButton() {
    return SizedBox(
      width: double.infinity,
      height: 46,
      child: ElevatedButton(
        onPressed: _handleLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: roleColor,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.4,
              ),
            ),
            const SizedBox(width: 7),
            const Icon(
              Icons.arrow_forward,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }

  // ------------------------------------------------------------
  // REGISTER
  // ------------------------------------------------------------

  Widget _registerSection() {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: AppColors.border,
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                'OR',
                style: TextStyle(
                  fontSize: 8,
                  color: AppColors.textGrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const Expanded(
              child: Divider(
                color: AppColors.border,
              ),
            ),
          ],
        ),

        const SizedBox(height: 15),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Don't have an account? ",
              style: TextStyle(
                fontSize: 9,
                color: AppColors.textGrey,
              ),
            ),

            GestureDetector(
              onTap: () {},
              child: Text(
                'Register',
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w800,
                  color: roleColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // FOOTER
  // ------------------------------------------------------------

  Widget _footer() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.verified_user_outlined,
              size: 13,
              color: AppColors.green,
            ),
            const SizedBox(width: 5),
            Text(
              'Secure & trusted cooperative platform',
              style: const TextStyle(
                fontSize: 8,
                color: AppColors.textGrey,
              ),
            ),
          ],
        ),

        const SizedBox(height: 6),

        const Text(
          'Cooperative Services • Coimbatore, Tamil Nadu',
          style: TextStyle(
            fontSize: 7.5,
            color: Color(0xFF98A2B3),
          ),
        ),
      ],
    );
  }

  // ------------------------------------------------------------
  // LOGIN ACTION
  // ------------------------------------------------------------

  void _handleLogin() {
    FocusScope.of(context).unfocus();

    if (mobileController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter your mobile number and password.',
          ),
        ),
      );
      return;
    }

    if (selectedRole == 'Citizen') {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/',
        (route) => false,
      );
    } else if (selectedRole == 'Worker') {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/worker-dashboard',
        (route) => false,
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/cooperative-dashboard',
        (route) => false,
      );
    }
  }
}