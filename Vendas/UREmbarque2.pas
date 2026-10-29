unit UREmbarque2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFREmbarque2 = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRGroup1: TQRGroup;
    QRDBText4: TQRDBText;
    QRDBText6: TQRDBText;
    QRBRodPedido: TQRBand;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText10: TQRDBText;
    QRBand4: TQRBand;
    QRLabel10: TQRLabel;
    QRExpr1: TQRExpr;
    QrDescricao: TQRLabel;
    QRLabel13: TQRLabel;
    QrNrPedidos: TQRLabel;
    QRDBText5: TQRDBText;
    QRExpr2: TQRExpr;
    QRDBText11: TQRDBText;
    QRExpr3: TQRExpr;
    QRDBText12: TQRDBText;
    QRExpr4: TQRExpr;
    QRGroup2: TQRGroup;
    QRLabel15: TQRLabel;
    QRBand5: TQRBand;
    QRLabel16: TQRLabel;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRLabel6: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel5: TQRLabel;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRDBText14: TQRDBText;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRLabel24: TQRLabel;
    QRExpr13: TQRExpr;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRLabel32: TQRLabel;
    QRExpr16: TQRExpr;
    QRDBText13: TQRDBText;
    QRLPesoBruto: TQRLabel;
    QRLPesoLiquido: TQRLabel;
    QRLValor: TQRLabel;
    QRLQtde: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel33: TQRLabel;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRLabel34: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBRodPedidoBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FREmbarque2: TFREmbarque2;

implementation

uses UEmbarque_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFREmbarque2.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  With DmEmbarque do
  Begin
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Text = 'CGS' then
      Begin
        QRDBText6.Left := 441;
        QRDBText6.Width := 30;
        QRDescricao.Width := 377;
      end;
    if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'POLLYANA' Then
      QrDescricao.Caption := Trim(QrEmbarque2Desc_Produto.Value) + '-'+Trim(QrEmbarque2QT_EMBALAGEM.Text)
    else if DMParamSistema.CodEmpresa = 'BIGMETAL' then
      QrDescricao.Caption := Trim(QrEmbarque2Desc_Produto.Value)
    else
      QrDescricao.Caption := Trim(QrEmbarque2Desc_Produto.Value) + '-'+Trim(QrEmbarque2Desc_Lote.Value);
  End;
end;

procedure TFREmbarque2.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  QrNrPedidos.Caption := '';
end;

procedure TFREmbarque2.QRBRodPedidoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARICOTA' then
  begin
    QRLabel8.Enabled   := False; //KM
    QRDBText9.Enabled  := False; //KM
    QRLabel9.Enabled   := False; //OBS
    QRDBText10.Enabled := False; //OBS
    QRDBText13.Enabled := False; //obs
    QRLabel13.Top   := 100;      //Pedidos
    QrNrPedidos.Top := 116;      //Pedidos
  end;
end;

procedure TFREmbarque2.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  inherited;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MARICOTA' then
  begin
    QRLabel14.Enabled      := False; //Metros
    QRDBText12.Enabled     := False; //Metros
    QRExpr4.Enabled        := False; //Metros
    QRLabel17.Enabled      := False; //Variacao
    QRExpr9.Enabled        := False; //variacao
    QRLabel18.Enabled      := False; //Variacao
    QRExpr10.Enabled       := False; //Variacao
    QRBand4.Enabled        := False; //Dados Transportador
    QRGroup2.Enabled       := False; //Classe
    QRBand5.Enabled        := False; //Sumary da Classe
    QRLPesoBruto.Enabled   := True;
    QRLPesoLiquido.Enabled := True;
    QRLQtde.Enabled        := True;
    QRLValor.Enabled       := True;
  end;

  if (DMParamSistema.CodEmpresa = 'DEION') or (DMParamSistema.CodEmpresa = 'BIGMETAL') then
    QRBand4.Enabled := False;

end;

procedure TFREmbarque2.FormCreate(Sender: TObject);
begin
  inherited;
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'POLLYANA' then
  Begin
    QRLPesoLiquido.Enabled := False;
    QRDBText14.Enabled := False;
    QRExpr11.Enabled := False;
    QRExpr12.Enabled := False;
    QRLabel24.Enabled := False;
  end;
end;

end.
