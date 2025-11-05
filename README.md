# CheckVat - EU VAT Number Verification

> 🇮🇹 [Versione italiana](README.it.md) | 🇬🇧 English version

![Delphi](https://img.shields.io/badge/Delphi-10.4+-red.svg)
![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)

Delphi application for verifying EU VAT numbers through the European Commission's VIES (VAT Information Exchange System) SOAP service.

## 📋 Description

CheckVat is a Windows desktop application that allows you to verify the validity of EU VAT numbers by querying the European Union's VIES database. The application uses the official SOAP service provided by the European Commission to obtain detailed information about registered economic operators.

## ✨ Features

- **VAT Number Verification**: Check the validity of an EU VAT number
- **Detailed Information**: Retrieve company name, address, and company type
- **Official Service**: Uses the European Commission's VIES service
- **Intuitive Interface**: Simple and user-friendly GUI
- **Input Validation**: Validation checks for required fields
- **Authenticated Request**: Ability to specify requester's details

## 🚀 Prerequisites

- Delphi 10.4 Sydney or later versions
- Active Internet connection to access the VIES service
- Windows 7 or higher

## 📦 Installation

1. Clone the repository:
```bash
git clone https://github.com/MuzioValerio/CheckVat.git
```

2. Open the project in Delphi:
   - Open the main `.dpr` project file

3. Compile the project:
   - Menu: Project → Build
   - Or press `Shift+F9`

4. Run the application:
   - Press `F9` or use the Run → Run menu

## 💻 Usage

### Main Interface

The application features two main sections:

#### 1. Data to Verify
- **Country**: ISO 3166-1 alpha-2 country code (e.g., IT, DE, FR)
- **VAT Number**: VAT number to verify (without country prefix)

#### 2. Requester Data
- **Country**: Requester's country code
- **VAT Number**: Requester's VAT number

### Usage Example

1. Enter the VAT number data to verify:
   - Country: `IT`
   - VAT Number: `00000000000`

2. Enter your data as requester:
   - Country: `IT`
   - VAT Number: `12345678901`

3. Click the **Verify** button

4. Results will appear in the memo with the following information:
   - Request date
   - Country code
   - VAT number
   - Company name
   - Complete address
   - Company type

### Supported Country Codes

The application supports all EU member countries:
- AT (Austria), BE (Belgium), BG (Bulgaria), CY (Cyprus), CZ (Czech Republic)
- DE (Germany), DK (Denmark), EE (Estonia), EL (Greece), ES (Spain)
- FI (Finland), FR (France), HR (Croatia), HU (Hungary), IE (Ireland)
- IT (Italy), LT (Lithuania), LU (Luxembourg), LV (Latvia), MT (Malta)
- NL (Netherlands), PL (Poland), PT (Portugal), RO (Romania), SE (Sweden)
- SI (Slovenia), SK (Slovakia)

## 🔧 Integration in Other Projects

To use the VAT verification functionality in your Delphi projects:

1. Copy the `checkVatService.pas` file to your project

2. Add the unit in the `uses` clause:
```pascal
uses
  checkVatService;
```

3. Basic code example:
```pascal
var
  lParam: checkVatApprox;
  lResponse: checkVatApproxResponse;
  HTTPRIO: THTTPRIO;
begin
  HTTPRIO := THTTPRIO.Create(nil);
  try
    lParam := checkVatApprox.Create;
    try
      lParam.countryCode := 'IT';
      lParam.vatNumber := '00000000000';
      lParam.requesterCountryCode := 'IT';
      lParam.requesterVatNumber := '12345678901';
      
      lResponse := (HTTPRIO as checkVatPortType).checkVatApprox(lParam);
      
      if lResponse.valid then
      begin
        // Valid VAT number
        ShowMessage('Company Name: ' + lResponse.traderName);
      end;
    finally
      lParam.Free;
    end;
  finally
    HTTPRIO.Free;
  end;
end;
```

## 📁 Project Structure

```
CheckVat/
├── checkVatService.pas    # Unit generated from VIES service WSDL
├── uMain.pas              # Main form and application logic
├── uMain.dfm              # Visual form definition
└── README.md              # This file
```

## 🔍 Technical Details

### VIES SOAP Service

- **WSDL**: `https://ec.europa.eu/taxation_customs/vies/checkVatService.wsdl`
- **Endpoint**: `http://ec.europa.eu/taxation_customs/vies/services/checkVatService`
- **Namespace**: `urn:ec.europa.eu:taxud:vies:services:checkVat:types`

### Main Classes

- `checkVatApprox`: Request parameters with requester information
- `checkVatApproxResponse`: Detailed service response
- `checkVat`: Simple request without requester data
- `checkVatResponse`: Simple response
- `checkVatPortType`: SOAP service interface

## ⚠️ Important Notes

- The VIES service may not be available 24/7 (scheduled maintenance)
- Some countries may not provide all data (e.g., complete address)
- The number of requests may be limited by the service
- Ensure you have a stable Internet connection

## 🐛 Error Handling

The application handles the following cases:
- Empty required fields
- Invalid or unregistered VAT numbers
- VIES service connection errors
- Request timeouts

## 📝 License

Copyright (C) 2021-2025 Muzio Valerio

This project is released under the Apache 2.0 License. See the [LICENSE](LICENSE) file for more details.

## 👤 Author

**Muzio Valerio**

## 🤝 Contributing

Contributions are welcome! Feel free to:

1. Fork the project
2. Create a Feature Branch (`git checkout -b feature/NewFeature`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the Branch (`git push origin feature/NewFeature`)
5. Open a Pull Request

## 📞 Support

For issues, questions, or suggestions, open an [Issue](https://github.com/MuzioValerio/CheckVat/issues) on GitHub.

## 🔗 Useful Links

- [VIES - VAT Information Exchange System](https://ec.europa.eu/taxation_customs/vies/)
- [VIES SOAP Documentation](https://ec.europa.eu/taxation_customs/vies/technicalInformation.html)
- [Delphi SOAP Documentation](https://docwiki.embarcadero.com/RADStudio/en/Creating_SOAP_Clients)

## 📜 Changelog

### Version 1.0.0 (2021-05-19)
- Initial release
- Basic VAT verification
- Complete user interface
- Input validation

---

⭐ If you find this project useful, leave a star on GitHub!