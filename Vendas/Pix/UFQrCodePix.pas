unit UFQrCodePix;

interface

uses
  {$IfDef FPC}
   fpjson, jsonparser, jsonscanner, Jsons,
  {$EndIf}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  // Para Pix.
  Cemapa.Conversoes.API,
  ACBrPIXCD, ACBrPIXBase, ACBrImage, ACBrDelphiZXingQRCode, Buttons;

const
  CMaxConsultas = 60;

type
  TFQrCodePix = class(TForm)
    Panel1: TPanel;
    iQrCode: TImage;
    tmConsultarPagto: TTimer;
    lblCopiaECola: TLabel;
    lblSituacaoPix: TLabel;
    lblTxID: TLabel;
    BtnSemQrCode: TBitBtn;
    BtnCancelar: TBitBtn;
    procedure tmConsultarPagtoTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnSemQrCodeClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    cpPixCemapa: TACBrPixCD;
    fDadosStatus: TFluxoPagtoDados;
    nNumeroConsultas: Integer;

    function FormatarJson(const AJSON: String): String;
    procedure ConsultarCobranca;
    procedure AtualizarStatus(aStatus: TACBrPIXStatusCobranca = stcNENHUM;
      aStatusDevolucao: TACBrPIXStatusDevolucao = stdNENHUM);
    procedure BotaoOkQrCode(Sender: TObject);

    { Private declarations }
  public
    { Public declarations }
    isAbort: boolean;
    procedure recebeDados(pix: TACBrPixCD; fPixStatus: TFluxoPagtoDados);
    procedure LimpaStatusPix(var StatusPix: TFluxoPagtoDados);

  end;

var
  FQrCodePix: TFQrCodePix;

implementation

uses
  ACBrUtil;

{$R *.dfm}

procedure TFQrCodePix.tmConsultarPagtoTimer(Sender: TObject);
begin
  tmConsultarPagto.Enabled := False;
  try
    if EstaVazio(fDadosStatus.TxID) then
    begin
      ShowMessage('Nenhuma cobrança a ser consultada');
      Exit;
    end;

    ConsultarCobranca;
    fDadosStatus.QtdConsultas := fDadosStatus.QtdConsultas + 1;
  finally
    if (fDadosStatus.StatusCobranca = stcATIVA) and
       (not fDadosStatus.EmErro) and
       (fDadosStatus.QtdConsultas <= CMaxConsultas) then
      tmConsultarPagto.Enabled := True
    else
    begin
      btnCancelar.Click;
    end;

  end;
end;

procedure TFQrCodePix.ConsultarCobranca;
begin
  if EstaVazio(fDadosStatus.TxID) then
  begin
    ShowMessage('Nenhum TxID para ser consultado');
    Exit;
  end;

  try
    if (not cpPixCemapa.PSP.epCob.ConsultarCobrancaImediata(fDadosStatus.TxID)) then
    begin
      fDadosStatus.EmErro := True;
      ShowMessage('Erro ao consultar cobrança' + sLineBreak +
        cpPixCemapa.PSP.epCob.Problema.title + sLineBreak +
        cpPixCemapa.PSP.epCob.Problema.detail);
    end;

    if (cpPixCemapa.PSP.epCob.CobCompleta.pix.Count > 0) then
      fDadosStatus.E2E := cpPixCemapa.PSP.epCob.CobCompleta.pix[0].endToEndId;
    AtualizarStatus(cpPixCemapa.PSP.epCob.CobCompleta.status);

    finally
      inc(nNumeroConsultas);
   end;
end;


procedure TFQrCodePix.AtualizarStatus(aStatus: TACBrPIXStatusCobranca;
  aStatusDevolucao: TACBrPIXStatusDevolucao);

  procedure AtualizarTelaQRCode(aTexto: String; aCor: TColor);
  begin
    lblSituacaoPix.Font.Color := aCor;
    lblSituacaoPix.Caption := aTexto;
  end;

begin
  if fDadosStatus.EmErro then
  begin
    ShowMessage('Erro ao consultar PIX');
    ModalResult := MRCancel;
  end;

  fDadosStatus.StatusCobranca := aStatus;
  fDadosStatus.StatusDevolucao := aStatusDevolucao;

  case fDadosStatus.StatusDevolucao of
    stdDEVOLVIDO: AtualizarTelaQRCode('PAGAMENTO DEVOLVIDO', clOlive);
    stdEM_PROCESSAMENTO: AtualizarTelaQRCode('DEVOLUÇAO PENDENTE', clRed);
    stdNAO_REALIZADO: AtualizarTelaQRCode('DEVOLUÇÃO NÃO REALIZADA', clMenuHighlight);
  else
    case fDadosStatus.StatusCobranca of
      stcATIVA: AtualizarTelaQRCode('AGUARDANDO PAGAMENTO', clMaroon);
      stcCONCLUIDA:
        begin
          AtualizarTelaQRCode('PAGAMENTO FINALIZADO', clNavy);
          ModalResult := MROk;
          btnCancelar.Caption := 'OK';
          with btnCancelar do
          begin
            OnClick := BotaoOkQrCode;
          end;
        end;
      stcREMOVIDA_PELO_USUARIO_RECEBEDOR: AtualizarTelaQRCode('PAGAMENTO CANCELADO', clRed);
      stcREMOVIDA_PELO_PSP: AtualizarTelaQRCode('CANCELADO PELO PSP', clRed);
    end;
  end;

end;

function TFQrCodePix.FormatarJson(const AJSON: String): String;
{$IfDef FPC}
var
  jpar: TJSONParser;
  j: TJsonObject;
{$EndIf}
begin
  Result := AJSON;
  {$IfDef FPC}
  try
    j := TJSONObject.Create();
    try
      Result := j.Decode(Result);
    finally
      j.Free;
    end;
    jpar := TJSONParser.Create(Result, [joUTF8]);
    try
      Result := jpar.Parse.FormatJSON([], 2);
    finally
      jpar.Free;
    end;
  except
    Result := AJSON;
  end;
  {$EndIf}
end;

procedure TFQrCodePix.BotaoOkQrCode(Sender: TObject);
begin
  Self.Close;
end;

procedure TFQrCodePix.recebeDados(pix: TACBrPixCD;
 fPixStatus: TFluxoPagtoDados);
begin
  fDadosStatus := fPixStatus;
  cpPixCemapa := pix;
  lblCopiaECola.Caption := fDadosStatus.QRCode;
  lblTxID.Caption := fDadosStatus.TxID;
  PintarQRCode(fDadosStatus.QRCode, FQrCodePix.iQrCode.Picture.Bitmap, qrUTF8BOM);
  tmConsultarPagto.Enabled := True;
end;

procedure TFQrCodePix.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Limpa a estrutura para retornar os dados novos ao reiniciar a cobrança
  cpPixCemapa.PSP.Clear;
  LimpaStatusPix(fDadosStatus);
  iQrCode.Picture := nil;


end;

procedure TFQrCodePix.LimpaStatusPix(var StatusPix: TFluxoPagtoDados);
begin
  //Limpa a estrutura para retornar os dados novos ao reiniciar a cobrança
  with StatusPix do
  begin
    TxID := EmptyStr;
    E2E := EmptyStr;
    QRCode := EmptyStr;
    Total := 0;
    StatusCobranca := stcNENHUM;
    StatusDevolucao := stdNENHUM;
    EmErro := False;
    QtdConsultas := 0;
  end;
end;

procedure TFQrCodePix.FormCreate(Sender: TObject);
begin
  nNumeroConsultas := 0;
end;

procedure TFQrCodePix.FormActivate(Sender: TObject);
begin
  isAbort := False;
end;

procedure TFQrCodePix.BtnSemQrCodeClick(Sender: TObject);
begin
  tmConsultarPagto.Enabled:= False;
  isAbort := true;
  Self.Close;
end;

procedure TFQrCodePix.BtnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  tmConsultarPagto.Enabled:= False;
  Self.Close;
end;

end.
