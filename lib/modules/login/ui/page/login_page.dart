import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/app_bar/app_glass_app_bar.dart';
import '../../../../core/widgets/buttons/app_button.dart';
import '../../../../core/widgets/inputs/app_text_field.dart';
import '../../../../core/widgets/layout/app_background_container.dart';
import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppGlassAppBar(
        title: 'L O G I N',
        centerTitle: true,
      ),
      body: AppBackgroundContainer(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            state.maybeWhen(
              failure: (form, error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(error), backgroundColor: Colors.redAccent),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            final form = state.formState;
            final isLoading = state is Loading;

            return Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Welcome Back',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFE8D8FF),
                        fontSize: 32,
                        fontWeight: FontWeight.w200,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 48),
                    AppTextField(
                      label: 'Username',
                      prefixIcon: Icons.person_outline,
                      onChanged: (v) => context.read<LoginCubit>().onUsernameChanged(v),
                      enabled: !isLoading,
                    ),
                    const SizedBox(height: 20),
                    AppTextField(
                      key: ValueKey(form.deviceId),
                      label: 'Device ID (Auto-detected)',
                      initialValue: form.deviceId,
                      prefixIcon: Icons.devices,
                      readOnly: true,
                      enabled: false,
                    ),
                    const SizedBox(height: 40),
                    AppButton(
                      label: 'Login',
                      onPressed: form.isValid ? () => context.read<LoginCubit>().login() : null,
                      isLoading: isLoading,
                    ),
                    const SizedBox(height: 24),
                    TextButton(
                      onPressed: () {
                        // Navigate to register
                      },
                      child: const Text(
                        "Don't have an account? Register",
                        style: TextStyle(color: Color(0xFFC8B4FF)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
