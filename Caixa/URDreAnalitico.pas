unit URDreAnalitico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls;

type
  TFRELDREANALITICO = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel6: TQRLabel;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRShape3: TQRShape;
    QRLabel10: TQRLabel;
    QRExpr3: TQRExpr;
    QRLFilial: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel15: TQRLabel;
    QRShape4: TQRShape;
    QRDBText11: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel16: TQRLabel;
    QRShape5: TQRShape;
    QRExpr4: TQRExpr;
    QRLabel17: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText4: TQRDBText;
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRELDREANALITICO: TFRELDREANALITICO;

implementation

uses UCaixaRel_cl, UCaixaParam;

{$R *.dfm}

procedure TFRELDREANALITICO.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
With DMCaixaRel do
  Begin
    If (QRDre_Caixa_AnaliticoSVAL_FATURAMENTO_BRUTO.Value -
        QRDre_Caixa_AnaliticoSVAL_AQUISICOES.Value) < 0 Then
       QRexpr1.Font.Color := ClRed
    Else
       QRexpr1.Font.Color := clWindowText;

    If (QRDre_Caixa_AnaliticoSVAL_FATURAMENTO_BRUTO.Value -
        QRDre_Caixa_AnaliticoSVAL_CUSTO_VARIAVEL.Value) < 0 Then
       QRexpr2.Font.Color := ClRed
    Else
       QRexpr2.Font.Color := clWindowText;

    If (QRDre_Caixa_AnaliticoSVAL_FATURAMENTO_BRUTO.Value -
        QRDre_Caixa_AnaliticoSVAL_CUSTO_VARIAVEL.Value -
        QRDre_Caixa_AnaliticoSVAL_CUSTO_FIXO.Value) < 0 Then
       QRexpr3.Font.Color := ClRed
    Else
       QRexpr3.Font.Color := clWindowText;

    If (QRDre_Caixa_AnaliticoSVAL_FATURAMENTO_BRUTO.Value -
        QRDre_Caixa_AnaliticoSVAL_AQUISICOES.Value -
        QRDre_Caixa_AnaliticoSVAL_CUSTO_VARIAVEL.Value -
        QRDre_Caixa_AnaliticoSVAL_CUSTO_FIXO.Value -
        QRDre_Caixa_AnaliticoSVAL_DESPESA_FINANCEIRA.Value +
        QRDre_Caixa_AnaliticoSVAL_RECEITA_FINANCEIRA.Value  ) < 0 Then
       QRexpr4.Font.Color := ClRed
    Else
       QRexpr4.Font.Color := clWindowText;


  End;
end;

procedure TFRELDREANALITICO.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
     If FCaixaParam.RG18Compras.ItemIndex = 1 then
       DMCaixaRel.QRDre_Caixa_AnaliticoSVAL_AQUISICOES.Value := 0;
end;

end.
