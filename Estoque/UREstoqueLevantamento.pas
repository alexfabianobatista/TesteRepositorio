unit UREstoqueLevantamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, quickrpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRLevantamentoEstoque = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel7: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel10: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText5: TQRDBText;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRLevantamentoEstoque: TFRLevantamentoEstoque;

implementation

uses UProduto_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRLevantamentoEstoque.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.value = 'MEDIBENS' then
  begin
    QRGroup1.Expression := '';
    QRGroup1.Height := 0;
  end;
end;

end.
