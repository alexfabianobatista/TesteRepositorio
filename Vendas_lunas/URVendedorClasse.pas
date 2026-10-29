unit URVendedorClasse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport;

type
  TFRVendedorClasse = class(TFTRelSimples)
    QRBand4: TQRBand;
    QRBand5: TQRBand;
    QRBand6: TQRBand;
    QRDBText2: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel11: TQRLabel;
    QRExpr8: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText7: TQRDBText;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRLabel14: TQRLabel;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRDBText8: TQRDBText;
    QRExpr7: TQRExpr;
    QRExpr9: TQRExpr;
    QRDBText9: TQRDBText;
    QRExpr11: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRVendedorClasse: TFRVendedorClasse;

implementation

uses URelatorioVenda_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRVendedorClasse.FormCreate(Sender: TObject);
begin
  inherited;

  QRBand4.Height := 22;
  QRBand5.Height := 22;
  QRBand6.Height := 22;

  QRDBText9.Top  := 2;
  QRExpr11.Top   := 2;
  QRExpr20.Top   := 2;
  QRExpr21.Top   := 2;

  if (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'FAVILLE') and
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'ZADIMEL') then
  begin
    QRDBText8.Enabled := false;
    QRExpr7.Enabled   := false;
    QRExpr9.Enabled   := false;

    QRDBText7.Enabled := false;
    QRExpr14.Enabled  := false;
    QRExpr15.Enabled  := false;

    QRExpr12.Enabled  := false;
    QRExpr13.Enabled  := false;
    QRExpr16.Enabled  := false;

    QRLabel11.Caption := 'Custo';
    QRLabel13.Caption := 'Margem';
    QRLabel12.Caption := '';
  end
  else
  begin
    QRDBText9.Enabled := false;
    QRExpr11.Enabled  := false;
    QRExpr20.Enabled  := false;
    QRExpr21.Enabled  := false;
  end;
end;

end.
