unit URPedido_Vendedor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, QRExport, Qrctrls, QuickRpt, ExtCtrls;

type
  TFRPedido_Vendedor = class(TFTRelSimples)
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand3: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    QRLFilial: TQRLabel;
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
    QRBand4: TQRBand;
    QRLabel8: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText6: TQRDBText;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel13: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure setMostraSupervisor(sn : boolean);
  end;

var
  FRPedido_Vendedor: TFRPedido_Vendedor;

implementation

uses UEmbarque_cl;

{$R *.DFM}

{ TFRPedido_Vendedor }

procedure TFRPedido_Vendedor.setMostraSupervisor(sn: boolean);
begin
  if sn then //sn--> sim/nao
  begin
    QRLabel9.Enabled := false;
    QRLabel10.Enabled := false;
    QRLabel11.Enabled := false;
    QRLabel12.Enabled := false;

    QRGroup1.Enabled := true;

    QRBand4.Enabled := true;
  end
  else
  begin
    QRLabel9.Enabled := true;
    QRLabel10.Enabled := true;
    QRLabel11.Enabled := true;
    QRLabel12.Enabled := true;

    QRGroup1.Enabled := false;

    QRBand4.Enabled := false;
  end;
end;

end.
