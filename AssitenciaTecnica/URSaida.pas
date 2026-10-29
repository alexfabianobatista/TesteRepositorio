unit URSaida;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTRELSIMPLES, QRCtrls, QRExport, QRWebFilt, QRPDFFilt, QuickRpt,
  ExtCtrls;

type
  TFRSaida = class(TFTRelSimples)
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRShape2: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel17: TQRLabel;
    DetailBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    SummaryBand1: TQRBand;
    QRLabel29: TQRLabel;
    QRMSolicitacao: TQRMemo;
    QRLabel30: TQRLabel;
    QRMGarantia: TQRMemo;
    QRShape3: TQRShape;
    QRImage1: TQRImage;
    QRDBText22: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRMPagamento: TQRMemo;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRDBText21: TQRDBText;
    QRShape4: TQRShape;
    QRLabel36: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel37: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel38: TQRLabel;
    procedure SummaryBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRPrimarioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRSaida: TFRSaida;

implementation

uses UOrdemServico_cl, UOracle_cl;

{$R *.dfm}

procedure TFRSaida.SummaryBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wLinhasMensagem, wLinhasSolicitacao, wTamanhoAdicional, wCount, wQuebras: Integer;
begin
  inherited;
  wQuebras := 0;
  QRMSolicitacao.Lines.Clear;
  QRMGarantia.Lines.Clear;
  with DMOrdemServico do
  begin
    QRMSolicitacao.Lines.Add(QRSaidaDESC_SOLICITACAO.Value);
    for wCount := 0 to length(QRSaidaDESC_SOLICITACAO.Value) do
      if (QRSaidaDESC_SOLICITACAO.Value)[wCount] = #13 then
        inc(wQuebras);
    wLinhasSolicitacao := length(QRSaidaDESC_SOLICITACAO.value) div 94;   //aproximadamente 94 caracteres preenchem um linha. por Alessandro 05/02/13.
    wLinhasSolicitacao := wLinhasSolicitacao + wQuebras;                  //podem haver quebras de linha, portanto elas devem ser somadas ao tamanho. por Alessandro 05/02/13.
    QRLabel30.Top := 32 + wLinhasSolicitacao * 12;
    QRMGarantia.Top := 48 + wLinhasSolicitacao * 12;
    QRMGarantia.Lines.Add(QRSaidaMENSAGEM.Value);
    wLinhasMensagem := length(QRSaidaMENSAGEM.value) div 94;
    wTamanhoAdicional := (wLinhasMensagem + wLinhasSolicitacao) * 13;
    SummaryBand1.Size.Height := 20 + wTamanhoAdicional;
  end;
end;

procedure TFRSaida.QRPrimarioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  wCaminhoImagem: String;
begin
  inherited;
  wCaminhoImagem := ExtractFilePath(Application.ExeName) + 'logo\logo.jpg';
  QRImage1.Picture.LoadFromFile(wCaminhoImagem);
end;

procedure TFRSaida.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
  wValCaixa: String;
  wValPagamento: String;
  wCountPagamentos: Integer;
begin
  inherited;
  wCountPagamentos := 0;
  QRMPagamento.Lines.Clear;
  with DMOrdemServico do
  begin
    if QRSaidaDT_SAIDA.Value <= 0 then
      QRMPagamento.Lines.Add('OS EM ABERTO!!!')
    else
    begin
      if not QRSaidaCOD_CAIXA.IsNull then
      begin
        wValCaixa := DMOracle.FastSelect('VAL_MOVIMENTO', 'TB_CAIXA_MOV', 'COD_CAIXA_MOV = ' + QOrdemServicoCOD_CAIXA.AsString);
        if trim(wValCaixa) <> '' then
        begin
          wValPagamento := formatfloat('#,##0.00',strtofloat(wValCaixa));
          QRMPagamento.Lines.Add('A vista      ' + copy('         ', 1, 9 - length(wValPagamento)) + wValPagamento);
          Inc(wCountPagamentos);
        end;
      end;
      QRSaida_receber_geral.Close;
      QRSaida_receber_geral.SetVariable('COD_ORDEM_SERVICO_CAB', QOrdemServicoCOD_ORDEM_SERVICO_CAB.Value);
      QRSaida_receber_geral.Open;
      while not QRSaida_receber_geral.Eof do
      begin
        wValPagamento := formatfloat('#,##0.00',QRSaida_receber_geralVAL_TITULO.Value);
        if (wCountPagamentos mod 2) = 0 then
        begin
          QRMPagamento.Lines.Add(QRSaida_receber_geralNUM_PARCELA.AsString + ' '
            + QRSaida_receber_geralDT_VENCIMENTO.AsString + ' ' + copy('         ', 1, 9 - length(wValPagamento)) + wValPagamento);
        end
        else
        begin
          QRMPagamento.Lines[QRMPagamento.Lines.Count-1] := QRMPagamento.Lines[QRMPagamento.Lines.Count-1]
            + chr(9) + '         ' + QRSaida_receber_geralNUM_PARCELA.AsString + ' '
              + QRSaida_receber_geralDT_VENCIMENTO.AsString + ' ' + copy('         ', 1, 9 - length(wValPagamento)) + wValPagamento;
        end;
        Inc(wCountPagamentos);
        QRSaida_receber_geral.Next;
      end;
    end;
  end;
end;

end.
