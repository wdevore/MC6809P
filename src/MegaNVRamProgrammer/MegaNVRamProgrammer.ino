/*
  A programmmer for the RamTron NVRam. 32Kx8.

*/

const byte VERSION_MAJOR = 1;
const byte VERSION_MINOR = 0;
const byte VERSION_PATCH = 21;

// Address Mega pins
uint8_t nvA1 = 53;
uint8_t nvA2 = 51;
uint8_t nvA3 = 49;
uint8_t nvA4 = 47;
uint8_t nvA5 = 45;
uint8_t nvA6 = 43;
uint8_t nvA7 = 41;
uint8_t nvA8 = 39;
uint8_t nvA9 = 37;
uint8_t nvA10 = 35;
uint8_t nvA11 = 33;
uint8_t nvA12 = 31;
uint8_t nvA13 = 29;
uint8_t nvA14 = 27;
uint8_t nvA0 = 25;

// Data Mega pins
uint8_t nvD0 = 52;
uint8_t nvD1 = 50;
uint8_t nvD2 = 48;
uint8_t nvD3 = 46;
uint8_t nvD4 = 44;
uint8_t nvD5 = 42;
uint8_t nvD6 = 40;
uint8_t nvD7 = 38;

// Control Mega pins
uint8_t nvCE = 26;
uint8_t nvOE = 24;
uint8_t nvWE = 22;

String rx_string;

// the setup function runs once when you press reset, power the board or connect via UART TX0
void setup() {
  Serial.begin(115200);

  // Serial1 interacts with a Go program.
  Serial1.begin(1000000);
  Serial1.setTimeout(10);
    
  Serial.print("Initializing Programmer ");
  Serial.print(VERSION_MAJOR);
  Serial.print(".");
  Serial.print(VERSION_MINOR);
  Serial.print(".");
  Serial.println(VERSION_PATCH);

  pinMode(nvA0, OUTPUT);
  pinMode(nvA1, OUTPUT);
  pinMode(nvA2, OUTPUT);
  pinMode(nvA3, OUTPUT);
  pinMode(nvA4, OUTPUT);
  pinMode(nvA5, OUTPUT);
  pinMode(nvA6, OUTPUT);
  pinMode(nvA7, OUTPUT);
  pinMode(nvA8, OUTPUT);
  pinMode(nvA9, OUTPUT);
  pinMode(nvA10, OUTPUT);
  pinMode(nvA11, OUTPUT);
  pinMode(nvA12, OUTPUT);
  pinMode(nvA13, OUTPUT);
  pinMode(nvA14, OUTPUT);

  digitalWrite(nvCE, HIGH);
  digitalWrite(nvOE, HIGH);
  digitalWrite(nvWE, HIGH);

  pinMode(nvCE, OUTPUT);
  pinMode(nvOE, OUTPUT);
  pinMode(nvWE, OUTPUT);

  digitalWrite(nvCE, HIGH);
  digitalWrite(nvOE, HIGH);
  digitalWrite(nvWE, HIGH);

  Serial.println("Programmer initialized.");
}

void setAddress(int address) {
  // Set Address pins
  byte low = lowByte(address);
  digitalWrite(nvA0, low & 1);
  digitalWrite(nvA1, low & (1 << 1));
  digitalWrite(nvA2, low & (1 << 2));
  digitalWrite(nvA3, low & (1 << 3));
  digitalWrite(nvA4, low & (1 << 4));
  digitalWrite(nvA5, low & (1 << 5));
  digitalWrite(nvA6, low & (1 << 6));
  digitalWrite(nvA7, low & (1 << 7));

  byte high = highByte(address);
  digitalWrite(nvA8, high & 1);
  digitalWrite(nvA9, high & (1 << 1));
  digitalWrite(nvA10, high & (1 << 2));
  digitalWrite(nvA11, high & (1 << 3));
  digitalWrite(nvA12, high & (1 << 4));
  digitalWrite(nvA13, high & (1 << 5));
  digitalWrite(nvA14, high & (1 << 6));
}

void setData(byte data) {
  // Set data pins
  digitalWrite(nvD0, data & 1);
  digitalWrite(nvD1, data & (1 << 1));
  digitalWrite(nvD2, data & (1 << 2));
  digitalWrite(nvD3, data & (1 << 3));
  digitalWrite(nvD4, data & (1 << 4));
  digitalWrite(nvD5, data & (1 << 5));
  digitalWrite(nvD6, data & (1 << 6));
  digitalWrite(nvD7, data & (1 << 7));
}

void writeData(int address, byte data) {
  setAddress(address);
  setData(data);
    
  // CE controlled timing (i.e. WE before CE). Signals are active low.
  digitalWrite(nvWE, LOW);
  digitalWrite(nvCE, LOW);
  
  delayMicroseconds(1);
  
  digitalWrite(nvCE, HIGH);
  digitalWrite(nvWE, HIGH);
}

byte readData(int address) {
  setAddress(address);
  byte data;
  
  digitalWrite(nvCE, LOW);
  digitalWrite(nvOE, LOW);
  
  data = digitalRead(nvD0);
  data |= (digitalRead(nvD1) << 1);
  data |= (digitalRead(nvD2) << 2);
  data |= (digitalRead(nvD3) << 3);
  data |= (digitalRead(nvD4) << 4);
  data |= (digitalRead(nvD5) << 5);
  data |= (digitalRead(nvD6) << 6);
  data |= (digitalRead(nvD7) << 7);
  
  digitalWrite(nvOE, HIGH);
  digitalWrite(nvCE, HIGH);

//  Serial.print("NVRam: [");
//  Serial.print(data);
//  Serial.println("]");
  
  return data;
}

// ---------------------------------------------------------------------------------------
// State vars
// ---------------------------------------------------------------------------------------
const int MODE_IDLE = 0;
const int MODE_WRITE = 1;
const int MODE_VERIFY = 2;
const int MODE_READ = 3;

// Make sure we use the same consts from the Go app.
const int DATA = 0;
const int EOD = 1;

// 0 = idle, 1 = write, 2 = verify, 3 = read
int cmdMode = MODE_IDLE;

int cmdState = 0; // 0 = rx address, 1 = rx data
int org_address = 0;
int read_length = 0;

// ---------------------------------------------------------------------------------------
// Write
// ---------------------------------------------------------------------------------------
int processWriteCommand() {
  int mode = MODE_IDLE;
  
  if (cmdState == 0) {
    // Go sends address first
    // Address is a 2 byte value.
    byte address[2];
    Serial1.readBytes(address, 2);

    org_address = (address[1] << 8) | address[0];

    Serial.print("Org address: ");
    Serial.println(org_address);

    cmdState = 1;

    mode = MODE_WRITE; // Remain in write mode
  } else if (cmdState == 1) {
    // Read data for writing
    // The format: [0]=data, [1]=(flag: EOD or DATA)
    byte d[2];
    Serial1.readBytes(d, 2);
    
    if (d[1] == DATA) {
      // Write data
      writeData(org_address, d[0]);
      org_address++;
      mode = MODE_WRITE;
    } else {
      Serial.println("Writing complete");
      cmdState = 0;
    }
  }

  return mode;
}

// ---------------------------------------------------------------------------------------
// Verify
// ---------------------------------------------------------------------------------------
int processVerifyCommand() {
  int mode = MODE_IDLE;
  
  if (cmdState == 0) {
    // Go sends address first
    // Address is a 2 byte value.
    byte address[2];
    Serial1.readBytes(address, 2);

    org_address = (address[1] << 8) | address[0];

    Serial.print("Org address: ");
    Serial.println(org_address);

    cmdState = 1;

    mode = MODE_VERIFY; // Remain in verify mode
  } else if (cmdState == 1) {
    // Read data for verifying against NVRam
    // The format: [0]=data, [1]=(flag: EOD or DATA)
    byte expected[2];
    Serial1.readBytes(expected, 2);
    
    if (expected[1] == DATA) {
      byte dv = readData(org_address);
      //Serial.print("Read: ");
      //Serial.println(dv);

      byte stat[]={0,0,0};

      stat[1] = lowByte(org_address);
      stat[2] = highByte(org_address);

      if (dv == expected[0]) {
        // Send back valid status and address
        stat[0] = 0;
        mode = MODE_VERIFY;
      } else {
        // Send back failed status
        Serial.print("Failed verification at <");
        Serial.print(org_address);
        Serial.print("> Ram was: ");
        Serial.print(dv);
        Serial.print(" -- expected: ");
        Serial.println(expected[0]);
        stat[0] = 1;
        mode = MODE_IDLE;
        cmdState = 0;
      }

      Serial1.write(stat, 3);
      org_address++;
    } else {
      Serial.println("Block verify complete");
      cmdState = 0;
    }
  }

  return mode;
}

// ---------------------------------------------------------------------------------------
// Read
// ---------------------------------------------------------------------------------------
int processReadCommand() {
  int mode = MODE_IDLE;
  
  if (cmdState == 0) {
    // Go sends address first
    // Address is a 2 byte value.
    byte address[2];
    Serial1.readBytes(address, 2);

    org_address = (address[1] << 8) | address[0];

    Serial.print("Org address: ");
    Serial.println(org_address);

    byte l[2];
    Serial1.readBytes(l, 2);

    read_length = (l[1] << 8) | l[0];

    Serial.print("Length: ");
    Serial.println(read_length);
    
    cmdState = 1;

    mode = MODE_READ; // Remain in read mode
  } else if (cmdState == 1) {
    if (read_length > 0) {
      mode = MODE_READ;
      byte dv = readData(org_address);
      byte resp[]={dv};
      Serial1.write(resp, 1);
      org_address++;
      read_length--;
    } else {
      mode = MODE_IDLE;
      cmdState = 0;
      Serial.println("Read complete");
    }
  }

  return mode;
}

void loop() {
  // Wait for data from the Go app
  if (cmdMode == MODE_IDLE) {
    if (Serial1.available() > 0) {
      //Serial.println("Reading client for command");
      rx_string = Serial1.readString();
      
      if (rx_string == "write") {
        Serial.println("Switching to MODE_WRITE");
        
        pinMode(nvD0, OUTPUT);
        pinMode(nvD1, OUTPUT);
        pinMode(nvD2, OUTPUT);
        pinMode(nvD3, OUTPUT);
        pinMode(nvD4, OUTPUT);
        pinMode(nvD5, OUTPUT);
        pinMode(nvD6, OUTPUT);
        pinMode(nvD7, OUTPUT);

        cmdMode = MODE_WRITE;
        Serial1.print("ack");
      } else if (rx_string == "verify") {
        Serial.println("Switching to MODE_VERIFY");
        
        pinMode(nvD0, INPUT);
        pinMode(nvD1, INPUT);
        pinMode(nvD2, INPUT);
        pinMode(nvD3, INPUT);
        pinMode(nvD4, INPUT);
        pinMode(nvD5, INPUT);
        pinMode(nvD6, INPUT);
        pinMode(nvD7, INPUT);
        
        cmdMode = MODE_VERIFY;
        Serial1.print("ack");
      } else if (rx_string == "version") {
        byte buf[] = {VERSION_MAJOR, VERSION_MINOR, VERSION_PATCH};
        Serial1.write(buf, 3);
      } else if (rx_string == "read") {
        Serial.println("Switching to MODE_READ");
        pinMode(nvD0, INPUT);
        pinMode(nvD1, INPUT);
        pinMode(nvD2, INPUT);
        pinMode(nvD3, INPUT);
        pinMode(nvD4, INPUT);
        pinMode(nvD5, INPUT);
        pinMode(nvD6, INPUT);
        pinMode(nvD7, INPUT);
        
        cmdMode = MODE_READ;
        Serial1.print("ack");
      }
    }    
  } else if (cmdMode == MODE_WRITE) {
    cmdMode = processWriteCommand();
  } else if (cmdMode == MODE_VERIFY) {
    cmdMode = processVerifyCommand();
  } else if (cmdMode == MODE_READ) {
    cmdMode = processReadCommand();
  }
}
