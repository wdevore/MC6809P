/*
  A programmmer for the AT29C256-15PC EEPROM. 32Kx8.
  Uses Page writing of size 64 bytes
  NOTE!: The data lines must be pulled-down using 100K resistor
  because the Mega pins are noisy when changing from input to output.
*/

const byte VERSION_MAJOR = 1;
const byte VERSION_MINOR = 0;
const byte VERSION_PATCH = 13;
const char PROGRAMMER[] = "AT29C256-15PC";

// Address     Mega pins // Rom pins
uint8_t nvA0 = 53;       // 10
uint8_t nvA1 = 51;       // 9
uint8_t nvA2 = 49;       // 8
uint8_t nvA3 = 47;       // 7
uint8_t nvA4 = 45;       // 6
uint8_t nvA5 = 43;       // 5
uint8_t nvA6 = 41;       // 4
uint8_t nvA7 = 39;       // 3
uint8_t nvA8 = 37;       // 25
uint8_t nvA9 = 35;       // 24
uint8_t nvA10 = 33;      // 21
uint8_t nvA11 = 31;      // 23
uint8_t nvA12 = 29;      // 2
uint8_t nvA13 = 27;      // 26
uint8_t nvA14 = 25;      // 27

// Data        Mega pins // Rom pins 
uint8_t nvD0 = 52;       // 11
uint8_t nvD1 = 50;       // 12
uint8_t nvD2 = 48;       // 13
uint8_t nvD3 = 46;       // 15
uint8_t nvD4 = 44;       // 16
uint8_t nvD5 = 42;       // 17
uint8_t nvD6 = 40;       // 18
uint8_t nvD7 = 38;       // 19

// Control     Mega pins // Rom pins 
uint8_t nvWE = 22;       // 1
uint8_t nvOE = 24;       // 22
uint8_t nvCE = 26;       // 20

// From ROM to Mega
const bool DATA_OUTOF_ROM = true;
// From Mega to ROM
const bool DATA_INTO_ROM = false;

String rx_string;

// ---------------------------------------------------------------------------------------
// State vars
// ---------------------------------------------------------------------------------------
const int MODE_IDLE = 0;
const int MODE_WRITE = 1;
const int MODE_VERIFY = 2;
const int MODE_READ = 3;
const int MODE_ERASE = 4;
const int MODE_PAGE_READ = 5;
const int MODE_PAGE_WRITE = 6;
const int MODE_SDPD = 7;

// Make sure we use the same consts from the Go app.
const int DATA = 0;
const int EOD = 1;
const int SUCCESS = 1;
const int FAIL = 0;

const int MEMORY_SIZE = 32768;
const int PAGE_SIZE = 64;

// 0 = idle, 1 = write, 2 = verify, 3 = read
int cmdMode = MODE_IDLE;

int cmdState = 0; // 0 = rx address, 1 = rx data
unsigned int org_address = 0;
unsigned int read_length = 0;


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

  Serial.println("Programmer initialized.");
}

void setAddress(unsigned int address) {
  // Set Address pins
  byte low = lowByte(address);
  digitalWrite(nvA0, low & B00000001);
  digitalWrite(nvA1, low & B00000010);
  digitalWrite(nvA2, low & B00000100);
  digitalWrite(nvA3, low & B00001000);
  digitalWrite(nvA4, low & B00010000);
  digitalWrite(nvA5, low & B00100000);
  digitalWrite(nvA6, low & B01000000);
  digitalWrite(nvA7, low & B10000000);

  byte high = highByte(address);
  digitalWrite(nvA8, high &  B00000001);
  digitalWrite(nvA9, high &  B00000010);
  digitalWrite(nvA10, high & B00000100);
  digitalWrite(nvA11, high & B00001000);
  digitalWrite(nvA12, high & B00010000);
  digitalWrite(nvA13, high & B00100000);
  digitalWrite(nvA14, high & B01000000);
}

void setData(byte data) {
  // Set data pins
  digitalWrite(nvD0, data & B00000001);
  digitalWrite(nvD1, data & B00000010);
  digitalWrite(nvD2, data & B00000100);
  digitalWrite(nvD3, data & B00001000);
  digitalWrite(nvD4, data & B00010000);
  digitalWrite(nvD5, data & B00100000);
  digitalWrite(nvD6, data & B01000000);
  digitalWrite(nvD7, data & B10000000);
}

void writeData(unsigned int address, byte data) {
  setAddress(address);
  setData(data);

  digitalWrite(nvCE, LOW);
  digitalWrite(nvWE, LOW);
  
  delayMicroseconds(1);
  
  digitalWrite(nvWE, HIGH);
  digitalWrite(nvCE, HIGH);
}

bool poll(unsigned int address, byte data) {
  // We could check just bit I/O7 but it is easier to
  // just do a byte comparison instead.
  
  // We check bit 7 to see if it toggled relative
  // to bit 7 of the input.
  //byte inX = (data & 0x80) >> 7;

  // We terminate after 11 polls (~11ms) and consider
  // it a failed write cycle.
  int cycle = 0;
  
  // Poll device to detect when write has finished.
  // For the CAT ROM it takes ~3-10ms, so we will
  // Sleep for 1ms and periodically check.  
  for (;;) {
    // Wait a bit.
    delay(1);
  
    // Read data
    byte post = readData(address);
    //Serial.print("poll: ");
    //Serial.println(post, HEX);

    if (post == data) {
      //Serial.print("Write completed in: ");
      //Serial.print(cycle);
      //Serial.println("ms");
      break;  // Excellent, the bit toggled. A successful write.
    }

    if (cycle > 11) {
      Serial.println("Write Failed.");
      return false; // indicate failure to write
    }
    cycle++;
  }

  return true;
}

byte readData(unsigned int address) {
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

  //Serial.print("ROM: [");
  //Serial.print(data);
  //Serial.println("]");
  
  return data;
}

void setDataDirection(bool dir) {
  if (DATA_INTO_ROM) {
    pinMode(nvD0, OUTPUT);  // Into device out-from Mega
    pinMode(nvD1, OUTPUT);
    pinMode(nvD2, OUTPUT);
    pinMode(nvD3, OUTPUT);
    pinMode(nvD4, OUTPUT);
    pinMode(nvD5, OUTPUT);
    pinMode(nvD6, OUTPUT);
    pinMode(nvD7, OUTPUT);    
  } else {
    pinMode(nvD0, INPUT);   // Out from device in-to Mega
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
// Write
// ---------------------------------------------------------------------------------------
int processWriteCommand() {
  int mode = MODE_IDLE;
  
  // Starting address is sent first.
  // Address is a 2 byte value.
  byte address[2];
  Serial1.readBytes(address, 2);
  unsigned int start_address = (address[1] << 8) | address[0];

  Serial.print("Address: ");
  Serial.print(start_address);
  Serial.print(" <");
  Serial.print(start_address, HEX);
  Serial.println(">");

  byte ps[2];
  Serial1.readBytes(ps, 2);
  unsigned int page_size = (ps[1] << 8) | ps[0];
  Serial.print("Page size: ");
  Serial.println(page_size);

  byte dv[page_size];
  byte ds[0];
  for (int i = 0; i < page_size; i++) {
    Serial1.readBytes(ds, 1);
    dv[i]=ds[0];
//    Serial.print("Writing ");
//    Serial.print(dv[i], HEX);
//    Serial.print(" to: <");
//    Serial.print(i, HEX);
//    Serial.println(">");
  }

  setDataDirection(DATA_INTO_ROM);

  byte low;
  byte high;

  // We only need to write the page address once into the
  // pins latches.
  low = lowByte(start_address);
  digitalWrite(nvA6, low & B01000000); // A6-A14 specify page address
  digitalWrite(nvA7, low & B10000000);

  high = highByte(start_address);
  digitalWrite(nvA8, high &  B00000001);
  digitalWrite(nvA9, high &  B00000010);
  digitalWrite(nvA10, high & B00000100);
  digitalWrite(nvA11, high & B00001000);
  digitalWrite(nvA12, high & B00010000);
  digitalWrite(nvA13, high & B00100000);
  digitalWrite(nvA14, high & B01000000);

  // We only have a maximum of 150us between each byte
  // so we need to do a few optimizations to stay under
  // 150us.
  byte dvo;
  for (int i = 0; i < page_size; i++) {
    low = lowByte(start_address);
    // Set byte address within page
    digitalWrite(nvA0, low & B00000001);
    digitalWrite(nvA1, low & B00000010);
    digitalWrite(nvA2, low & B00000100);
    digitalWrite(nvA3, low & B00001000);
    digitalWrite(nvA4, low & B00010000);
    digitalWrite(nvA5, low & B00100000);
  
    dvo = dv[i];  // A simple optimization
    digitalWrite(nvD0, dvo & B00000001);
    digitalWrite(nvD1, dvo & B00000010);
    digitalWrite(nvD2, dvo & B00000100);
    digitalWrite(nvD3, dvo & B00001000);
    digitalWrite(nvD4, dvo & B00010000);
    digitalWrite(nvD5, dvo & B00100000);
    digitalWrite(nvD6, dvo & B01000000);
    digitalWrite(nvD7, dvo & B10000000);

    digitalWrite(nvCE, LOW);
    digitalWrite(nvWE, LOW);
    
    //delayMicroseconds(1);
    
    digitalWrite(nvWE, HIGH);
    digitalWrite(nvCE, HIGH);
    start_address++;
  }

  // Now setup for polling the device
  // Set direction to read out of device.
  setDataDirection(DATA_OUTOF_ROM);

  //Serial.print("Polling at: <");
  //Serial.print(start_address-1, HEX);
  //Serial.print("> for data: ");
  //Serial.print(dv[page_size-1], HEX);
  //Serial.println("");
  
  // Wait for the page write cycle to complete by polling at the
  // last address written.
  bool success = poll(start_address-1, dv[page_size-1]);
  
  if (success) {
    //Serial.println("Byte write SUCCESS");
    byte resp[]={SUCCESS};
    // Send byte back to GO app.
    Serial1.write(resp, 1);    
  } else {
    //Serial.println("Byte write FAILED");
    byte resp[]={FAIL};
    // Send byte back to GO app.
    Serial1.write(resp, 1);     
  }
  
  //Serial.println("Writing complete");

  return mode;
}

// ---------------------------------------------------------------------------------------
// Verify -- not refactored for this chip yet. TODO!
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
    // Address is a 2 byte little endian value.
    byte address[2];
    // Go sends address first
    Serial1.readBytes(address, 2);

    org_address = (address[1] << 8) | address[0];

    Serial.print("Address: ");
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
// Page Read
// ---------------------------------------------------------------------------------------
int processReadPageCommand() {
  int mode = MODE_IDLE;
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // Read start Address first
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  byte bint[]={0, 0};
  Serial1.readBytes(bint, 2);

  unsigned int address = (bint[1] << 8) | bint[0];

  Serial.print("Page address: ");
  Serial.println(address);

  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // Read page size
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  byte pint[]={0, 0};
  Serial1.readBytes(pint, 2);
  unsigned int page_size = (pint[1] << 8) | pint[0];

  Serial.print("Page size: ");
  Serial.println(page_size);
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // Read bytes from ROM and send back to Go app
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  byte resp[]={0};
  for (int i = 0; i < page_size; i++) {
    byte dv = readData(address);
    resp[0] = dv;
    Serial1.write(resp, 1);
    address++;
  }

  Serial.println("Page Read complete");
  return mode;
}

// ---------------------------------------------------------------------------------------
// Page Write -- deprecated
// ---------------------------------------------------------------------------------------
int processWritePageCommand() {
  int mode = MODE_IDLE;
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // Read start Address first
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  byte bint[2];
  Serial1.readBytes(bint, 2);

  unsigned int address = (bint[1] << 8) | bint[0];

  Serial.print("Page address: ");
  Serial.println(address);

  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // Read page size
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  Serial1.readBytes(bint, 2);

  int page_size = (bint[1] << 8) | bint[0];

  Serial.print("Page size: ");
  Serial.println(page_size);
  
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  // Write byte to rom
  // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  byte resp[]={0};
  byte byt[0];
  for (int i = 0; i < page_size; i++) {
    Serial1.readBytes(byt, 1);
    address++;
  }

  Serial.println("Page Write complete");
  
  return mode;
}

// ---------------------------------------------------------------------------------------
// Erase
// ---------------------------------------------------------------------------------------
int processEraseCommand() {
  Serial.println("Erase sequence starting...");
  writeData(0x5555, 0xAA);
  writeData(0x2AAA, 0x55);
  writeData(0x5555, 0x80);
  
  writeData(0x5555, 0xAA);
  writeData(0x2AAA, 0x55);
  writeData(0x5555, 0x10);  // Erase command

  delay(20); // Allow erase cycle to complete.

  // We could either do a bogus page cycle.
  // writeData(0x0, 0x99);  // Bogus page of nothing
  // OR
  // Toggling CE seems to help complete the cycle.
  digitalWrite(nvCE, LOW);
  digitalWrite(nvCE, HIGH);
  
  byte resp[]={1};
  Serial1.write(resp, 1);

  Serial.println("Erase complete.");
  return MODE_IDLE;
}

// ---------------------------------------------------------------------------------------
// Software Data Protection disabling
// ---------------------------------------------------------------------------------------
int processSDPDCommand() {
  Serial.println("Starting SDP cycle...");
  setDataDirection(DATA_INTO_ROM);

  // Store 0xAA to address 0x5555
  writeData(0x5555, 0xAA);
  
  // Store 0x55 to address 0x2AAA
  writeData(0x2AAA, 0x55);
  
  // Store 0x80 to address 0x5555
  writeData(0x5555, 0x80);

  // Store 0xAA to address 0x5555
  writeData(0x5555, 0xAA);

  // Store 0x55 to address 0x2AAA
  writeData(0x2AAA, 0x55);
  
  // Store 0x20 to address 0x5555
  writeData(0x5555, 0x20);  // Disable command

  // Toggling CE seems to help complete the cycle.
  digitalWrite(nvCE, LOW);
  digitalWrite(nvCE, HIGH);

  Serial.println("Data protect OFF complete");

  return MODE_IDLE;
}

void loop() {
  // Wait for data from the Go app
  if (cmdMode == MODE_IDLE) {
    if (Serial1.available() > 0) {
      rx_string = Serial1.readString();
      Serial.print("Got command: [");
      Serial.print(rx_string);
      Serial.println("]");
      
      if (rx_string == "write") {
        Serial.println("Switching to MODE_WRITE");

        setDataDirection(DATA_INTO_ROM);

        cmdMode = MODE_WRITE;
        Serial1.print("ack");
      } else if (rx_string == "verify") {
        Serial.println("Switching to MODE_VERIFY");
        
        setDataDirection(DATA_OUTOF_ROM);
        
        cmdMode = MODE_VERIFY;
        Serial1.print("ack");
      } else if (rx_string == "version") {
        Serial.println("Sending version");
        byte buf[] = {VERSION_MAJOR, VERSION_MINOR, VERSION_PATCH};
        Serial1.write(buf, 3);
        byte prg[] = {0};
        prg[0] = sizeof(PROGRAMMER);
        
        Serial1.write(prg, 1);
        for (int i = 0; i < sizeof(PROGRAMMER); i++) {
          prg[0] = PROGRAMMER[i];
          Serial1.write(prg, 1);
        }
      } else if (rx_string == "read") {
        Serial.println("Switching to MODE_READ");
        setDataDirection(DATA_OUTOF_ROM);
        
        cmdMode = MODE_READ;
        Serial1.print("ack");
      } else if (rx_string == "read_page") {
        Serial.println("Switching to MODE_PAGE_READ");
        setDataDirection(DATA_OUTOF_ROM);
        
        cmdMode = MODE_PAGE_READ;
        Serial1.print("ack");
      } else if (rx_string == "write_page") {
        Serial.println("Switching to MODE_PAGE_WRITE");
        setDataDirection(DATA_INTO_ROM);
        
        cmdMode = MODE_PAGE_WRITE;
        Serial1.print("ack");
      } else if (rx_string == "erase") {
        Serial.println("Switching to MODE_ERASE");
        setDataDirection(DATA_INTO_ROM);

        cmdMode = MODE_ERASE;
        Serial1.print("ack");
      } else if (rx_string == "sdpd") {
        Serial.println("Switching to MODE_SDPD");

        cmdMode = MODE_SDPD;
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
  } else if (cmdMode == MODE_PAGE_READ) {
    cmdMode = processReadPageCommand();
  } else if (cmdMode == MODE_PAGE_WRITE) {
    cmdMode = processWritePageCommand();
  } else if (cmdMode == MODE_SDPD) {
    cmdMode = processSDPDCommand();
  }
}
