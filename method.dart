import 'dart:io';

// Take Double Input Method
double getDoubleInput({required String text}) {
  print('Enter The $text');
  double result;
  final input = stdin.readLineSync();
  if (input == null || input.isEmpty) {
    print('Invalid $text  input.');
    return 0;
  } else
    result = double.tryParse(input) ?? 0.0;
  return result;
}

// Take Properties Input
double getPropertiesInput({
  required String text,
  required value,
}) {
  print('Enter The $text [-1] Default Value');
  double result;
  final input = stdin.readLineSync();
  if (input == null || input.isEmpty) {
    print('Invalid $text  input.');
    return 0.0;
  } else if (input == -1) {
    result = value;
  } else
    result = double.tryParse(input) ?? 0.0;
  return result;
}

void ChangePropertiesValue({
  double V = 100,
  double S = 30,
  double CD0 = 0.025,
  double AR = 9.0,
  double e = 0.82,
  double weight = 40000,
  double rho = 1.058,
}) {
  V = getPropertiesInput(text: 'Velocity [V]', value: V);
  S = getPropertiesInput(
    text: 'Surface area [S]',
    value: S,
  );
  CD0 = getPropertiesInput(
    text: 'Zero-lift[parasite] drag coefficient',
    value: CD0,
  );
  AR = getPropertiesInput(text: 'Aspect ratio', value: AR);
  e = getPropertiesInput(
    text: 'Oswald efficiency factor [e]',
    value: e,
  );
  weight = getPropertiesInput(
    text: 'Weight Of A/C (N)',
    value: weight,
  );
  rho = getPropertiesInput(
    text: 'Air density (kg/m³)',
    value: rho,
  );
}

// ---- Main Menu
double displayMenuAndGetChoice() {
  print('\n=== AIRCRAFT PERFORMANCE CALCULATOR ===');
  print('\n[1] Use Default Parameters:');
  print('----------------------------------------');
  print('Velocity (V)     : 100 m/s');
  print('Surface Area (S) : 30 m²');
  print('Zero-lift Drag (CD0) : 0.025');
  print('Aspect Ratio (AR)    : 9.0');
  print('Oswald Factor (e)    : 0.82');
  print('Aircraft Weight      : 40000 N');
  print('Air Density (ρ)      : 1.058 kg/m³');
  print('----------------------------------------');
  print('[2] Enter Custom Parameters');
  print('----------------------------------------');
  print('[-1] Exit Program');
  print('========================================');
  print('\nPlease select an option [1, 2, or -1]:');
  return getDoubleInput(text: 'Choice');
}

// Display Method
void printFlightData({
  required double left_L,
  required double thrustAvailable_TA,
  required double powerAvailable_PA,
  required double parasiteDrag_Do,
  required double inducedDrag_Di,
  required double totalDrag_D,
  required double thrustRequired_TR,
  required double powerRequired_PR,
  required double excessThrust_ET,
  required double excessPower_EP,
  required double weight,
  required double rateOfClimb_Thrust,
  required double rateOfClimb_Power,
  required double altitude,
}) {
  print('\n=== Flight Data ===');
  print('Altitude: ${altitude.toStringAsFixed(2)} m');
  print('Lift (L): ${left_L.toStringAsFixed(2)} N');
  print(
    'Thrust Available (TA): ${thrustAvailable_TA.toStringAsFixed(2)} N',
  );
  print(
    'Power Available (PA): ${powerAvailable_PA.toStringAsFixed(2)} W',
  );
  print(
    'Parasite Drag (Do): ${parasiteDrag_Do.toStringAsFixed(2)} N',
  );
  print(
    'Induced Drag (Di): ${inducedDrag_Di.toStringAsFixed(2)} N',
  );
  print(
    'Total Drag (D): ${totalDrag_D.toStringAsFixed(2)} N',
  );
  print(
    'Thrust Required (TR): ${thrustRequired_TR.toStringAsFixed(2)} N',
  );
  print(
    'Power Required (PR): ${powerRequired_PR.toStringAsFixed(2)} W',
  );
  print(
    'Excess Thrust (ET): ${excessThrust_ET.toStringAsFixed(2)} N',
  );
  print(
    'Excess Power (EP): ${excessPower_EP.toStringAsFixed(2)} W',
  );
  print('Weight: ${weight.toStringAsFixed(2)} N');
  print(
    'Rate of Climb (Thrust): ${rateOfClimb_Thrust.toStringAsFixed(2)} m/s',
  );
  print(
    'Rate of Climb (Power): ${rateOfClimb_Power.toStringAsFixed(2)} m/s',
  );
  print(
    '====================================================n',
  );
}
