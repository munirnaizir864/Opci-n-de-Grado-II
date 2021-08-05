import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String carneNumber;
  final String name;
  final String surname;
  final String email;
  final int documentType;
  final String documentNumber;
  final String dateOfBirth;
  final int civilStatus;
  final int gender;
  final String address;
  final String department;
  final String city;
  final String homePhone;
  final String cellPhone;
  final int entailmentType;
  final String dateOfEntry;
  final int studyRank;
  final String profession;
  final int position;
  final int nativeLanguage;
  final int secondLanguage;
  final int hasLicense; // yes no
  final int hasCertificate; // yes no
  final int isInsured; // yes no
  final String driveLicenseType;
  final String driveLicenseNumber;
  final String passportNumber;
  final String passportExpirationDate;
  final int hasVisa; // yes no
  final String eps;
  final int regime;
  final String bloodType;
  final String height;
  final String weight;
  final int voluntaryGroupId;
  final int carnetizado;
  final int status;
  final int hasGlasses; // yes no
  final String emergencyContactName; // yes no
  final String emergencyContactNumber; // yes no
  final String emergencyContactAddress; // yes no

  UserEntity(
      {this.id,
      this.carneNumber,
      this.name,
      this.surname,
      this.email,
      this.documentType,
      this.documentNumber,
      this.dateOfBirth,
      this.civilStatus,
      this.gender,
      this.address,
      this.department,
      this.city,
      this.homePhone,
      this.cellPhone,
      this.entailmentType,
      this.dateOfEntry,
      this.studyRank,
      this.profession,
      this.position,
      this.nativeLanguage,
      this.secondLanguage,
      this.hasLicense,
      this.hasCertificate,
      this.isInsured,
      this.driveLicenseType,
      this.driveLicenseNumber,
      this.passportNumber,
      this.passportExpirationDate,
      this.hasVisa,
      this.eps,
      this.regime,
      this.bloodType,
      this.height,
      this.weight,
      this.hasGlasses,
      this.emergencyContactName,
      this.emergencyContactNumber,
      this.emergencyContactAddress,
      this.voluntaryGroupId,
      this.carnetizado,
      this.status});

  factory UserEntity.empty() => UserEntity(
      id: null,
      name: null,
      carneNumber: null,
      surname: null,
      email: null,
      documentType: null,
      documentNumber: null,
      dateOfBirth: null,
      civilStatus: null,
      gender: null,
      address: null,
      department: null,
      city: null,
      homePhone: null,
      cellPhone: null,
      entailmentType: null,
      dateOfEntry: null,
      studyRank: null,
      profession: null,
      position: null,
      nativeLanguage: null,
      secondLanguage: null,
      hasLicense: null,
      hasCertificate: null,
      isInsured: null,
      driveLicenseType: null,
      driveLicenseNumber: null,
      passportNumber: null,
      passportExpirationDate: null,
      hasVisa: null,
      eps: null,
      regime: null,
      bloodType: null,
      height: null,
      weight: null,
      hasGlasses: null,
      emergencyContactName: null,
      emergencyContactNumber: null,
      emergencyContactAddress: null,
      carnetizado: null,
      voluntaryGroupId: null,
      status: null);

  @override
  List<Object> get props => [
        id,
        carneNumber,
        name,
        surname,
        email,
        documentType,
        documentNumber,
        dateOfBirth,
        civilStatus,
        gender,
        address,
        department,
        city,
        homePhone,
        cellPhone,
        entailmentType,
        dateOfEntry,
        studyRank,
        profession,
        position,
        nativeLanguage,
        secondLanguage,
        hasLicense,
        hasCertificate,
        isInsured,
        driveLicenseType,
        driveLicenseNumber,
        passportNumber,
        passportExpirationDate,
        hasVisa,
        eps,
        regime,
        bloodType,
        height,
        weight,
        hasGlasses,
        emergencyContactName,
        emergencyContactNumber,
        emergencyContactAddress,
        voluntaryGroupId,
        carnetizado,
        status
      ];
}
