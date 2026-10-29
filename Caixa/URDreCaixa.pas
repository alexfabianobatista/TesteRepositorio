unit URDreCaixa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRCtrls, QRExport, QRWebFilt, QRPDFFilt, QuickRpt,
  ExtCtrls;

type
  TFrDreCaixa = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape3: TQRShape;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    QRLFilial: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrDreCaixa: TFrDreCaixa;

implementation

uses UCaixaRel_cl, UCaixaParam;

{$R *.dfm}

procedure TFrDreCaixa.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DMCaixaRel do
  Begin
    If (QRDre_CaixaSVAL_FATURAMENTO.Value -
        QRDre_CaixaSVAL_CUSTO_VARIAVEL.Value) < 0 Then
       QRexpr1.Font.Color := ClRed
    Else
       QRexpr1.Font.Color := clWindowText;

    If (QRDre_CaixaSVAL_FATURAMENTO.Value -
        QRDre_CaixaSVAL_CUSTO_VARIAVEL.Value -
        QRDre_CaixaSVAL_CUSTO_FIXO.Value) < 0 Then
       QRexpr2.Font.Color := ClRed
    Else
       QRexpr2.Font.Color := clWindowText;

    If (QRDre_CaixaSVAL_FATURAMENTO.Value -
        QRDre_CaixaSVAL_CUSTO_VARIAVEL.Value -
        QRDre_CaixaSVAL_CUSTO_FIXO.Value -
        QRDre_CaixaSVAL_DESPESA_FINANCEIRA.Value +
        QRDre_CaixaSVAL_RECEITA_FINANCEIRA.Value ) < 0 Then
       QRexpr3.Font.Color := ClRed
    Else
       QRexpr3.Font.Color := clWindowText;

  If FCaixaParam.RG18Compras.ItemIndex = 1 then
    QRDre_CaixaSVAL_AQUISICOES.Value := 0;
  End;
end;

end.
