CREATE DATABASE [TB.SetiaJaya]

USE [TB.SetiaJaya]

CREATE TABLE Akun (
[Nickname] VARCHAR(69) NOT NULL,
AkunID VARCHAR(10) PRIMARY KEY,
[Role] VARCHAR(30) NOT NULL,
Salary NUMERIC(10, 2),
SalaryDate DATE,
EntryDate DATE NOT NULL,
PhoneNumber VARCHAR(20) NOT NULL, 
)


CREATE TABLE Barang (
NamaBarang VARCHAR(225) NOT NULL,
Merk VARCHAR(225) NOT NULL,
BarangID VARCHAR(10) PRIMARY KEY,
Stock NUMERIC(8, 2) NOT NULL,
Harga NUMERIC(10, 2) NOT NULL,
Deskripsi VARCHAR(225),
[Date] DATE NOT NULL
)

CREATE TABLE PengeluaranBarang (
PengeluaranID VARCHAR(10) PRIMARY KEY,
BarangID VARCHAR(10) NOT NULL,
TglPengeluaran DATE NOT NULL,
Stock NUMERIC(8, 0) NOT NULL

FOREIGN KEY (BarangID) REFERENCES Barang(BarangID)
)

CREATE TABLE Vendor (
VendorName VARCHAR(10) NOT NULL,
VendorID VARCHAR(10) PRIMARY KEY,
InvoiceID VARCHAR(10) NOT NULL,
SAddress VARCHAR(225) NOT NULL,
PurchaseID VARCHAR(10) NOT NULL,
PhoneNumber VARCHAR(20) NOT NULL
)

CREATE TABLE PurchaseOrder (
PurchaseID VARCHAR(10) PRIMARY KEY,
BarangID VARCHAR(10) NOT NULL,
Quantity NUMERIC(10, 0) NOT NULL,
PurchaseDate DATE NOT NULL,
InvoiceID VARCHAR(10) NOT NULL,
VendorID VARCHAR(10) NOT NULL

FOREIGN KEY (BarangID) REFERENCES Barang(BarangID),
FOREIGN KEY (VendorID) REFERENCES Vendor(VendorID)
)

CREATE TABLE PenerimaanBarangToko (
NamaBarang VARCHAR(10) NOT NULL,
BarangID VARCHAR(10) NOT NULL,
VendorID VARCHAR(10) NOT NULL,
StatusBarangT VARCHAR(10) NOT NULL,
Quantity NUMERIC(8,0) NOT NULL

FOREIGN KEY (BarangID) REFERENCES Barang(BarangID),
)

CREATE TABLE Customer (
CustomerName VARCHAR(225) NOT NULL,
CustomerID VARCHAR(10) PRIMARY KEY,
CAddress VARCHAR(225) NOT NULL,
PhoneNumber VARCHAR(20) NOT NULL
)

CREATE TABLE CustomerOrder (
COrderID VARCHAR(10) PRIMARY KEY,
CutomerID VARCHAR(10) NOT NULL,
BarangID VARCHAR(10) NOT NULL,
StatusBarangC VARCHAR(10) NOT NULL,
Quantity NUMERIC(8, 0) NOT NULL,
Note VARCHAR(225)

FOREIGN KEY (BarangID) REFERENCES Barang(BarangID),
FOREIGN KEY (CutomerID) REFERENCES Customer(CustomerID),
)

---AkunID tidak boleh < 0
ALTER TABLE Akun
ADD CONSTRAINT chk_AkunID_non_negatif
CHECK (AkunID >= 0);

---BarangID tidak boleh < 0
ALTER TABLE Barang 
ADD CONSTRAINT chk_BarangID_non_negatif 
CHECK (BarangID >= 0); 

---



Drop table Akun
Drop table Barang
Drop table Customer
Drop table CustomerOrder
Drop table PenerimaanBarangToko
Drop table PengeluaranBarang
Drop table PurchaseOrder
Drop table Vendor
