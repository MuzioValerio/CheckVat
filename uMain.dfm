object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 480
  ClientWidth = 725
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    725
    480)
  PixelsPerInch = 96
  TextHeight = 13
  object btnVerify: TButton
    Left = 4
    Top = 230
    Width = 194
    Height = 25
    Caption = 'Verify'
    TabOrder = 2
    OnClick = btnVerifyClick
  end
  object Memo1: TMemo
    Left = 204
    Top = 8
    Width = 513
    Height = 464
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      '')
    TabOrder = 3
  end
  object gbDaVerificare: TGroupBox
    Left = 4
    Top = 120
    Width = 194
    Height = 104
    Anchors = [akTop, akRight]
    Caption = 'Da Verificare'
    TabOrder = 1
    object Label2: TLabel
      Left = 18
      Top = 58
      Width = 52
      Height = 13
      Caption = 'Partita IVA'
    end
    object Label1: TLabel
      Left = 18
      Top = 18
      Width = 38
      Height = 13
      Caption = 'Nazione'
    end
    object edtPIVAVer: TEdit
      Left = 18
      Top = 72
      Width = 154
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object edtNazVer: TEdit
      Left = 18
      Top = 31
      Width = 58
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
  end
  object gbRichiedente: TGroupBox
    Left = 4
    Top = 8
    Width = 194
    Height = 104
    Anchors = [akTop, akRight]
    Caption = 'Richiedente'
    TabOrder = 0
    object Label3: TLabel
      Left = 18
      Top = 58
      Width = 52
      Height = 13
      Caption = 'Partita IVA'
    end
    object Label4: TLabel
      Left = 18
      Top = 18
      Width = 38
      Height = 13
      Caption = 'Nazione'
    end
    object edtPIVARic: TEdit
      Left = 18
      Top = 72
      Width = 154
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object edtNazRic: TEdit
      Left = 18
      Top = 31
      Width = 58
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
    end
  end
  object HTTPRIO1: THTTPRIO
    URL = 
      'http://ec.europa.eu/taxation_customs/vies/services/checkVatServi' +
      'ce'
    HTTPWebNode.URL = 
      'http://ec.europa.eu/taxation_customs/vies/services/checkVatServi' +
      'ce'
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 60
    Top = 339
  end
end
