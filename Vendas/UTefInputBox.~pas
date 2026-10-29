unit UTefInputBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, strutils, ExtCtrls, ActnList;

type
  TFTefInputBox = class(TForm)
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    btVoltar: TBitBtn;
    lbMsg: TLabel;
    edValor: TMaskEdit;
    rgFormaPagamento: TRadioGroup;
    ActionList1: TActionList;
    Action1: TAction;
    procedure BtOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edValorKeyPress(Sender: TObject; var Key: Char);
    procedure rgFormaPagamentoClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    wMax, wMin: Integer;
    wTipoMascara: String;
  public
    function OkAutomatico: TModalResult;
    procedure configura(pCaption:String; pMsg:String; limpar: boolean; pHabilitarVoltar: boolean; pMin, pMax: Integer;
      pTipoMascara:String; ptipoCampo: integer);
  end;

var
  FTefInputBox: TFTefInputBox;

implementation

uses UBiblioteca, UTEF_cl, UTEF, UImpressoraFiscal;

{$R *.dfm}

procedure TFTefInputBox.configura(pCaption:String; pMsg:String; limpar: boolean; pHabilitarVoltar: boolean; pMin, pMax: Integer;
  pTipoMascara:String; ptipoCampo: integer);
begin
  Caption := pCaption;
  lbMsg.Caption := pMsg;
  if limpar then
    edValor.Text := '';
  btVoltar.enabled := pHabilitarVoltar;
  if pTipoMascara <> 'VALOR' then
    wMax := pMax
  else
    wMax := pMax + 1;
    
  if ptipoCampo = 514 then
    wMin := 3
  else
    wMin := pMin;
  edValor.MaxLength := wMax;
  wTipoMascara := pTipoMascara;
  Height := 157 + bib.CountSubExt(pMsg,#10) * 10;
  {case AnsiIndexStr(UpperCase(pTipoMascara), ['','VALOR']) of
    0: edValor.EditMask := '';
    1: edValor.EditMask := bib.AjustaStrContrario('0.00', wMax, '#');
  else
    edValor.EditMask := '';
  end; }
  if (ptipoCampo = 500) then
    edValor.PasswordChar := '*'
  else
    edValor.PasswordChar := #0;
end;

procedure TFTefInputBox.BtOkClick(Sender: TObject);
var wValor: Double;
begin
  if (edvalor.Text <> '') then
  begin
    if (wTipoMascara = 'VALOR') then
    begin
      //MessageDlg('O valor deve ser informado com duas casas decimais!', mtError, [mbOK], 0);
//      Abort;
      edvalor.Text := CurrToStrF(StrToCurrDef(Trim(edValor.Text),0),ffNumber,2);
      //raise Exception.Create('O valor deve ser informado com duas casas decimais!');

      try
        wValor := 
        strtofloat(bib.LimpaNumero(Trim(edvalor.Text),true));
      except
        MessageDlg('O valor informado não é valido, verifique!', mtError, [mbOK], 0);
        Abort;
        //raise exception.Create('O valor informado nÃ£o Ã© valido, verifique!');
      end;
    end;
    if FTEF.IndNFCe and (wValor - DMTEF.QPagamentoVAL_VALOR.Value > 0.001) then
    begin
      MessageDlg('O valor digitado excede o valor total da transação.', mtError, [mbOK], 0);
      Abort;
    end;
    if FTefInputBox.rgFormaPagamento.Visible then
    begin
      if (FTefInputBox.rgFormaPagamento.ItemIndex = 1) and (wValor - FTEF.ValorTotal < 0) then
      begin
        MessageDlg('O pagamento em dinheiro deve compreender, no mínimo, o total restante da venda.', mtError, [mbOK], 0);
        Abort;
      end;
      if (wValor - FTEF.ValorTotal > 0.001) and (FTefInputBox.rgFormaPagamento.ItemIndex = 0) then
      begin
        MessageDlg('O valor digitado excede o valor total da transação.', mtError, [mbOK], 0);
        Abort;
      end;
      if ((DMTEF.QTefPgto.RecordCount = 2) or (DMTEF.QTefPgto.RecordCount = 3)) and (FTefInputBox.rgFormaPagamento.ItemIndex = 0) then
      begin
        if (DMTEF.QTefPgto.RecordCount = 2) and (FTEF.ValorTotal - wValor > 0) then
          if(MessageDlg('Este é o último pagamento permitido com cartão, portanto o valor restante deverá que ser lançado como Dinheiro. Deseja continuar assim mesmo?' , mtInformation, [mbYes, mbNo], 0) = mrNo) then
            abort;
        if DMTEF.QTefPgto.RecordCount = 3 then
        begin
          MessageDlg('Limite de cartões excedido. O valor restante deve ser lançado como Dinheiro.' + IntToStr(wMin), mtError, [mbOK], 0);
          abort;
        end;
      end;
    end;
  end;

  if (edValor.Text = '') and (FTefInputBox.rgFormaPagamento.Visible) then
  begin
    MessageDlg('O valor não pode estar em branco.', mtError, [mbOK], 0);
    Abort;
  end;

  if(Length(edValor.Text) > wMax) then
  begin
    edvalor.SetFocus;
    MessageDlg('O tamanho do texto informado ultrapassou o máximo de ' + IntToStr(wMax), mtError, [mbOK], 0);
    Abort;
    //raise Exception.Create('O tamanho do texto informado ultrapassou o máximo de ' + IntToStr(wMax));
  end;


  if(Length(edValor.Text) < wMin) then
  begin
    if ((edValor.Text <> '0') and (edValor.Text <> '1')) then
    begin
      edvalor.SetFocus;
      MessageDlg('O tamanho do texto informado deve ser de no minimo ' + IntToStr(wMin), mtError, [mbOK], 0);
      Abort;
    end
    //raise Exception.Create('O tamanho do texto informado deve ser de no minimo ' + IntToStr(wMin));
  end;

  ModalResult := mrOK;
end;

procedure TFTefInputBox.FormActivate(Sender: TObject);
begin
  edValor.SetFocus;

end;

procedure TFTefInputBox.edValorKeyPress(Sender: TObject; var Key: Char);
begin
  if (UpperCase(wTipoMascara) = 'VALOR') and (not (key in ['0'..'9', ',', #13, #8])) then
    key := #0;
  if Key = #13 then
  begin
    BtOk.Click
  end;
end;

procedure TFTefInputBox.rgFormaPagamentoClick(Sender: TObject);
begin
//  if rgFormaPagamento.ItemIndex = 1 then
//    edValor.Enabled := false
//  else
//    edValor.Enabled := true;
end;

function TFTefInputBox.OkAutomatico: TModalResult;
begin
  BtOkClick(Self);
  result := MrOk;
end;

procedure TFTefInputBox.Action1Execute(Sender: TObject);
begin
  FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

end.
