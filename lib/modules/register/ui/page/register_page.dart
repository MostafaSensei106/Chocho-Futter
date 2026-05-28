import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:m3e_collection/m3e_collection.dart';

import '../../../home/ui/widgets/glass_app_bar.dart';
import '../../logic/cubit/register_cubit.dart';
import '../../logic/cubit/register_state.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF06060F),
      extendBodyBehindAppBar: true,
      appBar: const GlassAppBar(title: 'R E G I S T E R'),
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.3),
            radius: 0.9,
            colors: [Color(0xFF14093E), Color(0xFF08051E), Color(0xFF06060F)],
          ),
        ),
        child: SafeArea(
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              state.maybeWhen(
                success: (form, data) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Registration successful!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                failure: (form, error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(error),
                      backgroundColor: Colors.redAccent,
                    ),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Join the Cosmos',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFFE8D8FF),
                          fontSize: 28,
                          fontWeight: FontWeight.w300,
                          height: 1.3,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 40),

                      TextFormField(
                        initialValue: form.username,
                        onChanged: (value) => context
                            .read<RegisterCubit>()
                            .onUsernameChanged(value),
                        style: const TextStyle(color: Colors.white),
                        decoration: _inputDecoration(
                          'Username',
                          Icons.person_outline,
                        ),
                        enabled: !isLoading,
                      ),
                      const SizedBox(height: 20),

                      TextFormField(
                        key: ValueKey(form.deviceId),
                        initialValue: form.deviceId,
                        readOnly: true,
                        style: const TextStyle(color: Colors.white70),
                        decoration: _inputDecoration(
                          'Device ID (Auto-generated)',
                          Icons.devices,
                        ),
                        enabled: false,
                      ),
                      const SizedBox(height: 20),

                      Row(
                        children: [
                          Switch(
                            value: form.rememberMe,
                            onChanged: isLoading
                                ? null
                                : (value) => context
                                      .read<RegisterCubit>()
                                      .onRememberMeChanged(value),
                            activeColor: const Color(0xFFC8B4FF),
                          ),
                          const Text(
                            'Remember Me',
                            style: TextStyle(color: Color(0xFFB0A0E0)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFFC8B4FF),
                              ),
                            )
                          : ButtonM3E(
                              onPressed: form.isValid
                                  ? () =>
                                        context.read<RegisterCubit>().register()
                                  : null,
                              size: ButtonM3ESize.lg,
                              label: const Text('Register'),
                            ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Color(0xFF6A5A9A)),
      prefixIcon: Icon(icon, color: const Color(0xFF6A5A9A)),
      filled: true,
      fillColor: const Color(0xFF0E0B28).withValues(alpha: 0.5),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFF2A1F5A), width: 0.8),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFFC8B4FF), width: 1.2),
      ),
    );
  }
}
