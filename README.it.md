# CheckVat - Verifica Partita IVA Intracomunitaria

> 🇮🇹 Versione italiana | 🇬🇧 [English version](README.md)

![Delphi](https://img.shields.io/badge/Delphi-10.4+-red.svg)
![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)

Applicazione Delphi per la verifica delle Partite IVA intracomunitarie tramite il servizio SOAP VIES (VAT Information Exchange System) della Commissione Europea.

## 📋 Descrizione

CheckVat è un'applicazione desktop Windows che permette di verificare la validità delle Partite IVA intracomunitarie interrogando il database VIES dell'Unione Europea. L'applicazione utilizza il servizio SOAP ufficiale fornito dalla Commissione Europea per ottenere informazioni dettagliate sugli operatori economici registrati.

## ✨ Caratteristiche

- **Verifica Partita IVA**: Controlla la validità di una Partita IVA intracomunitaria
- **Informazioni dettagliate**: Recupera ragione sociale, indirizzo e tipo di società
- **Servizio ufficiale**: Utilizza il servizio VIES della Commissione Europea
- **Interfaccia intuitiva**: GUI semplice e user-friendly
- **Validazione input**: Controlli di validazione per i campi obbligatori
- **Richiesta autenticata**: Possibilità di specificare i dati del richiedente

## 🚀 Prerequisiti

- Delphi 10.4 Sydney o versioni successive
- Connessione Internet attiva per accedere al servizio VIES
- Windows 10 o superiore

## 📦 Installazione

1. Clona il repository:
```bash
git clone https://github.com/MuzioValerio/CheckVat.git
```

2. Apri il progetto in Delphi:
   - Apri il file `.dpr` principale del progetto

3. Compila il progetto:
   - Menu: Project → Build
   - Oppure premi `Shift+F9`

4. Esegui l'applicazione:
   - Premi `F9` o usa il menu Run → Run

## 💻 Utilizzo

### Interfaccia Principale

L'applicazione presenta due sezioni principali:

#### 1. Dati da Verificare
- **Nazione**: Codice paese ISO 3166-1 alpha-2 (es: IT, DE, FR)
- **Partita IVA**: Numero di Partita IVA da verificare (senza il prefisso paese)

#### 2. Dati Richiedente
- **Nazione**: Codice paese del richiedente
- **Partita IVA**: Partita IVA del richiedente

### Esempio di Utilizzo

1. Inserisci i dati della Partita IVA da verificare:
   - Nazione: `IT`
   - Partita IVA: `00000000000`

2. Inserisci i tuoi dati come richiedente:
   - Nazione: `IT`
   - Partita IVA: `12345678901`

3. Clicca sul pulsante **Verifica**

4. I risultati appariranno nel memo con le seguenti informazioni:
   - Data della richiesta
   - Codice paese
   - Numero Partita IVA
   - Ragione sociale
   - Indirizzo completo
   - Tipo di società

### Codici Paese Supportati

L'applicazione supporta tutti i paesi membri dell'UE:
- AT (Austria), BE (Belgio), BG (Bulgaria), CY (Cipro), CZ (Repubblica Ceca)
- DE (Germania), DK (Danimarca), EE (Estonia), EL (Grecia), ES (Spagna)
- FI (Finlandia), FR (Francia), HR (Croazia), HU (Ungheria), IE (Irlanda)
- IT (Italia), LT (Lituania), LU (Lussemburgo), LV (Lettonia), MT (Malta)
- NL (Paesi Bassi), PL (Polonia), PT (Portogallo), RO (Romania), SE (Svezia)
- SI (Slovenia), SK (Slovacchia)

## 🔧 Integrazione in Altri Progetti

Per utilizzare la funzionalità di verifica Partita IVA nei tuoi progetti Delphi:

1. Copia il file `checkVatService.pas` nel tuo progetto

2. Aggiungi l'unit nella clausola `uses`:
```pascal
uses
  checkVatService;
```

3. Esempio di codice base:
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
        // Partita IVA valida
        ShowMessage('Ragione Sociale: ' + lResponse.traderName);
      end;
    finally
      lParam.Free;
    end;
  finally
    HTTPRIO.Free;
  end;
end;
```

## 📁 Struttura del Progetto

```
CheckVat/
├── checkVatService.pas    # Unit generata dal WSDL del servizio VIES
├── uMain.pas              # Form principale e logica applicativa
├── uMain.dfm              # Definizione visuale del form
└── README.md              # Questo file
```

## 🔍 Dettagli Tecnici

### Servizio SOAP VIES

- **WSDL**: `https://ec.europa.eu/taxation_customs/vies/checkVatService.wsdl`
- **Endpoint**: `http://ec.europa.eu/taxation_customs/vies/services/checkVatService`
- **Namespace**: `urn:ec.europa.eu:taxud:vies:services:checkVat:types`

### Classi Principali

- `checkVatApprox`: Parametri della richiesta con informazioni del richiedente
- `checkVatApproxResponse`: Risposta dettagliata del servizio
- `checkVat`: Richiesta semplice senza dati del richiedente
- `checkVatResponse`: Risposta semplice
- `checkVatPortType`: Interfaccia del servizio SOAP

## ⚠️ Note Importanti

- Il servizio VIES potrebbe non essere disponibile 24/7 (manutenzioni programmate)
- Alcune nazioni potrebbero non fornire tutti i dati (es. indirizzo completo)
- Il numero di richieste potrebbe essere limitato dal servizio
- Assicurati di avere una connessione Internet stabile

## 🐛 Gestione Errori

L'applicazione gestisce i seguenti casi:
- Campi obbligatori vuoti
- Partita IVA non valida o non registrata
- Errori di connessione al servizio VIES
- Timeout delle richieste

## 📝 Licenza

Copyright (C) 2025 Muzio Valerio

Questo progetto è rilasciato sotto licenza Apache 2.0. Vedi il file [LICENSE](LICENSE) per maggiori dettagli.

## 👤 Autore

**Muzio Valerio**

## 🤝 Contribuire

I contributi sono benvenuti! Sentiti libero di:

1. Fare un Fork del progetto
2. Creare un Feature Branch (`git checkout -b feature/NuovaFunzionalita`)
3. Commit delle modifiche (`git commit -m 'Aggiunta nuova funzionalità'`)
4. Push al Branch (`git push origin feature/NuovaFunzionalita`)
5. Aprire una Pull Request

## 📞 Supporto

Per problemi, domande o suggerimenti, apri una [Issue](https://github.com/MuzioValerio/CheckVat/issues) su GitHub.

## 🔗 Link Utili

- [VIES - VAT Information Exchange System](https://ec.europa.eu/taxation_customs/vies/)
- [Documentazione SOAP VIES](https://ec.europa.eu/taxation_customs/vies/technicalInformation.html)
- [Delphi SOAP Documentation](https://docwiki.embarcadero.com/RADStudio/en/Creating_SOAP_Clients)

## 📜 Changelog

### Versione 1.0.0 (2021-05-19)
- Release iniziale
- Verifica base Partita IVA
- Interfaccia utente completa
- Validazione input

---

⭐ Se trovi utile questo progetto, lascia una stella su GitHub!