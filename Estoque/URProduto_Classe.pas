unit URProduto_Classe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRProduto_Classe = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    SubClasse: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand3: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText12: TQRDBText;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRProduto_Classe: TFRProduto_Classe;

implementation

uses UProduto_cl, UProdutoRelatorio_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRProduto_Classe.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'DINIZ' Then
   Begin
     QRLabel3.Caption := '.';
     QRlabel7.Left := 114;
     QRlabel8.Left := 511;
     QRlabel10.Left := 542;
     QRlabel9.Left := 580;
     QRDbtext6.Left := 9;
     QRDbtext4.Font.Color := ClWindow;
     QRDbtext5.Left := 113;
     QRDbtext9.Left := 506;
     QRDbtext8.Left := 538;
     QRDbtext7.Left := 574;
   End;

end;

end.
