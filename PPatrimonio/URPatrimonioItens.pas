unit URPatrimonioItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRPatrimonioItens = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLBFilial: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText15: TQRDBText;
    QRLBPeriodo: TQRLabel;
    QRGHLocalizacao: TQRGroup;
    QRGHUsuario: TQRGroup;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBCodProduto: TQRDBText;
    QRLCodProduto: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRPatrimonioItens: TFRPatrimonioItens;

implementation

uses UPatrimonio_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRPatrimonioItens.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := CaFree;
  FRPatrimonioItens := nil;
end;

procedure TFRPatrimonioItens.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'AB' then
  begin
    QRGroup1.Height := 0;
    QRGHLocalizacao.Height := 0;
    QRGHUsuario.Height := 0;
  end
  else
  begin
    QRLCodProduto.Caption := ''; //nao vai aparecer
    QRDBCodProduto.DataField := ''; //nao vai aparecer
  end; 
end;

end.
