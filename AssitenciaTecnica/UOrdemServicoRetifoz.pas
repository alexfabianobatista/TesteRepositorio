unit UOrdemServicoRetifoz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRExport, QRWebFilt, QRPDFFilt, QRCtrls, QuickRpt,
  ExtCtrls, grimgctrl;

type
  TFROrdemServicoRetifoz = class(TFTRelSimples)
    QRLogo: TQRImage;
    QRLLogo: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel40: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    QRLabel5: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText16: TQRDBText;
    QRBand4: TQRBand;
    QRHRule1: TQRHRule;
    QRDBText14: TQRDBText;
    QRShape5: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel41: TQRLabel;
    QRShape1: TQRShape;
    QRBand5: TQRBand;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel46: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRLabel47: TQRLabel;
    QRDBText26: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel49: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FROrdemServicoRetifoz: TFROrdemServicoRetifoz;

implementation

uses
  UOrdemServico_cl;

{$R *.dfm}

procedure TFROrdemServicoRetifoz.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  inherited;

  if FileExists(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg') then
  begin
    QRLogo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'logo\logo.jpg');
    QRLLogo.Enabled := False;
  end
  else
  begin
    QRLogo.Picture := Nil;
    QRLLogo.Enabled := True;
  end;
  
end;

procedure TFROrdemServicoRetifoz.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
  var
  wTotalProd, wTotalServ, wTotalGeral, wDescProd, wDescServ, wDescGeral : real;
begin
  inherited;
  wTotalProd := 0;
  wTotalServ := 0;
  wTotalGeral:= 0;
  wDescProd  := 0;
  wDescServ  := 0;
  wDescGeral := 0;
  DMOrdemServico.QROrdemServicoRetifoz.First;
  while not DMOrdemServico.QROrdemServicoRetifoz.Eof do
  Begin
    if DMOrdemServico.QROrdemServicoRetifozIND_TIPO_PRODUTO.Text = 'SERVIÇO' then
    Begin
      wTotalServ :=  wTotalServ + (DMOrdemServico.QROrdemServicoRetifozVL_UNITARIO.Value *
                      DMOrdemServico.QROrdemServicoRetifozQT_PRODUTO.Value);
      wDescServ := wDescServ + (DMOrdemServico.QROrdemServicoRetifozQT_PRODUTO.Value*
                               DMOrdemServico.QROrdemServicoRetifozVAL_DESCONTO.Value);
    end
    else
    Begin
      wTotalProd :=  wTotalProd + (DMOrdemServico.QROrdemServicoRetifozVL_UNITARIO.Value *
                      DMOrdemServico.QROrdemServicoRetifozQT_PRODUTO.Value);
      wDescProd := wDescProd + (DMOrdemServico.QROrdemServicoRetifozQT_PRODUTO.Value*
                               DMOrdemServico.QROrdemServicoRetifozVAL_DESCONTO.Value);
    end;
    
    DMOrdemServico.QROrdemServicoRetifoz.Next;
  end;

  wTotalGeral := wTotalProd + wTotalServ;
  wDescGeral := WdescProd + wdescServ;
  QRLabel46.Caption := Formatfloat('#,##0.00',wTotalProd);
  QRLabel31.Caption := Formatfloat('#,##0.00',wTotalProd-wDescProd);
  QRLabel30.Caption := Formatfloat('#,##0.00',wDescProd);
  QRLabel32.Caption := Formatfloat('#,##0.00',wTotalServ);
  QRLabel34.Caption := Formatfloat('#,##0.00',wTotalServ-wDescServ);
  QRLabel33.Caption := Formatfloat('#,##0.00',wDescServ);
  QRLabel35.Caption := Formatfloat('#,##0.00',wTotalGeral);
  QRLabel38.Caption := Formatfloat('#,##0.00',wTotalGeral - wDescGeral);
  QRLabel36.Caption := Formatfloat('#,##0.00',wDescGeral);
end;

end.
