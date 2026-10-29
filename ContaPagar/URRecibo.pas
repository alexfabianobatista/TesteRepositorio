unit URRecibo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, QRExport, QRWebFilt, QRPDFFilt, StdCtrls;

type
  TFRRecibo = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLDataEmissao: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBTitulo: TQRDBText;
    QRDBParcela: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel7: TQRLabel;
    QRLValor: TQRLabel;
    QRLValorExtenso: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLDescricao: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBCod_Conta: TQRDBText;
    QRDBText12: TQRDBText;
    QRLData: TQRLabel;
    QRLabel13: TQRLabel;
    QRLResponsavel: TQRLabel;
    QRDBText10: TQRDBText;
    QRLRecebido: TQRLabel;
    QRDBVENC: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLValor_Juros: TQRLabel;
    QRLabel14: TQRLabel;
    QRLDesconto: TQRLabel;
    QRLabel15: TQRLabel;
    QRLValor_Baixa: TQRLabel;
    QRLResponsavel2: TQRLabel;
    QRLabel16: TQRLabel;
    QRLSaldo: TQRLabel;
    QRBand2: TQRBand;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLDataEmissao1: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBTitulo1: TQRDBText;
    QRDBParcela1: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLValor1: TQRLabel;
    QRLValorExtenso1: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLDescricao1: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBCod_Conta1: TQRDBText;
    QRDBText18: TQRDBText;
    QRLData1: TQRLabel;
    QRLabel32: TQRLabel;
    QRLResponsavel1: TQRLabel;
    QRDBText19: TQRDBText;
    QRLRecebido1: TQRLabel;
    QRDBVENC1: TQRDBText;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLValor_Juros1: TQRLabel;
    QRLabel38: TQRLabel;
    QRLDesconto1: TQRLabel;
    QRLabel40: TQRLabel;
    QRLValor_Baixa1: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLSaldo1: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRLLblFormaPagto: TQRLabel;
    QRLFormaPagto: TQRLabel;
    QRLLblFormaPagto1: TQRLabel;
    QRLFormaPagto1: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel19: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRRecibo: TFRRecibo;

implementation

uses UFilial_cl, UContasPagar_cl, UContasReceber_cl, UParamSistema_cl;


{$R *.DFM}

procedure TFRRecibo.FormCreate(Sender: TObject);
begin
  QRLabel34.Enabled := false;
  QRLabel33.Enabled := false;
  If (DMParamSistema.CodEmpresa = 'GRASEL') Or
     (DMParamSistema.CodEmpresa = 'MOINHO') Then
   Begin
     QuickRep1.Page.Length := 297;
     QRBand2.Enabled := True;
   End;
//Alteração de relatório para empresa Geopro - Kauã 04/08/2021
   if (DMParamSistema.CodEmpresa <> 'GRASEL') and (DMParamSistema.CodEmpresa <> 'MOINHO') and (DMParamSistema.CodEmpresa <> 'SONOBOM') and
      (DMParamSistema.CodEmpresa <> 'INJEPAR') and (DMParamSistema.CodEmpresa <> 'ALVARES') and (DMParamSistema.CodEmpresa <> 'ACOESTE') and
      (DMParamSistema.CodEmpresa <> 'SM')  Then //Adicionado Injepar 29/03/2023 - Alex
   Begin
      QRLabel4.Top := 108;
      QRLabel4.Left := 16;
      QRDBText5.Top := 108;
      QRDBText5.Left := 100;
      QRLabel33.Top := 195;
      QRLabel34.Top := 195;
      QRLabel8.Top := 159;
      QRLRecebido.Top := 159;
      QRLValorExtenso.Left := 200;
      QRLValorExtenso.Top := 209;
      QRLabel15.Top := 209;
      QRLValor.Top := 209;

      QRLabel14.Enabled := false;
      QRLValor_Baixa.Enabled := false;
      QRLabel12.Enabled := false;
      QRLabel7.Enabled := false;
      QRLValor_Juros.Enabled := false;
      QRLDesconto.Enabled := false;
      QRLabel16.Enabled := false;
      QRLSaldo.Enabled := false;
      QRLabel10.Enabled := false;
      QRDBVENC.Enabled := false;
      QRLabel1.Enabled := false;
      QRDBParcela.Enabled := false;
      QRLLblFormaPagto.Enabled := false;
      QRLFormaPagto.Enabled := false;

      QRLabel34.Enabled := Enabled;
      QRLabel33.Enabled := Enabled;

      QRDBText15.Font.Style := [fsbold];
      QRLabel3.Font.Style := [fsbold];
      QRLDataEmissao.Font.Style := [fsbold];
      QRLabel6.Font.Style := [fsbold];
      QRDBTitulo.Font.Style := [fsbold];
      QRLRecebido.Font.Style := [fsbold];
      QRLValorExtenso.Font.Style := [fsbold];
      QRLResponsavel.Font.Style := [fsbold];
      QRLabel25.Font.Style := [fsbold];
   End;

end;

procedure TFRRecibo.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  if (DMParamSistema.CodEmpresa = 'SONOBOM') then
   begin
     QRDBText15.DataSet := DMParamSistema.QParamSistema;
     QRDBText15.DataField := 'DESC_EMPRESA';
   end;
end;

end.
