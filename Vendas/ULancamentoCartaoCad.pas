unit ULancamentoCartaoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, ExtCtrls, Buttons, DBCtrls, UFmBanco, Grids, DBGrids;

type
  TFLancamentoCartao = class(TFTCadSimples)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdCodLancamento: TEdit;
    EdCodNota: TEdit;
    EdValTotal: TEdit;
    SBLancar: TSpeedButton;
    FMBanco1: TFMBanco;
    MeValSaldo: TMaskEdit;
    Label5: TLabel;
    Label6: TLabel;
    EdValEntrada: TEdit;
    RGParcelas: TRadioGroup;
    RGBandeira: TRadioGroup;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    SBApagar: TSpeedButton;
    SBAtualiza: TSpeedButton;
    MeDtEmissao: TMaskEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure SBLancarClick(Sender: TObject);
    procedure FMBanco1BtBancoClick(Sender: TObject);
    procedure FMBanco1MeBancoExit(Sender: TObject);
    procedure RGBandeiraClick(Sender: TObject);
    procedure SBApagarClick(Sender: TObject);
    procedure SBAtualizaClick(Sender: TObject);
    procedure RGParcelasClick(Sender: TObject);

  private
    procedure LancarCartao;
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FLancamentoCartao: TFLancamentoCartao;


implementation

uses UNotaSaida_cl, DateUtils, UOracle_cl, UBancoAgencia_cl, Math,
     UUsuario_cl, UParamSistema_cl;

{$R *.dfm}



procedure TFLancamentoCartao.FormActivate(Sender: TObject);
begin
{  inherited; Comentado porque o lançamento de valor em 2 cartões e com usuário limitado, o botão não aparecia na tela para o lançamento do restante do valor.
Solicitado por Guilherme da Pixixe, pois os usuários que fazem a venda são limitados. Alex 14/02/2024}
  DBGrid1.Visible := false;
  Panel2.Visible := false;
  SBApagar.Visible := false;
  SBAtualiza.Visible := false;
  if (DMUsuario.Privilegiado = True) then
  begin
    SBApagar.Enabled := true;
    SBApagar.Visible := true;
    SBAtualiza.Enabled := true;
    SBAtualiza.Visible := true;
    DBGrid1.Visible := true;
    Panel2.Visible := true;
  end;  
  with DMNotaSaida do
  begin
    QLancamentoCartao.Open;
    QLancamentoCartaoCons.Close;
    QLancamentoCartaoCons.SetVariable('DT_EMISSAO', StrToDate(MeDtEmissao.Text));
    QLancamentoCartaoCons.Open;
  end;
end;

procedure TFLancamentoCartao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 // inherited; //estava gerando erro de dados não confirmados em caso de fechar a tela sem terminar de fazer o lançamento
  DMNotaSaida.QLancamentoCartao.Close;
  Action:= CaFree;
  FLancamentoCartao:= Nil;
end;

procedure TFLancamentoCartao.FormCreate(Sender: TObject);
begin
  inherited;
  if DMNotaSaida.wLancCartaoIndividual = True then
  begin
    EdCodLancamento.Text := DMOracle.FastSelect('SQLANCAMENTO_CARTAO.NEXTVAL','DUAL');
    MeDtEmissao.Text := DateToStr(Date);
    FMBanco1.MeBanco.Text := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','IND_BANCO_PADRAO = ''SIM''');
    MeValSaldo.Text := '0';
  end
  else
  begin
//Para vir marcado na tela se o pagamento é crédito ou débito
    if (DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '4') or (DMNotaSaida.QPagamentoDESC_PAGAMENTO.Value = 'Cartão de Crédito') then
      RGParcelas.ItemIndex := 1
    else
      RGParcelas.ItemIndex := 0;
//
    EdCodLancamento.Text := DMOracle.FastSelect('SQLANCAMENTO_CARTAO.NEXTVAL','DUAL');
    EdCodNota.Text := DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text;
    MeDtEmissao.Text := DMNotaSaida.QNotaSaidaDT_EMISSAO.Text;
    EdValTotal.Text := FloatToStr(DMNotaSaida.QSomaItemNotaSVAL_TOTAL.Value + DMNotaSaida.QSomaItemNotaSVAL_DESPESAS.Value
                                   - DMNotaSaida.QSomaItemNotaSVAL_DESCONTO.Value - DMNotaSaida.QNotaSaidaVAL_AVISTA.Value);
    FMBanco1.MeBanco.Text := DMOracle.BuscaNome('SELECT COD_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','IND_BANCO_PADRAO = ''SIM''');
    EdValEntrada.Text := '0' + DMNotaSaida.QNotaSaidaVAL_AVISTA.Text;
    MeValSaldo.Text := FloatToStr((DMNotaSaida.QSomaItemNotaSVAL_TOTAL.Value + DMNotaSaida.QSomaItemNotaSVAL_DESPESAS.Value
                                   - DMNotaSaida.QSomaItemNotaSVAL_DESCONTO.Value - DMNotaSaida.QNotaSaidaVAL_AVISTA.Value) -
                          StrToFloat('0' + DMOracle.BuscaNome('SELECT  SUM(VAL_ORIGINAL) FROM TB_LANCAMENTO_CARTAO',
                                                   'COD_NOTA_CAB = '+ DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text)));
  end;
end;

procedure TFLancamentoCartao.SBLancarClick(Sender: TObject);
begin
  inherited;
{  if FNotaSaidaCad.wLancCartaoIndividual = False then
  begin
    if (DMNotaSaida.QSomaItemNotaSVAL_TOTAL.Value - DMNotaSaida.QNotaSaidaVAL_AVISTA.Value) -  //lança para mais de 1 cartão
                 StrToFloat('0' + DMOracle.BuscaNome('SELECT  SUM(VAL_ORIGINAL) FROM TB_LANCAMENTO_CARTAO', 'COD_NOTA_CAB = '+ DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text)) <> 0 then}
      LancarCartao;
end;

procedure TFLancamentoCartao.LancarCartao;
var
  wParcelas, wCont, wCodBandeiraCartao : integer;
  wValor, wTaxa : Real;
  wDias : tDatetime;
  wBandeira, wLinhaMov : string;
  wValor_Teste : Real;
begin
  wCont := 0;
  wDias := 30;
  wBandeira := FLancamentoCartao.RGBandeira.Items[RGBandeira.ItemIndex];

  With DMNotaSaida do
  Begin
    If Trim(FLancamentoCartao.FMBanco1.MeBanco.Text) = '' then
      Raise Exception.Create('Informe o banco!');
    if DMOracle.BuscaNome('SELECT PERC_TAXA FROM TB_TAXA_CARTAO','COD_BANCO_AGENCIA='+ Trim(FLancamentoCartao.FMBanco1.MeBanco.Text)) = '' then
    Begin
      Raise Exception.Create('Banco Informado não possui cadastro de cartão!');
      FLancamentoCartao.FMBanco1.MeBanco.SetFocus;
    end;
    try
      //Verificar se existe Bandeira de Cartão cadastrado na taxa.
      if DMOracle.FastSelect('COD_BANDEIRA_CARTAO','TB_TAXA_CARTAO','COD_BANCO_AGENCIA = ' + Trim(FLancamentoCartao.FMBanco1.MeBanco.Text)) <> '' then
        wCodBandeiraCartao := StrToInt('0'+DMOracle.FastSelect('COD_BANDEIRA_CARTAO','TB_BANDEIRA_CARTAO','DESC_BANDEIRA_CARTAO = ' + QuotedStr(wBandeira) ));

      if DMNotaSaida.wLancCartaoIndividual = False then // LANÇAMENTO CARTÃO POR CONFIRMAÇÃO DA NOTA
      begin
         wValor := (DMNotaSaida.QSomaItemNotaSVAL_TOTAL.Value + DMNotaSaida.QSomaItemNotaSVAL_DESPESAS.Value - DMNotaSaida.QNotaSaidaVAL_AVISTA.Value) -
               StrToFloat('0' + DMOracle.BuscaNome('SELECT  SUM(VAL_ORIGINAL) FROM TB_LANCAMENTO_CARTAO',
                                                   'COD_NOTA_CAB = '+ DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text));
        wValor_Teste := StrToFloat(FLancamentoCartao.MeValSaldo.Text); // foi colocado porque estava dando erro na linha seguinte - César
        if wValor < wValor_Teste then
          Raise Exception.Create('Valor Informado ultrapassa valor da venda!');
        if FLancamentoCartao.RGParcelas.ItemIndex = 0 then //cartão débito
        Begin
          if wCodBandeiraCartao > 0 then //Pegar a Taxa do Cartão Referente a Bandeira que está cadastrada na Taxa de Cartão. solic. Marcos. Junior 20/06/2022
            wTaxa := StrToFloat('0'+ DMOracle.BuscaNome('SELECT PERC_TAXA FROM TB_TAXA_CARTAO','COD_BANCO_AGENCIA='+
                                         Trim(FLancamentoCartao.FMBanco1.MeBanco.Text) +' AND NUM_PARCELAS = ' + '0' + ' AND COD_BANDEIRA_CARTAO = ' + IntToStr(wCodBandeiraCartao) ))
          else
            wTaxa := StrToFloat('0'+ DMOracle.BuscaNome('SELECT PERC_TAXA FROM TB_TAXA_CARTAO','COD_BANCO_AGENCIA='+
                                                      Trim(FLancamentoCartao.FMBanco1.MeBanco.Text) +' AND NUM_PARCELAS = ' + '0'));

          DMNotaSaida.LancaCartao(StrToInt(FLancamentoCartao.EdCodLancamento.Text),
                                  StrToInt(Trim(FLancamentoCartao.FMBanco1.MeBanco.Text)),
                                  QNotaSaidaCOD_NOTA_CAB.Value,
                                  0, //NUM_PARCELA
                                  0, //NUM_PARCELAS
                                  QNotaSaidaDT_EMISSAO.Value, //DT_EMISSAO
                                  QNotaSaidaDT_EMISSAO.Value + 1,//DT_RECEBIMENTO
                                  wBandeira, //RadioGroup2.Items[RadioGroup2.ItemIndex] //DESC_BANDEIRA
                                  StrToFloat(MeValSaldo.Text), //VAL_ORIGINAL
                                  wTaxa ); //PERC_TAXA
        end
        else
        Begin  //cartao credito
          wParcelas := FLancamentoCartao.RGParcelas.ItemIndex;
          wValor := StrToFloat(FLancamentoCartao.MeValSaldo.Text) / wParcelas;
          if wCodBandeiraCartao > 0 then
            wTaxa := StrToFloat('0'+ DMOracle.BuscaNome('SELECT PERC_TAXA FROM TB_TAXA_CARTAO','COD_BANCO_AGENCIA='+
                                         Trim(FLancamentoCartao.FMBanco1.MeBanco.Text) +' AND NUM_PARCELAS = ' + IntToStr(wParcelas) + ' AND COD_BANDEIRA_CARTAO = ' + IntToStr(wCodBandeiraCartao) ))
          else
            wTaxa := StrToFloat('0'+ DMOracle.BuscaNome('SELECT PERC_TAXA FROM TB_TAXA_CARTAO','COD_BANCO_AGENCIA='+
                                                       Trim(FLancamentoCartao.FMBanco1.MeBanco.Text)+' AND NUM_PARCELAS = '+ IntToStr(wParcelas)));
          while wCont < wParcelas do
          Begin
            DMNotaSaida.LancaCartao(StrtoInt(DMOracle.FastSelect('SQLANCAMENTO_CARTAO.NEXTVAL','DUAL') ),
                                  StrToInt(Trim(FLancamentoCartao.FMBanco1.MeBanco.Text)),
                                  QNotaSaidaCOD_NOTA_CAB.Value,
                                  wCont + 1, //NUM_PARCELA
                                  wParcelas, //NUM_PARCELAS
                                  QNotaSaidaDT_EMISSAO.Value, //DT_EMISSAO
                                  QNotaSaidaDT_EMISSAO.Value + wDias,//DT_RECEBIMENTO
                                  wBandeira,//DESC_BANDEIRA
                                  wValor, //VAL_ORIGINAL
                                  wTaxa ); //PERC_TAXA
            inc(wCont);
            wDias := wDias + 30;
          end;
        end;
      end else // LANÇAMENTO CARTÃO INDIVIDUAL
      begin
        if FLancamentoCartao.RGParcelas.ItemIndex = 0 then //cartão débito
        Begin
          if wCodBandeiraCartao > 0 then //Pegar a Taxa do Cartão Referente a Bandeira que está cadastrada na Taxa de Cartão. solic. Marcos. Junior 20/06/2022
            wTaxa := StrToFloat('0'+ DMOracle.BuscaNome('SELECT PERC_TAXA FROM TB_TAXA_CARTAO','COD_BANCO_AGENCIA='+
                                         Trim(FLancamentoCartao.FMBanco1.MeBanco.Text) +' AND NUM_PARCELAS = ' + '0' + ' AND COD_BANDEIRA_CARTAO = ' + IntToStr(wCodBandeiraCartao) ))
          else
            wTaxa := StrToFloat('0'+ DMOracle.BuscaNome('SELECT PERC_TAXA FROM TB_TAXA_CARTAO','COD_BANCO_AGENCIA='+
                                                      Trim(FLancamentoCartao.FMBanco1.MeBanco.Text) +' AND NUM_PARCELAS = ' + '0'));
          DMNotaSaida.LancaCartao(StrToInt(FLancamentoCartao.EdCodLancamento.Text),
                                  StrToInt(Trim(FLancamentoCartao.FMBanco1.MeBanco.Text)),
                                  0,//COD_NOTA_CAB
                                  0, //NUM_PARCELA
                                  0, //NUM_PARCELAS
                                  StrToDate(FLancamentoCartao.MeDtEmissao.Text), //DT_EMISSAO
                                  StrToDate(FLancamentoCartao.MeDtEmissao.Text) + 1,//DT_RECEBIMENTO
                                  wBandeira, //RadioGroup2.Items[RadioGroup2.ItemIndex] //DESC_BANDEIRA
                                  StrToFloat(Trim(MeValSaldo.Text)), //VAL_ORIGINAL   StrToFloat(Trim(MeValSaldo.Text));
                                  wTaxa ); //PERC_TAXA
        end
        else
        Begin  //cartao credito
          wParcelas := FLancamentoCartao.RGParcelas.ItemIndex;
          wValor := StrToFloat(FLancamentoCartao.MeValSaldo.Text) / wParcelas;
          if wCodBandeiraCartao > 0 then //Pegar a Taxa do Cartão Referente a Bandeira que está cadastrada na Taxa de Cartão. solic. Marcos. Junior 20/06/2022
            wTaxa := StrToFloat('0'+ DMOracle.BuscaNome('SELECT PERC_TAXA FROM TB_TAXA_CARTAO','COD_BANCO_AGENCIA='+
                                                       Trim(FLancamentoCartao.FMBanco1.MeBanco.Text)+' AND NUM_PARCELAS = '+ IntToStr(wParcelas) + ' AND COD_BANDEIRA_CARTAO = ' + IntToStr(wCodBandeiraCartao) ))
          else
            wTaxa := StrToFloat('0'+ DMOracle.BuscaNome('SELECT PERC_TAXA FROM TB_TAXA_CARTAO','COD_BANCO_AGENCIA='+
                                                       Trim(FLancamentoCartao.FMBanco1.MeBanco.Text)+' AND NUM_PARCELAS = '+ IntToStr(wParcelas)));
          while wCont < wParcelas do
          Begin
            DMNotaSaida.LancaCartao(StrtoInt(DMOracle.FastSelect('SQLANCAMENTO_CARTAO.NEXTVAL','DUAL') ),
                                  StrToInt(Trim(FLancamentoCartao.FMBanco1.MeBanco.Text)),
                                  0, //COD_NOTA_CAB
                                  wCont + 1, //NUM_PARCELA
                                  wParcelas, //NUM_PARCELAS
                                  StrToDate(FLancamentoCartao.MeDtEmissao.Text), //DT_EMISSAO
                                  StrToDate(FLancamentoCartao.MeDtEmissao.Text) + wDias,//DT_RECEBIMENTO
                                  wBandeira,//DESC_BANDEIRA
                                  wValor, //VAL_ORIGINAL
                                  wTaxa ); //PERC_TAXA
            inc(wCont);
            wDias := wDias + 30;
          end;
        end;
      end;
    except
      QLancamentoCartao.Cancel;
      raise;
    end;
  end;
  if DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text <> '' Then  // somente faz este teste se tiver nota fiscal - César 02/03/2023
     if formatFloat('000000',(DMNotaSaida.QSomaItemNotaSVAL_TOTAL.Value + DMNotaSaida.QSomaItemNotaSVAL_DESPESAS.Value - DMNotaSaida.QSomaItemNotaSVAL_DESCONTO.Value - DMNotaSaida.QNotaSaidaVAL_AVISTA.Value)) //lança para mais de 1 cartão
          > FormatFloat('000000',StrToFloat('0' + DMOracle.BuscaNome('SELECT  SUM(VAL_ORIGINAL) FROM TB_LANCAMENTO_CARTAO',
         'COD_NOTA_CAB = '+ DMNotaSaida.QNotaSaidaCOD_NOTA_CAB.Text))) then
  Begin
    FLancamentoCartao.Close;
    DMNotasaida.QLancamentoCartao.Close;
    DMNotasaida.QLancamentoCartao.open;
    // DMNotasaida.QLancamentoCartao.Insert;
    FLancamentoCartao := Nil;
    FLancamentoCartao := TFLancamentoCartao.Create(Application);
    FLancamentoCartao.ShowModal;
  end
  else
  begin
    //ShowMessage('Lançamento(s) efetuado(s)!'); Marcos solicitou remover a mensagem. Alex 04/03/2023
    FLancamentoCartao.Close;
  end;
end;

procedure TFLancamentoCartao.FMBanco1BtBancoClick(Sender: TObject);
begin
  inherited;
  FMBanco1.BtBancoClick(Sender);
  FMBanco1.MeBancoExit(self);
end;

procedure TFLancamentoCartao.FMBanco1MeBancoExit(Sender: TObject);
begin
  inherited;
  FMBanco1.MeBancoExit(Sender);
end;

procedure TFLancamentoCartao.RGBandeiraClick(Sender: TObject);
begin
  inherited;
    if (RGBandeira.ItemIndex = -1) or (RGParcelas.ItemIndex = -1) then
      SBLancar.Enabled := False;
    if (RGBandeira.ItemIndex <> -1) or (RGParcelas.ItemIndex <> -1) then
      SBLancar.Enabled := True;
end;

procedure TFLancamentoCartao.SBApagarClick(Sender: TObject);
begin
  inherited;
  DMOracle.QExecSQL.SQL.Clear;
  DMOracle.QExecSQL.SQL.Text := ('DELETE FROM TB_LANCAMENTO_CARTAO WHERE COD_LANCAMENTO_CARTAO = ' + DBGrid1.Columns[0].Field.Text);
  DMOracle.QExecSQL.ExecSQL;
  DMOracle.DBCemapa.Commit;
  DMNotaSaida.QLancamentoCartaoCons.Close;
  DMNotaSaida.QLancamentoCartaoCons.Open;
  DBGrid1.Refresh;
end;

procedure TFLancamentoCartao.SBAtualizaClick(Sender: TObject);
begin
  inherited;
  DMNotaSaida.QLancamentoCartaoCons.Close;
  DMNotaSaida.QLancamentoCartaoCons.SetVariable('DT_EMISSAO',MeDtEmissao.Text);
  DMNotaSaida.QLancamentoCartaoCons.Open;
  DBGrid1.Refresh;
end;

procedure TFLancamentoCartao.RGParcelasClick(Sender: TObject);
begin
  inherited;
  if (DMNotaSaida.QNotaSaidaIND_CONDICAO_PAGTO.Value = '5') or (DMNotaSaida.QPagamentoDESC_PAGAMENTO.Value = 'Cartão de Débito') then
    RGParcelas.ItemIndex := 0;
end;

end.
