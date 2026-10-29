unit URContasReceber_TitulosBaixados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTRELSIMPLES, Qrctrls, QuickRpt, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRContasReceber_TitulosBaixados = class(TFTRelSimples)
    QRBand3: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLPeriodo: TQRLabel;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText10: TQRDBText;
    QRGroup2: TQRGroup;
    QRLDescricao_Group: TQRLabel;
    QRDBQuebra: TQRDBText;
    QRBand5: TQRBand;
    QRLabel5: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLFinalidade: TQRLabel;
    QRLFilial: TQRLabel;
    QRBand4: TQRBand;
    QRLabel3: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr5: TQRExpr;
    QRLabel7: TQRLabel;
    QRLContrato: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText11: TQRDBText;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabel17: TQRLabel;
    QRLPagina: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel18: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    wPagina : Integer;
  end;

var
  FRContasReceber_TitulosBaixados: TFRContasReceber_TitulosBaixados;

implementation

uses UContasReceber_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFRContasReceber_TitulosBaixados.QRBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  QRLPagina.Caption := IntToStr(wPagina);

end;

procedure TFRContasReceber_TitulosBaixados.QRBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  Inc(wPagina);

end;

procedure TFRContasReceber_TitulosBaixados.QRBand4AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  inherited;
  wPagina := DMContasReceber.pNrPagina;

end;

procedure TFRContasReceber_TitulosBaixados.QRPrimarioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  if DMParamSistema.CodEmpresa = 'HOSPITAL' then  //Pedido por Diego, precisa somente de algums campos do relatório. Junior 13/08/2018
  begin
    QRGroup2.Enabled := False; //group Dt Baixa
    QRBand5.Enabled := False;  //Total do group Dt Baixa
    QRLabel9.Enabled := False;  //Num titulo
    QRDBText6.Enabled := False; //Num titulo
    QRLabel6.Enabled := False;  //Vl Original
    QRDBText4.Enabled := False; //vl Original
    QRLabel15.Enabled := False; //vl Desconto
    QRDBText1.Enabled := False; //vl Desconto
    QRLabel16.Enabled := False; //vl Juros
    QRDBText11.Enabled := False;//vl Juros
    QRLabel13.Enabled := False; //Forma Pgto
    QRDBText3.Enabled := False; //Forma Pgto
    QRExpr2.Enabled := False; //Total vl Original
    QRExpr8.Enabled := False; //total vl desconto
    QRExpr9.Enabled := False; //total vl juros
  end;

end;

end.
