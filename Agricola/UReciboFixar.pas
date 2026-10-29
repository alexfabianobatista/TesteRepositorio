unit UReciboFixar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, QRWebFilt, QRExport, QRPDFFilt;

type
  TFReciboFixar = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    QRLEmpresa: TQRLabel;
    QRLEndereco: TQRLabel;
    QRLCep_Cidade_UF: TQRLabel;
    QRLTelefone: TQRLabel;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLOUTROS: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRLValOutros: TQRLabel;
    QRLValSubTotal: TQRLabel;
    QRLDataExtenso: TQRLabel;
    QRShape1: TQRShape;
    QRDBText11: TQRDBText;
    QRSysData1: TQRSysData;
    QRDBText3: TQRDBText;
    QRLabel22: TQRLabel;
    QRLDtPagto: TQRLabel;
    QRLNumero: TQRLabel;
    QRLabel26: TQRLabel;
    QRLObservacao: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel25: TQRLabel;
    QRLProduto: TQRLabel;
    QRShape2: TQRShape;
    QRDBText6: TQRDBText;
    QRLSacas: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel23: TQRLabel;
    QRLContaCorrente: TQRLabel;
    QRPDFFilter1: TQRPDFFilter;
    QRTextFilter1: TQRTextFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRLabel24: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel35: TQRLabel;
    QRLValorExtenso: TQRLabel;
    QRLabel36: TQRLabel;
    QRLData: TQRLabel;
    QRLabel37: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRLValor: TQRLabel;
    QRDBText22: TQRDBText;
    QRLNRRECIBO: TQRLabel;
    QRLDt_Recibo: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLComplemento: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText24: TQRDBText;
    QRLUsuario: TQRLabel;
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    FCodCadastro : Real;
    FCodFilial :Real;
  public
    { Public declarations }
    property pCodCadastro : Real read FCodCadastro write FCodCadastro;
    property pCodFilial : Real read FCodFilial write FCodFilial;
  end;

var
  FReciboFixar: TFReciboFixar;

implementation

uses UOracle_cl, UNotaEntrada_cl, UCadastro_cl, UBiblioteca,
  UParamSistema_cl, USerie_cl;

{$R *.DFM}

procedure TFReciboFixar.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var vValor:Real;
    //wEmbalagem : String;
    wConversaoFardo: String;
begin
  vValor := 0;
  if QRLValOutros.Caption <> '0,00' then
    vValor:=StrtoFloat(Bib.LimpaString(QRLValOutros.Caption,'.'));
  vValor:=DMNotaEntrada.QItemNFVAL_TOTAL.value - vValor - DMNotaEntrada.QNotaEntradaVAL_FUNRURAL.Value -
          DMNotaEntrada.QNotaEntradaVAL_DESCONTO_FITAS.Value - DmNotaEntrada.QItemNFVAL_DPI_TRANSGENICOS.value -
          DmNotaEntrada.QItemNFVAL_FACS.value - DmNotaEntrada.QItemNFVAL_FETHAB.value;
  QRLValSubTotal.Caption:=FormatFloat('#,##0.00',vValor);
  If DMNotaEntrada.QItemNFQt_Quantidade.Value > 0 Then
  Begin
    //wEmbalagem := DMOracle.BuscaNome('SELECT NUM_EMBALAGEM FROM TB_PRODUTO','COD_PRODUTO = '+DMNotaEntrada.QItemNFCod_Produto.Text);
    //If wEmbalagem <> '' Then
    wConversaoFardo := DMOracle.BuscaNome('SELECT NUM_CONVERTE_FARDO FROM TB_PRODUTO','COD_PRODUTO = '+DMNotaEntrada.QItemNFCod_Produto.Text);
    if wConversaoFardo <> '' then
      QRLSacas.Caption:=FormatFloat('#,##0.00',DMNotaEntrada.QItemNFQt_Quantidade.Value / StrToFloat(wConversaoFardo));

  End;
end;

procedure TFReciboFixar.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);

begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'GONZATTI' then
  Begin
    QRLabel38.Visible := False;
    QRLabel38.Enabled := False;
    with DMNotaEntrada do
    Begin
      if DMNotaEntrada.QNotaEntradaNUM_NOTA.Text = '0' then
        QRLabel39.Caption := 'Nr. Nota..: '+ IntToStr(StrToInt(DMOracle.BuscaNome('SELECT NUM_SERIE FROM TB_SERIE','COD_FILIAL='+
                             QNotaEntradaCOD_FILIAL.Text+' AND COD_SERIE='''+ QNotaEntradaCOD_SERIE.Text+''''))+1)
      else
        QRLabel39.Caption := 'Nr. Nota..: '+ QNotaEntradaNUM_NOTA.Text;
    end;
  end;  
end;

end.
