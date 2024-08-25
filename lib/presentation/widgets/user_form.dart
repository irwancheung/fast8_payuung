import 'package:fast8_payuung/core/widgets/app_date_time_picker.dart';
import 'package:fast8_payuung/core/widgets/app_dropdown_menu.dart';
import 'package:fast8_payuung/core/widgets/app_elevated_button.dart';
import 'package:fast8_payuung/core/widgets/app_text_field.dart';
import 'package:fast8_payuung/core/widgets/loading_indicator.dart';
import 'package:fast8_payuung/domain/entities/user.dart';
import 'package:fast8_payuung/domain/use_cases/update_user_profile.dart';
import 'package:fast8_payuung/exports.dart';
import 'package:fast8_payuung/presentation/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class UserForm extends StatefulWidget {
  final User user;
  const UserForm({super.key, required this.user});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  static const String _nameField = 'name';
  static const String _dobField = 'dob';
  static const String _genderField = 'gender';
  static const String _emailField = 'email';
  static const String _phoneField = 'phone';
  static const String _educationField = 'education';
  static const String _maritalStatusField = 'marital_status';

  final _formKey = GlobalKey<FormBuilderState>();
  final _step = ValueNotifier<int>(0);

  late final User _user;
  late final FormBuilderState _form;

  @override
  void initState() {
    super.initState();

    _user = widget.user;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _form = _formKey.currentState!;
    });
  }

  void _submit() {
    final canSubmit = _form.saveAndValidate(focusOnInvalid: false);

    if (canSubmit) {
      final name = _form.getTransformedValue(_nameField) as String;
      final dob = _form.getTransformedValue(_dobField) as DateTime;
      final gender = _form.getTransformedValue(_genderField) as String;
      final email = _form.getTransformedValue(_emailField) as String;
      final phone = _form.getTransformedValue(_phoneField) as String;
      final education = _form.getTransformedValue(_educationField) as String;
      final maritalStatus = _form.getTransformedValue(_maritalStatusField) as String;

      context.read<UserBloc>().add(
            UpdateUserProfileEvent(
              UpdateUserProfileParams(
                name: name,
                dob: dob,
                gender: gender,
                email: email,
                phone: phone,
                education: education,
                maritalStatus: maritalStatus,
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: ValueListenableBuilder(
        valueListenable: _step,
        builder: (BuildContext context, int value, Widget? child) {
          return Stepper(
            currentStep: value,
            type: StepperType.horizontal,
            elevation: 0,
            stepIconMargin: EdgeInsets.zero,
            stepIconHeight: 48.r,
            stepIconWidth: 48.r,
            connectorColor: const WidgetStatePropertyAll(Color(0xfffbc73d)),
            connectorThickness: 3.r,
            controlsBuilder: (BuildContext context, ControlsDetails details) => shrinkBox,
            onStepTapped: (int index) => _step.value = index,
            steps: <Step>[
              Step(
                title: shrinkBox,
                isActive: true,
                content: SizedBox(
                  child: Column(
                    children: [
                      AppTextField(
                        name: _nameField,
                        label: 'NAMA LENGKAP',
                        initialValue: _user.name,
                        isRequired: true,
                        maxLength: 50,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      16.h.height,
                      AppDateTimePicker(
                        name: _dobField,
                        label: 'TANGGAL LAHIR',
                        initialValue: _user.dob,
                        isRequired: true,
                      ),
                      16.h.height,
                      AppDropdownMenu(
                        name: _genderField,
                        label: 'JENIS KELAMIN',
                        value: _user.gender,
                        isRequired: true,
                        items: const [
                          DropdownMenuItem(
                            value: 'Laki-laki',
                            child: Text('Laki-laki'),
                          ),
                          DropdownMenuItem(
                            value: 'Perempuan',
                            child: Text('Perempuan'),
                          ),
                        ],
                      ),
                      16.h.height,
                      AppTextField(
                        name: _emailField,
                        label: 'ALAMAT EMAIL',
                        initialValue: _user.email,
                        isRequired: true,
                        maxLength: 50,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.email(),
                        ]),
                      ),
                      16.h.height,
                      AppTextField(
                        name: _phoneField,
                        label: 'NO. HP',
                        initialValue: _user.phone,
                        isRequired: true,
                        maxLength: 50,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                      ),
                      16.h.height,
                      AppDropdownMenu(
                        name: _educationField,
                        label: 'PENDIDIKAN',
                        value: _user.education,
                        items: const [
                          DropdownMenuItem(
                            value: 'SD',
                            child: Text('SD'),
                          ),
                          DropdownMenuItem(
                            value: 'SMP',
                            child: Text('SMP'),
                          ),
                          DropdownMenuItem(
                            value: 'SMA',
                            child: Text('SMA'),
                          ),
                          DropdownMenuItem(
                            value: 'S1',
                            child: Text('S1'),
                          ),
                        ],
                      ),
                      16.h.height,
                      AppDropdownMenu(
                        name: _maritalStatusField,
                        label: 'STATUS PERNIKAHAN',
                        value: _user.maritalStatus,
                        items: const [
                          DropdownMenuItem(
                            value: 'Belum Kawin',
                            child: Text('Belum Kawin'),
                          ),
                          DropdownMenuItem(
                            value: 'Kawin',
                            child: Text('Kawin'),
                          ),
                          DropdownMenuItem(
                            value: 'Janda',
                            child: Text('Janda'),
                          ),
                          DropdownMenuItem(
                            value: 'Duda',
                            child: Text('Duda'),
                          ),
                        ],
                      ),
                      16.h.height,
                      BlocConsumer<UserBloc, UserState>(
                        listener: (context, state) {
                          if (state is UpdateUserProfileState) {
                            if (state.isLoaded) {
                              context.showSuccessSnackBar('Biodata berhasil tersimpan');
                            }

                            if (state.isError) {
                              context.showErrorSnackBar(state.errorMessage!);
                            }
                          }
                        },
                        builder: (context, state) {
                          if (state is UpdateUserProfileState && state.isLoading) {
                            return const LoadingIndicator();
                          }

                          return AppElevatedButton(text: 'Selanjutnya', onPressed: _submit);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Step(
                title: shrinkBox,
                content: Text('Content for Step 2'),
              ),
              const Step(
                title: shrinkBox,
                content: Text('Content for Step 3'),
              ),
            ],
          );
        },
      ),
    );
  }
}
