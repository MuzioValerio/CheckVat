unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Soap.InvokeRegistry, System.Net.URLClient, Vcl.StdCtrls, Soap.Rio,
  Soap.SOAPHTTPClient, System.UITypes;

type
  TForm1 = class(TForm)
    HTTPRIO1: THTTPRIO;
    btnVerify: TButton;
    Memo1: TMemo;
    gbDaVerificare: TGroupBox;
    edtPIVAVer: TEdit;
    Label2: TLabel;
    edtNazVer: TEdit;
    Label1: TLabel;
    gbRichiedente: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    edtPIVARic: TEdit;
    edtNazRic: TEdit;
    procedure btnVerifyClick(Sender: TObject);
  private
    function ValidateEntry: Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses checkVatService;

procedure TForm1.btnVerifyClick(Sender: TObject);
var
  lParam: checkVatApprox;
  lResponse: checkVatApproxResponse;
begin
  if not ValidateEntry then
    Abort;

  lParam := checkVatApprox.Create;
  try
    lParam.countryCode := edtNazVer.Text;
    lParam.vatNumber := edtPIVAVer.Text;
    lParam.requesterCountryCode := edtNazRic.Text;
    lParam.requesterVatNumber := edtPIVARic.Text;
    lResponse := (HTTPRIO1 as checkVatPortType).checkVatApprox(lParam);
    Memo1.Lines.Clear;
    if not lResponse.valid then
    begin
      Memo1.Lines.Add(
        Format('La Partita IVA %s ricerca non è registrata come operatore Intracomunitario', [edtPIVAVer.Text]));
    end
    else
    begin
      Memo1.Lines.Add('Data della richiesta: ' + DateToStr(lResponse.requestDate.AsDate));
      Memo1.Lines.Add('Nazione: ' + lResponse.countryCode);
      Memo1.Lines.Add('Identificativo fiscale: ' + lResponse.vatNumber);
      Memo1.Lines.Add('Ragione Sociale: ' + lResponse.traderName);
      Memo1.Lines.Add('Indirizzo: ' + lREsponse.traderAddress);
      Memo1.Lines.Add(lResponse.traderStreet);
      Memo1.Lines.Add(lResponse.traderPostcode);
      Memo1.Lines.Add(lResponse.traderCity);
      Memo1.Lines.Add(lResponse.traderCompanyType);
    end;
  finally
  end;
end;

function TForm1.ValidateEntry: Boolean;
begin
  if (Trim(edtNazVer.Text) = '') or (Trim(edtPIVAVer.Text)= '') then
  begin
    MessageDlg('La Nazione e la Partita IVA da Verificare sono obbligatori', mtWarning, [mbOK], -1);
    Exit(False);
  end;

  if (Trim(edtNazRic.Text) = '') or (Trim(edtPIVARic.Text) = '') then
  begin
    MessageDlg('La Nazione e la Partita IVA del richiedente sono obbligatori', mtWarning, [mbOK], -1);
    Exit(False);
  end;

  Exit(True);
end;

end.
