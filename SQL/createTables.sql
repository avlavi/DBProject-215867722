
CREATE TABLE Soldier
(
  ID INT NOT NULL,
  IDF_num INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  Enlistment_Date_ DATE NOT NULL,
  Rank VARCHAR(100) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Vehicle
(
  License_num INT NOT NULL,
  Model VARCHAR(100) NOT NULL,
  Type VARCHAR(100) NOT NULL,
  PRIMARY KEY (License_num)
);

CREATE TABLE Product
(
  Product_num INT NOT NULL,
  Product_name VARCHAR(100) NOT NULL,
  Manufactoring VARCHAR(100) NOT NULL,
  Amount INT NOT NULL,
  PRIMARY KEY (Product_num)
);

CREATE TABLE Driver
(
  License INT NOT NULL,
  Status VARCHAR(100) NOT NULL,
  License_type VARCHAR(100) NOT NULL,
  ID INT NOT NULL,
  License_num INT NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES Soldier(ID),
  FOREIGN KEY (License_num) REFERENCES Vehicle(License_num),
  UNIQUE (License)
);

CREATE TABLE Shekem
(
  Base_name VARCHAR(100) NOT NULL,
  Shekem_num INT NOT NULL,
  Base_num INT NOT NULL,
  PRIMARY KEY (Shekem_num),
  UNIQUE (Base_num)
);

CREATE TABLE Delivery
(
  Delivery_num INT NOT NULL,
  Status VARCHAR(100) NOT NULL,
  Delivery_date DATE NOT NULL,
  ID INT NOT NULL,
  PRIMARY KEY (Delivery_num),
  FOREIGN KEY (ID) REFERENCES Driver(ID)
);

CREATE TABLE Brings_to
(
  Delivery_num INT NOT NULL,
  Shekem_num INT NOT NULL,
  PRIMARY KEY (Delivery_num, Shekem_num),
  FOREIGN KEY (Delivery_num) REFERENCES Delivery(Delivery_num),
  FOREIGN KEY (Shekem_num) REFERENCES Shekem(Shekem_num)
);

CREATE TABLE Seller
(
  Shift VARCHAR(100) NOT NULL,
  Total_Sales_ INT NOT NULL,
  Supervisor_ID INT NOT NULL,
  Seller_num INT NOT NULL,
  ID INT NOT NULL,
  Shekem_num INT NOT NULL,
  PRIMARY KEY (ID, Shekem_num),
  FOREIGN KEY (ID) REFERENCES Soldier(ID),
  FOREIGN KEY (Shekem_num) REFERENCES Shekem(Shekem_num),
  UNIQUE (Seller_num)
);
CREATE TABLE Has
(
  Product_num INT NOT NULL,
  Shekem_num INT NOT NULL,
  PRIMARY KEY (Product_num, Shekem_num),
  FOREIGN KEY (Product_num) REFERENCES Product(Product_num),
  FOREIGN KEY (Shekem_num) REFERENCES Shekem(Shekem_num)
);
