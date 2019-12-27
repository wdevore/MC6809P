/*
  A programmmer for the CAT28C16A-20 EEPROM. 2Kx8.
  Uses a single byte write cycle.
*/

const byte VERSION_MAJOR = 1;
const byte VERSION_MINOR = 0;
const byte VERSION_PATCH = 10;
const String PROGRAMMER = "CAT28C16";

// Address     Mega pins // Rom pins
uint8_t nvA0 = 53;       // 8
uint8_t nvA1 = 51;       // 7
uint8_t nvA2 = 49;       // 6
uint8_t nvA3 = 47;       // 5
uint8_t nvA4 = 45;       // 4
uint8_t nvA5 = 43;       // 3
uint8_t nvA6 = 41;       // 2
uint8_t nvA7 = 39;       // 1
uint8_t nvA8 = 37;       // 23
uint8_t nvA9 = 35;       // 22
uint8_t nvA10 = 33;      // 19

// Data        Mega pins // Rom pins 
uint8_t nvD0 = 52;       // 9
uint8_t nvD1 = 50;       // 10
uint8_t nvD2 = 48;       // 11
uint8_t nvD3 = 46;       // 13
uint8_t nvD4 = 44;       // 14
uint8_t nvD5 = 42;       // 15
uint8_t nvD6 = 40;       // 16
uint8_t nvD7 = 38;       // 17

// Control     Mega pins // Rom pins 
uint8_t nvWE = 22;       // 21
uint8_t nvOE = 24;       // 20
uint8_t nvCE = 26;       // 18

String rx_string;

// the setup function runs once when you press reset, power the board or connect via UART TX1
void setup() {
  // We don't high speed for the Terminal GUI.
  Serial.begin(115200);

  // Serial1 interacts with a Go program at high speed
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

  digitalWrite(nvCE, HIGH);
  digitalWrite(nvOE, HIGH);
  digitalWrite(nvWE, HIGH);

  pinMode(nvCE, OUTPUT);
  pinMode(nvOE, OUTPUT);
  pinMode(nvWE, OUTPUT);

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

bool writeData(int address, byte data) {
  // First write the data to begin cycle.
  setAddress(address);
  setDataDirection(true);
  setData(data);
//  Serial.print("----- Data [");
//  Serial.print(char(data));
//  Serial.print("] (");
//  Serial.print(data, HEX);
//  Serial.println(")");
    
  digitalWrite(nvCE, LOW);
  digitalWrite(nvWE, LOW);
  
  delayMicroseconds(1);
  
  digitalWrite(nvWE, HIGH);
  digitalWrite(nvCE, HIGH);

  // Now we check bit 7 to see if it toggled relative
  // to bit 7 of the input.
  //byte inX = (data & 0x80) >> 7;

  // We terminate after 11 cycles (~11ms) and consider
  // it a failed write cycle.
  int cycle = 0;
  
  // Poll device to detect when write has finished.
  // For the CAT ROM it takes ~3-10ms, so we will
  // Sleep for 1ms and periodically check.  

  setDataDirection(false);

  for (;;) {
    // Wait a bit.
    delay(1);

    // Read bit 7
    byte post = readData(address);

//  Serial.print("Data7 [");
//  Serial.print(data,BIN);
//  Serial.print("] (");
//  Serial.print(post, BIN);
//  Serial.println(")");

    // Once they become equal then write has completed.
    // Technically it is just Bit7.
    if (post == data) {
//      Serial.print("Cycle completed in: ");
//      Serial.print(cycle);
//      Serial.println("ms");
      break;  // Excellent, the bit toggled.
    }

    if (cycle > 11) {
      Serial.println("Write Failed.");
      return false; // indicate failure to write
    }
    cycle++;
  }

  return true; // Write successful.
}

bool writeData2(int address, byte data) {
  // First write the data to begin cycle.
  setAddress(address);
  setData(data);
    
  digitalWrite(nvCE, LOW);
  digitalWrite(nvWE, LOW);
  
  delayMicroseconds(1);
  
  digitalWrite(nvWE, HIGH);
  digitalWrite(nvCE, HIGH);

  delay(10);

  return true; // Write successful.
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

void setDataDirection(bool dir) {
  if (dir) {
    pinMode(nvD0, OUTPUT);
    pinMode(nvD1, OUTPUT);
    pinMode(nvD2, OUTPUT);
    pinMode(nvD3, OUTPUT);
    pinMode(nvD4, OUTPUT);
    pinMode(nvD5, OUTPUT);
    pinMode(nvD6, OUTPUT);
    pinMode(nvD7, OUTPUT);    
  } else {
    pinMode(nvD0, INPUT);
    pinMode(nvD1, INPUT);
    pinMode(nvD2, INPUT);
    pinMode(nvD3, INPUT);
    pinMode(nvD4, INPUT);
    pinMode(nvD5, INPUT);
    pinMode(nvD6, INPUT);
    pinMode(nvD7, INPUT);
  }
}

// ---------------------------------------------------------------------------------------
// State vars
// ---------------------------------------------------------------------------------------
const int MODE_IDLE = 0;
const int MODE_WRITE = 1;
const int MODE_VERIFY = 2;
const int MODE_READ = 3;
const int MODE_ERASE = 4;

// Make sure we use the same consts from the Go app.
const int DATA = 0;
const int EOD = 1;
const int SUCCESS = 1;
const int FAIL = 0;

const int MEMORY_SIZE = 2048;

// 0 = idle, 1 = write, 2 = verify, 3 = read
int cmdMode = MODE_IDLE;

int cmdState = 0; // 0 = rx address, 1 = rx data
int org_address = 0;
int read_length = 0;

// ---------------------------------------------------------------------------------------
// Write a single byte
// ---------------------------------------------------------------------------------------
int processWriteCommand() {
  int mode = MODE_IDLE;
  
  // Starting address is sent first.
  // Address is a 2 byte value.
  byte address[2];
  Serial1.readBytes(address, 2);

  org_address = (address[1] << 8) | address[0];

  Serial.print("Address: ");
  Serial.println(org_address);

  // Begin reading data for writing
  // The format: [0]=data, [1]=(flag: EOD or DATA)
  byte d[2];
  d[1] = DATA;

  d[0] = 0;
  Serial1.readBytes(d, 2);
  
  do {
    // Write data
    bool success = writeData(org_address, d[0]);

    if (success) {
//      Serial.println("Byte write SUCCESS");
      byte resp[]={SUCCESS};
      // Send byte back to GO app.
      Serial1.write(resp, 1);    
    } else {
//      Serial.println("Byte write FAILED");
      byte resp[]={FAIL};
      // Send byte back to GO app.
      Serial1.write(resp, 1);     
    }
    
    org_address++;

    d[0] = 0;
    Serial1.readBytes(d, 2);
  } while (d[1] == DATA);
  
  Serial.println("Writing complete");

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
    // Address is a 2 byte value.
    byte address[2];
    Serial1.readBytes(address, 2);

    org_address = (address[1] << 8) | address[0];

    Serial.print("Org address: ");
    Serial.println(org_address);

    byte l[2];
    // Go sends address first
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
      // Send byte back to GO app.
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

// ---------------------------------------------------------------------------------------
// Erase
// ---------------------------------------------------------------------------------------
int processEraseCommand() {
  org_address = 0;
  
  for (int i = 0; i < MEMORY_SIZE; i++) {
    if (i % 1024 == 0) {
      // Tell Go that 1K was successfully erased
      byte stat[]={1};
      Serial1.write(stat, 1);
    }

    writeData(org_address, 0);
    org_address++;
  }

  // Tell Go that the memory was erased successfully.
  byte stat[]={2};
  Serial1.write(stat, 1);

  return MODE_IDLE;
}

void loop() {
  // Wait for data from the Go app
  if (cmdMode == MODE_IDLE) {
    if (Serial1.available() > 0) {
      //Serial.println("Reading client for command");
      rx_string = Serial1.readString();
      
      if (rx_string == "write") {
        Serial.println("Switching to MODE_WRITE");
        setDataDirection(true);

        cmdMode = MODE_WRITE;
        Serial1.print("ack");
      } else if (rx_string == "verify") {
        Serial.println("Switching to MODE_VERIFY");
        
        setDataDirection(false);
        
        cmdMode = MODE_VERIFY;
        Serial1.print("ack");
      } else if (rx_string == "version") {
        Serial.println("Sending version");
        byte buf[] = {VERSION_MAJOR, VERSION_MINOR, VERSION_PATCH};
        Serial1.write(buf, 3);
        Serial1.print(PROGRAMMER);
      } else if (rx_string == "read") {
        Serial.println("Switching to MODE_READ");
        setDataDirection(false);
        
        cmdMode = MODE_READ;
        Serial1.print("ack");
      } else if (rx_string == "erase") {
        Serial.println("Switching to MODE_ERASE");
        setDataDirection(true);
        
        cmdMode = MODE_ERASE;
        Serial1.print("ack");
      }
    }    
  } else if (cmdMode == MODE_WRITE) {
    cmdMode = processWriteCommand();
  } else if (cmdMode == MODE_VERIFY) {
    cmdMode = processVerifyCommand();
  } else if (cmdMode == MODE_READ) {
    cmdMode = processReadCommand();
  } else if (cmdMode == MODE_ERASE) {
    cmdMode = processEraseCommand();
  }
}
