unit URDRE;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, QRExport, QRXMLSFilt, QRPDFFilt;

type
  TFRDRE = class(TForm)
    QRPrimario: TQuickRep;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    tDescricao: TQRDBText;
    tValor: TQRDBText;
    QRLabel1: TQRLabel;
    QRBand3: TQRBand;
    QRLabel3: TQRLabel;
    QRLTitular: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLEmpresa: TQRLabel;
    QRLabel2: TQRLabel;
    QRLPeriodo: TQRLabel;
    QRSysData1: TQRSysData;
    QRLabel7: TQRLabel;
    QRBand4: TQRBand;
    QRLSaldoAtual: TQRLabel;
    QRLNumPagina: TQRLabel;
    QRLContador: TQRLabel;
    QRLCrc: TQRLabel;
    QRLCpf_Contador: TQRLabel;
    QRLabel4: TQRLabel;
    QRLCpf_Administrador: TQRLabel;
    QRTextFilter1: TQRTextFilter;
    QRPDFFilter1: TQRPDFFilter;
    QRXMLSFilter1: TQRXMLSFilter;
    QRExcelFilter1: TQRExcelFilter;
    QRRTFFilter1: TQRRTFFilter;
    tValorAnterior: TQRDBText;
    QRLSaldoAnterior: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
    FPag_Inicial: Real;
    FNum_Linhas : Real;
  public
    { Public declarations }
    Property Pag_Inicial: Real Read FPag_Inicial write FPag_Inicial;
    Property Num_Linhas : Real Read FNum_Linhas write FNum_Linhas;
  end;

var
  FRDRE: TFRDRE;
  vNum_Pagina:Real;

implementation

uses UDRE_cl, UOracle_cl, UParamSistema_cl, URDREParam;

{$R *.DFM}

procedure TFRDRE.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
//  ShowMessage(DMDRE.CdDreDESC_AGLUTINACAO.Value);
  if DMDRE.CdDreNUM_AGRUPAMENTO.Value = 1 then
  Begin
    tDescricao.Font.Style := [fsBold];
    tDescricao.Left := 16;
    if DMDRE.CdDreIND_TOTALIZADOR.Value <> 'S' then
    Begin
      if DMDRE.CdDreVAL_SALDO.Value = 0 then
      begin
        tValor.Height := 0;
        tValorAnterior.Height := 0;
      end
      else
      begin
        tValor.Height := 17;
        tValorAnterior.Height := 17;
      end;
    End
    else
    begin
      tValor.Height := 0;
      tValorAnterior.Height := 0;
    end;
  End
  else
  Begin
    tDescricao.Font.Style := [];
    tDescricao.Left := 32;
    tValor.Height := 17;
    tValorAnterior.Height := 17;

    if DMDRE.CdDreNUM_AGRUPAMENTO.Value = 3 then
    Begin
      tDescricao.Height := 0;
      tValor.Font.Style := [fsBold];
      tValorAnterior.Font.Style := [fsBold];
    End
    else
    Begin
      tDescricao.Height := 17;
      if DMDRE.CdDreIND_TOTALIZADOR.Value = 'S' then
      begin
        tValor.Font.Style := [fsBold];
        tValorAnterior.Font.Style := [fsBold]
      end
      else
      begin
        tValor.Font.Style := [];
        tValorAnterior.Font.Style := [];
      end;
    End;
  End;

//  case Trunc(DMDRE.QRDRENUM_GRAU.Value) of
//   1:QRDBTDesc.Left:=8;
//   2:QRDBTDesc.Left:=40;
//   3:QRDBTDesc.Left:=72;
//   4:QRDBTDesc.Left:=104;
//   5:QRDBTDesc.Left:=136;
//   6:QRDBTDesc.Left:=168;
//  end;
//  if DMDRE.QRDREind_tot.Value='S' then
//    begin
//      QRBand2.Font.Style:=[fsBold];
//      QRBand2.Frame.DrawBottom:=True;
//    end
//  else
//    begin
//      QRBand2.Font.Style:=[];
//      QRBand2.Frame.DrawBottom:=False;
//    end;
end;

procedure TFRDRE.FormCreate(Sender: TObject);
begin
   //COMENTADO MARCOS 16/03/2010 SÓ PASSA POR AQUI A PRIMEIRA VEZ Q TIRA O RELATÓRIO
  //  QRLEmpresa.Caption := 'Empresa: '+DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_FILIAL FROM TB_FILIAL, TB_PARAM_SISTEMA',
   //                                                    'TB_FILIAL.COD_FILIAL = TB_PARAM_SISTEMA.COD_FILIAL');
end;

procedure TFRDRE.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
//  QRPrimario.QRPrinter.PaperLength := Round(QRPrimario.Page.Length);
//  QRPrimario.QRPrinter.PaperWidth := Round(QRPrimario.Page.Width);
  if DMParamSistema.QParamSistemaCod_Empresa.Value = 'TEMPERMED' then
    QRLEmpresa.Caption := 'Empresa: '+DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_FILIAL FROM TB_FILIAL','COD_FILIAL='+Trim(FDREParam.ME0CodFilial.Text))

  Else
    QRLEmpresa.Caption := 'Empresa: '+DMOracle.BuscaNome('SELECT TB_FILIAL.DESC_FILIAL FROM TB_FILIAL, TB_PARAM_SISTEMA',
                                                       'TB_FILIAL.COD_FILIAL = TB_PARAM_SISTEMA.COD_FILIAL') +
                          ' CNPJ:'+ DMOracle.BuscaNome('SELECT TB_FILIAL.NUM_CGC FROM TB_FILIAL, TB_PARAM_SISTEMA',
                                                       'TB_FILIAL.COD_FILIAL = TB_PARAM_SISTEMA.COD_FILIAL');
  vNum_Pagina:=Pag_Inicial;
end;

procedure TFRDRE.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  vNum_Pagina:=vNum_Pagina+1;
  QRLNumPagina.Caption:=FloatToStr(vNum_Pagina);
//  Num_Linhas:=vNum_Pagina;
end;

end.
