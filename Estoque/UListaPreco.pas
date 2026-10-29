unit UListaPreco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, quickrpt, Qrctrls, QRExport, QRWebFilt, QRPDFFilt;

type
  TFRListaPreco = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRSysData2: TQRSysData;
    QRLabel2: TQRLabel;
    QRBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRLTitulo: TQRLabel;
    QRLEmpresa: TQRLabel;
    QRSysData1: TQRSysData;
    QRBand3: TQRBand;
    QRLCodigo: TQRLabel;
    QRLProduto: TQRLabel;
    QRLUn: TQRLabel;
    QRLEmbalagem: TQRLabel;
    QRLTributacao: TQRLabel;
    QRLPrecoAtacMin: TQRLabel;
    QRLPrecoVarMax: TQRLabel;
    QRBDetail: TQRBand;
    QRDBTCodigo: TQRDBText;
    QRDBTProduto: TQRDBText;
    QRDBTEmbalagem: TQRDBText;
    QRDBTPrecoAtacMin: TQRDBText;
    QRDBTTributacao: TQRDBText;
    QRDBTUn: TQRDBText;
    QRDBTPrecoVarMax: TQRDBText;
    QRLNomeRel: TQRLabel;
    QRLVencto: TQRLabel;
    QRDBTVencto: TQRDBText;
    QRLCustoMedio: TQRLabel;
    QRDBTCustoMedio: TQRDBText;
    QRLLocalizacao: TQRLabel;
    QRDBTLocalizacao: TQRDBText;
    QRLNumFab: TQRLabel;
    QRDBTNumFab: TQRDBText;
    QRTextFilter1: TQRTextFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRHTMLFilter1: TQRHTMLFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    procedure FormCreate(Sender: TObject);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
    fCod_Filial : Real;
  public
    { Public declarations }
    Property pCod_Filial : Real Read fCod_Filial Write fCod_Filial;
  end;

var
  FRListaPreco: TFRListaPreco;

implementation

uses UOracle_cl, UProduto_cl, UParamSistema_cl, UProdutoRelatorio_cl;

{$R *.DFM}


procedure TFRListaPreco.FormCreate(Sender: TObject);
var
  wTam: Integer;
begin
{  DMParamSistema.QParamSistema.Open;}
  QRLPrecoAtacMin.Caption:='Pr. '+DMParamSistema.QParamSistemaInd_Preco.value;
  QRLPrecoVarMax.Caption:='Pr. '+DMParamSistema.QParamSistemaInd_Preco2.value;
{  DMParamSistema.QParamSistema.Close;}
  if ((DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'SONOBOM') or
      (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZORZINCO')) then
  begin
    QRLPrecoAtacMin.Left := 458;
    QRLPrecoVarMax.Left  := 549;
    QRDBTPrecoAtacMin.Left := 455;
    QRDBTPrecoVarMax.Left := 549;

    QRLCustoMedio.Left   := 890;
    QRLLocalizacao.Left  := 912;
    QRDBTCustoMedio.Left := 882;
    QRDBTLocalizacao.Left := 912;

  end;
  If (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'INSIDE') or
     (DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'DISPART') Then
  begin
  {  QRLCodigo.Caption := 'Num. Fab.';
    QRDBTCodigo.DataField := 'NUM_FABRICANTE';  } //Não estava respeitando o parametro passado na tela - 29/05/2017 Vanessa
    {wTam := 100;
    QRDBTCodigo.Width := QRDBTCodigo.Width + wTam;
    QRLProduto.Left := QRLProduto.Left + wTam;
    QRDBTProduto.Left := QRDBTProduto.Left + wTam;
    QRDBTProduto.Width := QRDBTProduto.Width - wTam; }

    wTam := 100;
    //QRDBTProduto.Width := QRDBTProduto.Width - wTam;
    QRDBTTributacao.Width := QRDBTTributacao.Width + wTam;
    QRLCustoMedio.Left := QRLCustoMedio.Left - wTam;
    QRLLocalizacao.Left := QRLLocalizacao.Left - wTam;
    QRLVencto.Left := QRLVencto.Left - wTam;
    QRLUn.Left := QRLUn.Left - wTam;
    QRLEmbalagem.Left := QRLEmbalagem.Left - wTam;
    QRLTributacao.Left := QRLTributacao.Left - wTam;
    QRDBTCustoMedio.Left := QRDBTCustoMedio.Left - wTam;
    QRDBTLocalizacao.Left := QRDBTLocalizacao.Left - wTam;
    QRDBTVencto.Left := QRDBTVencto.Left - wTam;
    QRDBTUn.Left := QRDBTUn.Left - wTam;
    QRDBTEmbalagem.Left := QRDBTEmbalagem.Left - wTam;
    QRDBTTributacao.Left := QRDBTTributacao.Left - wTam;

    QRLTributacao.Caption := 'Classe';
    QRDBTTributacao.DataField := 'DESC_CLASSE';
    QRDBTTributacao.Alignment := taLeftJustify;
  end
  else
  begin
    QRLLocalizacao.Enabled := False;
    QRDBTLocalizacao.Enabled := False;
    QRLCustoMedio.Left := QRLLocalizacao.Left + QRLLocalizacao.Width - QRLCustoMedio.Width;
    QRDBTCustoMedio.Left := QRDBTLocalizacao.Left + QRDBTLocalizacao.Width - QRDBTCustoMedio.Width;
    QRDBTProduto.Width := QRDBTCustoMedio.Left - QRDBTProduto.Left;
  end;
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'ZORZINCO' then
  begin
    QRDBTNumFab.Font.Size := 9;
    QRDBTProduto.Font.Size := 9;
    QRDBTCustoMedio.Font.Size := 9;
    QRDBTLocalizacao.Font.Size := 9;
    QRDBTVencto.Font.Size := 9;
    QRDBTUn.Font.Size := 9;
    QRDBTEmbalagem.Font.Size := 9;
    QRDBTTributacao.Font.Size := 9;
    QRDBTPrecoAtacMin.Font.Size := 9;
    QRDBTPrecoVarMax.Font.Size := 9;
  end;
end;


procedure TFRListaPreco.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
    QRLEmpresa.Caption := 'Empresa: '+DMOracle.BuscaNome('SELECT TB_PARAM_SISTEMA.DESC_EMPRESA FROM TB_PARAM_SISTEMA',
                                                       'TB_PARAM_SISTEMA.COD_FILIAL >= 0');
    QRLNomeRel.Caption := Self.Name;
end;

end.
