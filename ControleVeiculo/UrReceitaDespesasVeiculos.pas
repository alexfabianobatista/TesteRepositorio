unit UrReceitaDespesasVeiculos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl;

type
  TFrReceitaDespesasVeiculos = class(TFTRelSimples)
    QRGroup1: TQRGroup;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRBand3: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRBand4: TQRBand;
    QRLabel7: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRLabel8: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBDescObservacao: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel12: TQRLabel;
    QRSummary: TQRBand;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRL1Classificacao: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRHRule1: TQRHRule;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrReceitaDespesasVeiculos: TFrReceitaDespesasVeiculos;

implementation

uses UCustoVeiculoMov_cl, UParamSistema_cl;

{$R *.dfm}

procedure TFrReceitaDespesasVeiculos.QRBand3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRHRule1.Enabled := false;
  QRLabel15.Enabled := false;
  QRDBText12.Enabled := false;
  QRLabel16.Enabled := false;
  QRDBText13.Enabled := false;
  QRLabel17.Enabled := false;
  QRDBText14.Enabled := false;
  QRLabel18.Enabled := false;
  QRDBText15.Enabled := false;
  QRHRule1.Visible := false;
  QRLabel15.Visible := false;
  QRDBText12.Visible := false;
  QRLabel16.Visible := false;
  QRDBText13.Visible := false;
  QRLabel17.Visible := false;
  QRDBText14.Visible := false;
  QRLabel18.Visible := false;
  QRDBText15.Visible := false;
  with DMCustoVeiculoMov do
  begin
    if (QRCustoVeiculo_receitaDESC_OBSERVACAO.Value <> '') or (QRCustoVeiculo_ReceitaKM.Value <> 0.0) then
    begin
      QRDBDescObservacao.Enabled := true;
      QRBand3.Height := 34;
    end
    else
      QRBand3.Height :=  19;
    if (DMParamSistema.CodEmpresa = 'ITATIBA') and (QRCustoVeiculo_ReceitaNUM_ROMANEIO.Text <> '') and (QRCustoVeiculo_ReceitaNUM_ROMANEIO.Value <> 0) then
    begin
      QRHRule1.Enabled := true;
      QRLabel15.Enabled := true;
      QRDBText12.Enabled := true;
      QRLabel16.Enabled := true;
      QRDBText13.Enabled := true;
      QRLabel17.Enabled := true;
      QRDBText14.Enabled := true;
      QRLabel18.Enabled := true;
      QRDBText15.Enabled := true;
      QRHRule1.Visible := true;
      QRLabel15.Visible := true;
      QRDBText12.Visible := true;
      QRLabel16.Visible := true;
      QRDBText13.Visible := true;
      QRLabel17.Visible := true;
      QRDBText14.Visible := true;
      QRLabel18.Visible := true;
      QRDBText15.Visible := true;

      QRBand3.Height := 34;
      QRHRule1.top := 26;
      QRLabel15.Top := 15;
      QRDBText12.Top := 16;
      QRLabel16.Top := 15;
      QRDBText13.Top := 16;
      QRLabel17.Top := 15;
      QRDBText14.Top := 16;
      QRLabel18.Top := 15;
      QRDBText15.Top := 16;
    end
    else
      QRBand3.Height :=  17;
  end;
end;

end.
