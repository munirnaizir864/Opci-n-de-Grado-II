import 'dart:io';

import 'package:cruz_roja/domain/entities/dynamic_entity.dart';
import 'package:cruz_roja/domain/entities/user_entity.dart';
import 'package:cruz_roja/domain/usecases/auth_usecase.dart';
import 'package:cruz_roja/domain/usecases/user_usecase.dart';
import 'package:cruz_roja/global/utils.dart';
import 'package:cruz_roja/presentation/auth/login/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final UserUseCases userUseCases;
  final AuthUseCase loginUseCase;

  ProfileController({this.loginUseCase, this.userUseCases});

  Rx<UserEntity> user = UserEntity.empty().obs;
  RxInt documentTypeId = 0.obs;
  Rx<DynamicEntity> documentTypeEntity = Rx<DynamicEntity>();
  Rx<DynamicEntity> civilStatusEntity = Rx<DynamicEntity>();
  Rx<DynamicEntity> entailmentTypeEntity = Rx<DynamicEntity>();
  Rx<DynamicEntity> studyRankEntity = Rx<DynamicEntity>();
  Rx<DynamicEntity> positionEntity = Rx<DynamicEntity>();
  Rx<DynamicEntity> nativeLanguageEntity = Rx<DynamicEntity>();
  Rx<DynamicEntity> secondLanguageEntity = Rx<DynamicEntity>();
  Rx<DynamicEntity> voluntaryGroupEntity = Rx<DynamicEntity>();
  // RxList<TaskEntity> tasks = <TaskEntity>[].obs;
  // RxInt indexSelected = 0.obs;
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final documentTypeController = TextEditingController();
  RxInt documentType = 0.obs;
  final documentNumberController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  RxString auxDateOfBirth = ''.obs;
  final civilStatusController = TextEditingController();
  RxInt civilStatus = 0.obs;
  RxInt gender = 0.obs;
  final genderController = TextEditingController();
  final addressController = TextEditingController();
  final departmentController = TextEditingController();
  final cityController = TextEditingController();
  final homePhoneController = TextEditingController();
  final cellPhoneController = TextEditingController();
  final entailmentTypeController = TextEditingController();
  RxInt entailmentType = 0.obs;
  final dateOfEntryController = TextEditingController();
  RxString auxDateOfEntry = ''.obs;
  final studyRankController = TextEditingController();
  RxInt studyRank = 0.obs;
  final professionController = TextEditingController();
  final positionController = TextEditingController();
  RxInt position = 0.obs;
  RxInt nativeLanguage = 0.obs;
  RxInt secondLanguage = 0.obs;
  RxInt hasLicense = 0.obs;
  RxInt hasCertificate = 0.obs;
  RxInt isInsured = 0.obs;
  RxInt hasVisa = 0.obs;

  final nativeLanguageController = TextEditingController();
  final secondLanguageController = TextEditingController();
  final hasLicenseController = TextEditingController();
  final hasCertificateController = TextEditingController();
  final isInsuredController = TextEditingController();
  final driveLicenseTypeController = TextEditingController();
  final driveLicenseNumberController = TextEditingController();
  final passportNumberController = TextEditingController();
  final passportExpirationDateController = TextEditingController();
  RxString auxPassportExpirationDate = ''.obs;
  final hasVisaController = TextEditingController();
  final epsController = TextEditingController();
  final regimeController = TextEditingController();
  RxInt regime = 0.obs;
  RxString noCarne = ''.obs;
  final bloodTypeController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final hasGlassesController = TextEditingController();
  RxInt hasGlasses = 0.obs;
  RxInt carnetizado = 0.obs;
  RxBool passportUploaded = false.obs;

  final emergencyContactNameController = TextEditingController();
  final emergencyContactNumberController = TextEditingController();
  final emergencyContactAddressController = TextEditingController();

  int id = Get.find<LoginController>().userId.value;

  @override
  void onInit() {
    loadUser(id);
    super.onInit();
  }

  void loadUser(int userId) {
    loginUseCase.getUserFromId(userId).then((value) {
      user(value);
      initializeData(value);
      print(user);
    });
  }

  void updateIndex(RxInt groupValue, int index) {
    groupValue(index);
  }

  Future<bool> updateUser(UserEntity usuario) async {
    final result = await userUseCases.updateUser(usuario);
    loginUseCase.getUserFromId(usuario.id).then((value) {
      user(value);
      initializeData(value);
      print(user);
    });
    return result;
  }

  Future<bool> uploadPassport(
      File file, String documentNumber, String type) async {
    final value = await userUseCases.uploadPassport(file, documentNumber, type);
    return value['ok'];
    // passportUploaded.refresh();
  }

  void initializeData(UserEntity user) {
    nameController.text = user.name;
    surnameController.text = user.surname;
    noCarne(user.carneNumber);
    documentTypeController.text = user.documentType.toString();
    if (user.documentType != null) {
      documentTypeEntity(DynamicEntity(
        id: user.documentType,
        name: user.documentType == 1
            ? 'Cedula de ciudadania'
            : user.documentType == 2
                ? 'Pasaporte'
                : 'Cedula de extrangeria',
      ));
    } else {
      documentTypeEntity(null);
    }
    if (user.civilStatus != null) {
      civilStatusEntity(DynamicEntity(
        id: user.civilStatus,
        name: user.civilStatus == 1 ? 'Soltero(a)' : 'Casado(a)',
      ));
    } else {
      civilStatusEntity(null);
    }
    if (user.entailmentType != null) {
      entailmentTypeEntity(DynamicEntity(
        id: user.entailmentType,
        name: user.entailmentType == 1
            ? 'Juvenil'
            : user.entailmentType == 2
                ? 'Socorrista'
                : user.entailmentType == 3
                    ? 'Dama gris'
                    : user.entailmentType == 4
                        ? 'Infantil'
                        : user.entailmentType == 5
                            ? ' Prejuvenil'
                            : 'Apoyo',
      ));
    } else {
      entailmentTypeEntity(null);
    }
    if (user.studyRank != null) {
      studyRankEntity(DynamicEntity(
        id: user.studyRank,
        name: user.studyRank == 1
            ? 'Primaria'
            : user.studyRank == 2
                ? 'Bachillerato'
                : user.studyRank == 3
                    ? 'Tecnico'
                    : user.studyRank == 4
                        ? 'Tecnologico'
                        : 'Profesional',
      ));
    } else {
      studyRankEntity(null);
    }
    if (user.position != null) {
      positionEntity(DynamicEntity(
        id: user.position,
        name: user.position == 1
            ? 'Voluntario'
            : user.position == 2
                ? 'Directivo de grupo'
                : user.position == 3
                    ? 'Representante de grupo'
                    : user.position == 4
                        ? 'Miembro de junta'
                        : user.position == 5
                            ? 'Coordinador de estadísticas'
                            : 'Coordinador de grupo',
      ));
    } else {
      positionEntity(null);
    }
    if (user.nativeLanguage != null) {
      nativeLanguageEntity(DynamicEntity(
        id: user.nativeLanguage,
        name: user.nativeLanguage == 1
            ? 'Español'
            : user.nativeLanguage == 2
                ? 'Inglés'
                : 'Portugués',
      ));
    } else {
      nativeLanguageEntity(null);
    }
    if (user.secondLanguage != null) {
      secondLanguageEntity(DynamicEntity(
        id: user.secondLanguage,
        name: user.secondLanguage == 1
            ? 'Español'
            : user.secondLanguage == 2
                ? 'Inglés'
                : 'Portugués',
      ));
    } else {
      secondLanguageEntity(null);
    }
    if (user.documentType != null)
      documentNumberController.text = user.documentNumber;
    if (user.dateOfEntry != null)
      dateOfEntryController.text = dateFormat(user.dateOfEntry);
    if (user.dateOfBirth != null)
      dateOfBirthController.text = dateFormat(user.dateOfBirth);

    if (civilStatus.value != null) {
      civilStatus(user.civilStatus);
      //civilStatusController.text = 'Soltero';
    } else {
      civilStatus(null);
    }
    //civilStatusController.text = user.civilStatus.toString();
    genderController.text = user.gender.toString();
    if (user.dateOfBirth != null) auxDateOfBirth(user.dateOfBirth.toString());
    if (user.gender != null) {
      gender(user.gender);
    } else {
      gender(null);
    }
    addressController.text = user.address;
    departmentController.text = user.department;
    cityController.text = user.city;
    homePhoneController.text = user.homePhone;
    cellPhoneController.text = user.cellPhone;
    entailmentTypeController.text = user.entailmentType.toString();
    entailmentType(user.entailmentType);
    // if (user.dateOfEntry != null)
    //   dateOfEntryController.text = dateFormat(user.dateOfEntry);

    if (user.dateOfEntry != null) auxDateOfEntry(user.dateOfEntry.toString());
    studyRankController.text = user.studyRank.toString();
    studyRank(user.studyRank);
    professionController.text = user.profession;
    positionController.text = user.position.toString();
    position(user.position);
    nativeLanguageController.text = user.nativeLanguage.toString();
    nativeLanguage(user.nativeLanguage);
    secondLanguageController.text = user.secondLanguage.toString();
    secondLanguage(user.secondLanguage);

    hasLicenseController.text = user.hasLicense.toString();
    if (user.hasLicense != null) {
      hasLicense(user.hasLicense);
    } else {
      hasLicense(null);
    }
    hasCertificateController.text = user.hasCertificate.toString();
    if (user.hasCertificate != null) {
      hasCertificate(user.hasCertificate);
    } else {
      hasCertificate(null);
    }
    isInsuredController.text = user.isInsured.toString();
    if (user.isInsured != null) {
      isInsured(user.isInsured);
    } else {
      isInsured(null);
    }
    driveLicenseTypeController.text = user.driveLicenseType;
    driveLicenseNumberController.text = user.driveLicenseNumber;
    passportNumberController.text = user.passportNumber;
    if (user.passportExpirationDate != null)
      passportExpirationDateController.text =
          dateFormat(user.passportExpirationDate);
    if (user.passportExpirationDate != null)
      auxPassportExpirationDate(user.passportExpirationDate);
    hasVisaController.text = user.hasVisa.toString();
    if (user.hasVisa != null) {
      hasVisa(user.hasVisa);
    } else {
      hasVisa(null);
    }
    epsController.text = user.eps;
    regimeController.text = user.regime.toString();
    if (user.regime != null) {
      regime(user.regime);
    } else {
      regime(null);
    }
    bloodTypeController.text = user.bloodType;
    heightController.text = user.height;
    weightController.text = user.weight;
    hasGlassesController.text = user.name;
    if (user.regime != null) {
      hasGlasses(user.hasGlasses);
    } else {
      hasGlasses(null);
    }
    if (user.regime != null) {
      carnetizado(user.carnetizado);
    } else {
      carnetizado(null);
    }
    emergencyContactNameController.text = user.emergencyContactName;
    emergencyContactNumberController.text = user.emergencyContactNumber;
    emergencyContactAddressController.text = user.emergencyContactAddress;
  }
}
