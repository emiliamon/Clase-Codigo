
// Potenciometros
int pot1Pin = A1;
int pot1Val = 0;
int pot2Pin = A3;
int pot2Val = 0;
int pot3Pin = A5;
int pot3Val = 0;
// numero de control
int pot1 = 1;
int pot2 = 2;
int pot3 = 3;

void setup() {
  // inicializamos el puerto en serie
  // Configuramos el baud rate a 115200
  // ya que es el valor con el cual viene
  // configurado Hairless MIDI por omisión
  Serial.begin(115200);
}

void loop() {
  // lee las entradas;

  pot1Val = map(analogRead(pot1Pin), 0, 1023, 0, 127);
  pot2Val = map(analogRead(pot2Pin), 0, 1023, 0, 127);
  pot3Val = map(analogRead(pot3Pin), 0, 1023, 0, 127);

  cc(0, pot1, pot1Val);
  cc(0, pot2, pot2Val);
  cc(0, pot3, pot3Val);

  delay(50);
}

// Envía el comando Control Change
void cc(int chan, int num, int val) {
  int cmd = 0xb0 | chan;
  Serial.write(cmd);
  Serial.write(num);
  Serial.write(val);
};
