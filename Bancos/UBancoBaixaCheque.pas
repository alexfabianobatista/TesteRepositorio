unit UBancoBaixaCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, Mask, StdCtrls, Grids, DBGrids, Db, ExtCtrls;

type
  TFBancosBaixaCheque = class(TForm)
    DBGrid1: TDBGrid;
    EdObservacao: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    MEDtInicial: TMaskEdit;
    MEDtFinal: TMaskEdit;
    Label4: TLabel;
    METexto: TMaskEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton3: TSpeedButton;
    MEHistorico: TMaskEdit;
    MECodHistorico: TMaskEdit;
    MEContaCorrente: TMaskEdit;
    MECodContaCorrente: TMaskEdit;
    MECodBanco: TMaskEdit;
    MEBanco: TMaskEdit;
    Label7: TLabel;
    BitBtn2: TBitBtn;
    DsBancoBaixaCheque: TDataSource;
    RGSituacaoCheque: TRadioGroup;
    RgOrdem: TRadioGroup;
    MeNumNota: TMaskEdit;
    Label8: TLabel;
    BtCadastro: TSpeedButton;
    Label9: TLabel;
    MeCadastro: TMaskEdit;
    EdCadastro: TMaskEdit;
    RGMovimento: TRadioGroup;
    MeDtBaixa: TMaskEdit;
    Label10: TLabel;
    MEValor: TMaskEdit;
    Label11: TLabel;
    BitBtn3: TBitBtn;
    MECodHistoricoBaixa: TMaskEdit;
    Label12: TLabel;
    SpeedButton4: TSpeedButton;
    MEHistoricoBaixa: TMaskEdit;
    SpeedButton5: TSpeedButton;
    Label13: TLabel;
    MEContaCorrenteBaixa: TMaskEdit;
    MECodContaCorrenteBaixa: TMaskEdit;
    RgTipo: TRadioGroup;
    procedure MECodBancoChange(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure MECodHistoricoChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MECodContaCorrenteChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtCadastroClick(Sender: TObject);
    procedure MeCadastroChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DsBancoBaixaChequeDataChange(Sender: TObject; Field: TField);
    procedure SpeedButton4Click(Sender: TObject);
    procedure MECodHistoricoBaixaChange(Sender: TObject);
    procedure MECodContaCorrenteBaixaChange(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBancosBaixaCheque: TFBancosBaixaCheque;

implementation

uses UBancoAgencia_cl, UOracle_cl, UBancosCons, UHistoricoCons,
  UContaCorrenteCons, UHistorico_cl, UCadastroCons, UCadastro_cl,
  UUsuario_cl, UBancosBaixaChequeItens, UParamSistema_cl, UCaixa_cl;

{$R *.DFM}

procedure TFBancosBaixaCheque.MECodBancoChange(Sender: TObject);
begin
  if Trim(MECodBanco.Text)<>'' then
    MEBanco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MECodBanco.Text)
  else
    MEBanco.Clear;

end;

procedure TFBancosBaixaCheque.SpeedButton3Click(Sender: TObject);
begin
  if FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal=mrOk then
    MECodbanco.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value);

end;

procedure TFBancosBaixaCheque.MECodHistoricoChange(Sender: TObject);
begin
  if Trim(MECodHistorico.Text)<>'' then
    MEHistorico.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+MECodHistorico.Text)
  else
    MEHistorico.Clear;
end;

procedure TFBancosBaixaCheque.SpeedButton1Click(Sender: TObject);
begin
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=mrOk then
    MECodHistorico.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);

end;

procedure TFBancosBaixaCheque.MECodContaCorrenteChange(Sender: TObject);
begin
  if Trim(MECodContaCorrente.Text)<>'' then
    MEContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+MECodContaCorrente.Text)
  else
    MEContaCorrente.Clear;

end;

procedure TFBancosBaixaCheque.SpeedButton2Click(Sender: TObject);
begin
  if FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal=mrOk then
    MECodContaCorrente.Text:=floattostr(DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value);
end;

procedure TFBancosBaixaCheque.BitBtn2Click(Sender: TObject);
begin
  If trim(MEDtInicial.Text) = '' then
  begin
    MEDtInicial.SetFocus;
    raise Exception.Create('Preencha a Data Inicial do Movimento.');
  end;
  if trim(MEDtFinal.Text) = '' then
  begin
    MEDtFinal.SetFocus;
    raise Exception.Create('Preencha a Data Final do Movimento.');
  end;

  with DMBancoAgencia do
  begin
    QBancoMovCons.Close;
    QBancoMovCons.Sql.Clear;
    QBancoMovCons.Sql.Add('SELECT ');
    QBancoMovCons.Sql.Add('  T1.COD_BCO_MOVIMENTO,');
    QBancoMovCons.Sql.Add('  T1.COD_USUARIO,');
    QBancoMovCons.Sql.Add('  T1.COD_HISTORICO,');
    QBancoMovCons.Sql.Add('  T1.COD_CONTA_CORRENTE,');
    QBancoMovCons.Sql.Add('  T1.NUM_CHEQUE,');
    QBancoMovCons.Sql.Add('  T1.IND_BAIXA_CHEQUE,');
    QBancoMovCons.Sql.Add('  T1.DT_MOVIMENTO,');
    QBancoMovCons.Sql.Add('  T1.VAL_MOVIMENTO,');
    QBancoMovCons.Sql.Add('  T1.DESC_OBSERVACAO,');
    QBancoMovCons.Sql.Add('  T1.DESC_COMPLEMENTO1,');
    QBancoMovCons.Sql.Add('  T1.DESC_COMPLEMENTO2,');
    QBancoMovCons.Sql.Add('  T1.COD_NOTA_CAB,');
    QBancoMovCons.Sql.Add('  T1.COD_CONTA_RECEBER_CAB,');
    QBancoMovCons.Sql.Add('  T1.COD_CONTA_PAGAR_CAB,');
    QBancoMovCons.Sql.Add('  T1.DT_USUARIO,');
    QBancoMovCons.Sql.Add('  T1.NUM_NOTA,');
    QBancoMovCons.Sql.Add('  T1.COD_SERIE,');
    QBancoMovCons.Sql.Add('  T1.COD_CADASTRO,');
    QBancoMovCons.Sql.Add('  T1.NUM_CARGA,');
    QBancoMovCons.Sql.Add('  T3.DESC_BANCO_AGENCIA,');
    QBancoMovCons.Sql.Add('  T1.IND_DEPOSITO_PENDENTE, ');
    QBancoMovCons.Sql.Add('  T1.IND_TIPO_CHEQUE, ');
    QBancoMovCons.Sql.Add('  T1.VAL_BAIXADO, ');
    QBancoMovCons.Sql.Add('  T1.COD_DEPARTAMENTO, ');
    QBancoMovCons.Sql.Add('  T1.COD_VENDEDOR ');
    QBancoMovCons.Sql.Add('FROM ');
    QBancoMovCons.Sql.Add('  TB_BCO_MOVIMENTO T1,');
    QBancoMovCons.Sql.Add('  TB_CONTA_CORRENTE T2,');
    QBancoMovCons.Sql.Add('  TB_BANCO_AGENCIA T3 ');
    QBancoMovCons.Sql.Add('WHERE T1.COD_CONTA_CORRENTE = T2.COD_CONTA_CORRENTE ');
    QBancoMovCons.Sql.Add('  AND T2.COD_BANCO_AGENCIA = T3.COD_BANCO_AGENCIA ');
    if Trim(MECodBanco.Text) <> '' then
      QBancoMovCons.Sql.Add(' AND T3.COD_BANCO_AGENCIA = ' + Trim(MECodBanco.Text));
    if Trim(MECodHistorico.Text) <> '' then
      QBancoMovCons.Sql.Add(' AND T1.COD_HISTORICO = ' + Trim(MECodHistorico.Text));
    if Trim(MECodContaCorrente.Text) <> '' then
      QBancoMovCons.Sql.Add(' AND T1.COD_CONTA_CORRENTE = ' + Trim(MECodContaCorrente.Text));
    if Trim(METexto.Text) <> '' then
      QBancoMovCons.Sql.Add(' AND T1.NUM_CHEQUE = ' + Trim(METexto.Text));
    if Trim(MENumNota.Text) <> '' then
      QBancoMovCons.Sql.Add(' AND T1.NUM_NOTA = ' + Trim(MENumNota.Text));
    if Trim(MECadastro.Text) <> '' then
       QBancoMovCons.Sql.Add(' AND T1.COD_CADASTRO = ' + Trim(MECadastro.Text));
    if Trim(MEDtInicial.Text) <> '' then
       QBancoMovCons.Sql.Add(' AND T1.DT_MOVIMENTO >= ' + chr(39) + Trim(MEDtInicial.Text) + chr(39));
    if Trim(MEDtFinal.Text) <> '' then
       QBancoMovCons.Sql.Add(' AND T1.DT_MOVIMENTO <= ' + chr(39) + Trim(MEDtFinal.Text) + chr(39));
    if RGMovimento.ItemIndex = 0 Then
    Begin
      if RGSituacaoCheque.ItemIndex = 0 then
         QBancoMovCons.Sql.Add(' AND T1.IND_BAIXA_CHEQUE = '+chr(39)+'N'+chr(39));
      if RGSituacaoCheque.ItemIndex = 1 then
         QBancoMovCons.Sql.Add(' AND T1.IND_BAIXA_CHEQUE = '+chr(39)+'S'+chr(39));
      QBancoMovCons.Sql.Add(' AND T1.IND_DEPOSITO_PENDENTE = '+chr(39)+'NAO'+chr(39));
      QBancoMovCons.Sql.Add(' AND T1.IND_CHEQUE_DEVOLVIDO = '+chr(39)+'NAO'+chr(39));
    End;
    if RGMovimento.ItemIndex = 1 Then
     Begin
       QBancoMovCons.Sql.Add(' AND T1.IND_DEPOSITO_PENDENTE = '+chr(39)+'SIM'+chr(39));
       if RGSituacaoCheque.ItemIndex = 0 then
          QBancoMovCons.Sql.Add(' AND T1.DT_BAIXA_DEP_PENDENTE IS NULL ');
       if RGSituacaoCheque.ItemIndex = 1 then
          QBancoMovCons.Sql.Add(' AND T1.DT_BAIXA_DEP_PENDENTE IS NOT NULL ');
     End;
    if RGMovimento.ItemIndex = 2 Then
     Begin
       QBancoMovCons.Sql.Add(' AND T1.IND_CHEQUE_DEVOLVIDO = '+chr(39)+'SIM'+chr(39));
       if RGSituacaoCheque.ItemIndex = 0 then
          QBancoMovCons.Sql.Add(' AND T1.DT_BAIXA_CHEQUE_DEVOLVIDO IS NULL ');
       if RGSituacaoCheque.ItemIndex = 1 then
          QBancoMovCons.Sql.Add(' AND T1.DT_BAIXA_CHEQUE_DEVOLVIDO IS NOT NULL ');
     End;
    If RgOrdem.ItemIndex = 0 Then
       QBancoMovCons.Sql.Add(' Order By T1.NUM_CHEQUE ')
    else
       QBancoMovCons.Sql.Add(' Order By T1.DT_MOVIMENTO ');

    QBancoMovCons.Open;
  end;
end;

procedure TFBancosBaixaCheque.BitBtn1Click(Sender: TObject);
Var wComando : String;

  wCodBcoMovimentoBaixa, wCodCaixaMovBaixa : integer;

  wVal             : string;
  //variaveis contabilidade
  wCodHistorico    : real;
  wCodDoc          : real;
  wNumDoc          : string;
  wFilial          : Integer;
  wContaCred       : string;
  wCodCompl        : real;
  wVlrlancto       : real;
  wDTLancto        : TDate;
  wContaDeb        : string;
  wFilial_Contabil : Integer;
  wTipo            : String;
  cod              : Integer;

const wS : String = 'S';
begin
  If Trim(MeDtBaixa.Text) = '' Then
    Raise Exception.Create('É Obrigado Informar Data da Baixa');

  if (Trim(MECodContaCorrenteBaixa.text) <> '') and
     (Trim(MECodHistoricoBaixa.text) = '') then
    Raise Exception.Create('Ao informar a conta corrente, deve ser informado o histórico');

  //se somente o historico for preenchido lançar no
  //caixa, se historico e conta corrente forem preenchidos
  //lançar no banco, se nenhum for preenchido nao lançar

  wCodBcoMovimentoBaixa := 0;
  wCodCaixaMovBaixa     := 0;

  try
    DMOracle.DBCemapa.StartTransaction;
    if trim(MECodHistoricoBaixa.Text) <> '' then
    Begin
      if trim(MECodContaCorrenteBaixa.Text) <> '' then
      begin
        //LANCAR NA TB_BCO_MOVIMENTO
        DMBancoAgencia.QBancoMovimento.Close;
        DMBancoAgencia.QBancoMovimento.Open;
        DMBancoAgencia.QBancoMovimento.Insert;
        DMBancoAgencia.QBancoMovimentoCOD_HISTORICO.Value      := StrToInt(Trim(MECodHistoricoBaixa.Text));
        DMBancoAgencia.QBancoMovimentoCOD_CONTA_CORRENTE.Value := StrToInt(Trim(MECodContaCorrenteBaixa.Text));
        DMBancoAgencia.QBancoMovimentoDT_MOVIMENTO.Value       := strtodate(Trim(MeDtBaixa.Text));
        DMBancoAgencia.QBancoMovimentoVAL_MOVIMENTO.Value      := StrToFloat(Trim(MEValor.Text));
        DMBancoAgencia.QBancoMovimentoDT_USUARIO.Value         := date;
        DMBancoAgencia.QBancoMovimentoCOD_USUARIO.Value        := DMUsuario.CodUsuarioCorrente;
        DMBancoAgencia.QBancoMovimentoDESC_OBSERVACAO.Value    := EdObservacao.Text;
        if DMBancoAgencia.QBancoMovConsCOD_CADASTRO.Value <> 0 then
          DMBancoAgencia.QBancoMovimentoCOD_CADASTRO.Value := DMBancoAgencia.QBancoMovConsCOD_CADASTRO.Value;
        if DMBancoAgencia.QBancoMovConsCOD_DEPARTAMENTO.Value <> 0 then
          DMBancoAgencia.QBancoMovimentoCOD_DEPARTAMENTO.Value := DMBancoAgencia.QBancoMovConsCOD_DEPARTAMENTO.Value;
        if DMBancoAgencia.QBancoMovConsCOD_VENDEDOR.Value <> 0 then
          DMBancoAgencia.QBancoMovimentoCOD_VENDEDOR.Value := DMBancoAgencia.QBancoMovConsCOD_VENDEDOR.Value;
        //Na baixa não estava indo o NUM_CHEQUE quando mudava de banco. Solicitacao Marcos(Cemapa). Junior 30/06/2015
        if DMBancoAgencia.QBancoMovConsNUM_CHEQUE.Value <> 0 then
          DMBancoAgencia.QBancoMovimentoNUM_CHEQUE.Value := DMBancoAgencia.QBancoMovConsNUM_CHEQUE.Value;

        DMBancoAgencia.QBancoMovimento.Post;

        wCodBcoMovimentoBaixa := DMBancoAgencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
        //LANCAR NA CONTABILIDADE------------------------------------------------
        If DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' Then
         Begin
           wCodDoc          := DMBancoAgencia.QBancoMovimentoCOD_BCO_MOVIMENTO.Value;
           wNumDoc          := '';//NAO VAI NADA
           wFilial          := StrToInt('0'+DMOracle.BuscaNome('SELECT COD_FILIAL FROM TB_CONTA_CORRENTE ',
                                                  'COD_CONTA_CORRENTE = ' + inttostr(DMBancoAgencia.QBancoMovimentoCOD_CONTA_CORRENTE.Value)));
           if wFilial = 0 Then
              wFilial := 1;
           wFilial_Contabil := wFilial;

           //quando for cheque devolvido, as contas contabeis sao diferentes
           if (RGMovimento.ItemIndex = 1) then
            begin
             wContaDeb  := DMOracle.BuscaNome('SELECT COD_CONTABIL_DEB FROM TB_HISTORICO',
                                                      'COD_HISTORICO = ' + inttostr(DMBancoAgencia.QBancoMovimentoCOD_HISTORICO.Value));
             //para o banco, a conta CREDITO busca da agencia (COD_CONTABIL_VL_PRIN_BCO_DEB)
             wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_PRIN_BCO_CRED FROM '+
                                                      'TB_BANCO_AGENCIA T1, TB_CONTA_CORRENTE T2',
                                                      'T1.COD_BANCO_AGENCIA = T2.COD_BANCO_AGENCIA '+
                                                      'AND COD_CONTA_CORRENTE = ' + inttostr(DMBancoAgencia.QBancoMovimentoCOD_CONTA_CORRENTE.Value));
            end
           else
            begin
              wContaCred := DMOracle.BuscaNome('SELECT COD_CONTABIL_CRED FROM TB_HISTORICO',
                                                       'COD_HISTORICO = ' + inttostr(DMBancoAgencia.QBancoMovimentoCOD_HISTORICO.Value));
              //para o banco, a conta CREDITO busca da agencia (COD_CONTABIL_VL_PRIN_BCO_DEB)
              wContaDeb := DMOracle.BuscaNome('SELECT COD_CONTABIL_VL_PRIN_BCO_DEB FROM '+
                                                       'TB_BANCO_AGENCIA T1, TB_CONTA_CORRENTE T2',
                                                       'T1.COD_BANCO_AGENCIA = T2.COD_BANCO_AGENCIA '+
                                                       'AND COD_CONTA_CORRENTE = ' + inttostr(DMBancoAgencia.QBancoMovimentoCOD_CONTA_CORRENTE.Value));
            end;

            wCodCompl        := 0;//NAO VAI NADA
            wVal             := DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_HISTORICO','COD_HISTORICO = ' + inttostr(DMBancoAgencia.QBancoMovimentoCOD_HISTORICO.Value));
            If wVal = '' Then
               Raise exception.Create('Informar Histório Contabil - no Histório ' + Trim(MECodHistoricoBaixa.Text));
            if wVal <> '' then
              wCodHistorico    := StrToInt(wVal);
            wVlrlancto       := DMBancoAgencia.QBancoMovimentoVAL_MOVIMENTO.Value;
            wDTLancto        := DMBancoAgencia.QBancoMovimentoDT_MOVIMENTO.Value;

            DMBancoAgencia.OPContabilidade.CallIntegerFunction(
               'GRAVA_LANC',['BC',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,DATETOSTR(wDTLancto),wContaDeb]);
            DMBancoAgencia.OPContabilidade.CallIntegerFunction(
               'GRAVA_LANC',['BC',wCodDoc,wNumDoc,wFilial_Contabil,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,DATETOSTR(wDTLancto),wContaCred]);
         end
      End
     else
      begin
        //lancar no caixa:
        wFilial          := StrToInt('0'+DMOracle.BuscaNome('SELECT COD_FILIAL FROM TB_CONTA_CORRENTE ',
                                               'COD_CONTA_CORRENTE = ' + IntToStr(DMBancoAgencia.QBancoMovConsCOD_CONTA_CORRENTE.Value)));
        if wFilial = 0 Then
           wFilial := 1;
        DMCaixa.QCaixa_Mov.Close;
        DMCaixa.QCaixa_Mov.Open;
        DMCaixa.QCaixa_Mov.Insert;
        DMCaixa.QCaixa_MovCOD_USUARIO.Value      := DMUsuario.CodUsuarioCorrente;
        DMCaixa.QCaixa_MovCOD_FILIAL.Value       := wFilial;
        DMCaixa.QCaixa_MovCOD_DEPARTAMENTO.Value := DMBancoAgencia.QBancoMovConsCOD_DEPARTAMENTO.Value;
        DMCaixa.QCaixa_MovCOD_HISTORICO.Value    := StrToInt(Trim(MECodHistoricoBaixa.Text));
        DMCaixa.QCaixa_MovDT_MOVIMENTO.Value     := strtodate(Trim(MeDtBaixa.Text));
        DMCaixa.QCaixa_MovVAL_MOVIMENTO.Value    := StrToFloat(Trim(MEValor.Text));
        DMCaixa.QCaixa_MovDT_USUARIO.Value       := Date;
        DMCaixa.QCaixa_MovDESC_COMPLEMENTO.Value := EdObservacao.Text;
        if not DMBancoAgencia.QBancoMovConsCOD_CADASTRO.IsNull then
          DMCaixa.QCaixa_MovCOD_CADASTRO.Value   := DMBancoAgencia.QBancoMovConsCOD_CADASTRO.Value;
        DMCaixa.QCaixa_Mov.Post;

        wCodCaixaMovBaixa := DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
        //LANCAR NA CONTABILIDADE------------------------------------------------
        If DMParamSistema.QParamSistemaInd_Contabiliza.Value = 'S' Then
         Begin
           wCodDoc          := DMCaixa.QCaixa_MovCOD_CAIXA_MOV.Value;
           wNumDoc          := '';//NAO VAI NADA
           wFilial          := DMCaixa.QCaixa_MovCOD_FILIAL.Value;
           wFilial_Contabil := DMCaixa.QCaixa_MovCOD_FILIAL.Value;
           wContaCred       := DMOracle.BuscaNome('SELECT COD_CONTABIL_CRED FROM TB_HISTORICO','COD_HISTORICO = ' + inttostr(DMCaixa.QCaixa_MovCOD_HISTORICO.Value));
           wContaDeb        := DMOracle.BuscaNome('SELECT COD_CONTABIL_DEB FROM TB_HISTORICO','COD_HISTORICO = ' + inttostr(DMCaixa.QCaixa_MovCOD_HISTORICO.Value));
           wCodCompl        := 0;//NAO VAI NADA
           wVal             := DMOracle.BuscaNome('SELECT COD_HISTORICO_CONTABIL FROM TB_HISTORICO','COD_HISTORICO = ' + inttostr(DMCaixa.QCaixa_MovCOD_HISTORICO.Value));
           If wVal = '' Then
              Raise exception.Create('Informar Histório Contabil - no Histório ' + Trim(MECodHistoricoBaixa.Text));
           wCodHistorico    := StrToInt(wVal);
           wVlrlancto       := DMCaixa.QCaixa_MovVAL_MOVIMENTO.Value;
           wDTLancto        := DMCaixa.QCaixa_MovDT_MOVIMENTO.Value;

           DMBancoAgencia.OPContabilidade.CallIntegerFunction(
              'GRAVA_LANC',['CX',wCodDoc,wNumDoc,wFilial,wContaCred,'CREDITO',wCodCompl,wCodHistorico,wVlrlancto,DATETOSTR(wDTLancto),wContaDeb]);
           DMBancoAgencia.OPContabilidade.CallIntegerFunction(
              'GRAVA_LANC',['CX',wCodDoc,wNumDoc,wFilial_Contabil,wContaDeb,'DEBITO',wCodCompl,wCodHistorico,wVlrlancto,DATETOSTR(wDTLancto),wContaCred]);
         //--FIM DO LANCAMENTO NA CONTABILIDADE--------------------------------------
         End;
      end;
    end;
    DMBancoAgencia.QBcoMovimentoMov.CommitOnPost := false;
    DMBancoAgencia.QBcoMovimentoMov.Close;
    DMBancoAgencia.QBcoMovimentoMov.open;
    DMBancoAgencia.QBcoMovimentoMov.Insert;

    DMBancoAgencia.QBcoMovimentoMovDT_USUARIO.Value       := date;
    DMBancoAgencia.QBcoMovimentoMovVAL_MOVIMENTO.Value    := StrToFloat(MEValor.Text);
    DMBancoAgencia.QBcoMovimentoMovDT_MOVIMENTO.Value     := StrToDate(MeDtBaixa.Text);
    DMBancoAgencia.QBcoMovimentoMovDESC_COMPLEMENTO.Value := trim(EdObservacao.Text);
    DMBancoAgencia.QBcoMovimentoMovCOD_USUARIO.Value      := DMUsuario.CodUsuarioCorrente;
    if RGMovimento.ItemIndex = 0 then
      DMBancoAgencia.QBcoMovimentoMovIND_MOVIMENTO.Value  := 'CHEQUE';
    if RGMovimento.ItemIndex = 1 then
      DMBancoAgencia.QBcoMovimentoMovIND_MOVIMENTO.Value  := 'DEP_PENDENTE';
    if RGMovimento.ItemIndex = 2 then
      DMBancoAgencia.QBcoMovimentoMovIND_MOVIMENTO.Value  := 'CHEQUE_DEV';

    //se foi o lancamento foi pro banco
    if wCodBcoMovimentoBaixa > 0 then
      DMBancoAgencia.QBcoMovimentoMovCOD_BCO_MOVIMENTO_BAIXA.Value := wCodBcoMovimentoBaixa;
    //se o lancamento foi pro caixa
    if wCodCaixaMovBaixa > 0 then
      DMBancoAgencia.QBcoMovimentoMovCOD_CAIXA_MOV_BAIXA.Value := wCodCaixaMovBaixa;

    DMBancoAgencia.QBcoMovimentoMov.Post;

    DMOracle.DBCemapa.Commit;
    DMBancoAgencia.QBcoMovimentoMov.CommitOnPost := true;
  except
    DMOracle.DBCemapa.Rollback;
    DMBancoAgencia.QBcoMovimentoMov.CommitOnPost := true;
    raise;
    exit;
  end;

  //limpa o conteudo dos edits para evitar de incluir duas vezes o mesmo valor
  MEValor.Clear;
  MeDtBaixa.Clear;
  MECodHistoricoBaixa.Clear;
  MECodContaCorrenteBaixa.Clear;
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'MOINHO' then
     EdObservacao.Clear;
  // atualiza o cheque conforme o tipo escolhido na tela - colocado pelo César
  Case RgTipo.ItemIndex of
    0 : wTipo := 'NORMAL';
    1 : wTipo := 'CUSTODIA';
    2 : wTipo := 'DESCONTO';
    3 : wTipo := 'DEPOSITO';
  End;
  DMOracle.DBCemapa.StartTransaction;
  try
    DMOracle.QExecSQL.Close;
    DMOracle.QExecSQL.SQL.Clear;
    DMOracle.QExecSQL.SQL.Add('UPDATE TB_BCO_MOVIMENTO SET IND_TIPO_CHEQUE = '+#39+wTipo+#39);
    DMOracle.QExecSQL.SQL.Add(' WHERE COD_BCO_MOVIMENTO = '+DMBancoAgencia.QBancoMovConsCOD_BCO_MOVIMENTO.Text);
    DMOracle.QExecSQL.ExecSQL;
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
  end;
  {  If RGMovimento.ItemIndex = 0 then  // BAIXA DE CHEQUE
  Begin
    With DMBancoAgencia do
    Begin
      QBaixaCheque.Close;
      QBaixaCheque.SetVariable('Cod_Bco_Movimento',QBancoMovConsCod_Bco_Movimento.Value);
      QBaixaCheque.Open;
      QBaixaCheque.Edit;
      QBaixaChequeDesc_Complemento2.Value := Trim(EdObservacao.Text);
      QBaixaChequeInd_Baixa_Cheque.Value := wS;
      QBaixaChequeDt_Baixa_Cheque.Value := StrToDate(MEDtBaixa.Text);
      QBaixaCheque.Post;
      QBaixaCheque.Close;
    End;
  End;

  If RGMovimento.ItemIndex = 1 then   // BAIXA DE DEPOSITO PENDENTE
  Begin
    DMOracle.DBCemapa.StartTransaction;
    try
      DMOracle.QExecSQL.Close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('UPDATE TB_BCO_MOVIMENTO SET IND_DEPOSITO_PENDENTE = '+#39+'NAO'+#39);
      DMOracle.QExecSQL.SQL.Add(', DT_BAIXA_DEP_PENDENTE = '+#39+MEDtBaixa.Text+#39);
      DMOracle.QExecSQL.SQL.Add(' WHERE COD_BCO_MOVIMENTO = '+DMBancoAgencia.QBancoMovConsCOD_BCO_MOVIMENTO.Text);
      DMOracle.QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
    end;
  End;
  //Else
  If RGMovimento.ItemIndex = 2 then  //BAIXA DE CHEQUE DEVOLVIDO
  Begin
    DMOracle.DBCemapa.StartTransaction;
    try
      DMOracle.QExecSQL.Close;
      DMOracle.QExecSQL.SQL.Clear;
      DMOracle.QExecSQL.SQL.Add('UPDATE TB_BCO_MOVIMENTO SET IND_CHEQUE_DEVOLVIDO = '+#39+'NAO'+#39);
      DMOracle.QExecSQL.SQL.Add(', DT_BAIXA_CHEQUE_DEVOLVIDO = '+#39+MEDtBaixa.Text+#39);
      DMOracle.QExecSQL.SQL.Add(' WHERE COD_BCO_MOVIMENTO = '+DMBancoAgencia.QBancoMovConsCOD_BCO_MOVIMENTO.Text);
      DMOracle.QExecSQL.ExecSQL;
      DMOracle.DBCemapa.Commit;
    except
      DMOracle.DBCemapa.Rollback;
    end;
  End;
}


  cod := DMBancoAgencia.QBancoMovConsCOD_BCO_MOVIMENTO.Value; //posisiciona o cursor onde tava antes de fechar e abrir a query

  DMBancoAgencia.QBancoMovCons.Close;
  DMBancoAgencia.QBancoMovCons.Open;

  DMBancoAgencia.QBancoMovCons.Locate('COD_BCO_MOVIMENTO',cod,[]); //posisiciona o cursor onde tava antes de fechar e abrir a query
End;

procedure TFBancosBaixaCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with DMBancoAgencia do
    QBancoMovCons.Close;
  Action := caFree;
  FBancosBaixaCheque := Nil;
end;

procedure TFBancosBaixaCheque.BtCadastroClick(Sender: TObject);
begin
  if FCadastroCons  = Nil then
     FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal=mrOk Then
    MECadastro.Text:=DMCadastro.QCadastroConsCod_Cadastro.Text;

end;

procedure TFBancosBaixaCheque.MeCadastroChange(Sender: TObject);
begin
  if Trim(MECadastro.Text)<>'' then
    EdCadastro.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+Trim(MECadastro.Text))
  else
    EdCadastro.Clear;

end;

procedure TFBancosBaixaCheque.FormActivate(Sender: TObject);
begin
//   MeDtBaixa.Text := DATETOSTR(DMOracle.DataServ);
end;

procedure TFBancosBaixaCheque.BitBtn3Click(Sender: TObject);
var cod : integer;
begin
  if FBancosBaixaChequeItens = nil then
    FBancosBaixaChequeItens := TFBancosBaixaChequeItens.create(application);
  FBancosBaixaChequeItens.showmodal;

  cod := DMBancoAgencia.QBancoMovConsCOD_BCO_MOVIMENTO.Value; //posisiciona o cursor onde tava antes de fechar e abrir a query

  DMBancoAgencia.QBancoMovCons.Close;
  DMBancoAgencia.QBancoMovCons.Open;

  DMBancoAgencia.QBancoMovCons.Locate('COD_BCO_MOVIMENTO',cod,[]); //posisiciona o cursor onde tava antes de fechar e abrir a query
end;

procedure TFBancosBaixaCheque.DsBancoBaixaChequeDataChange(Sender: TObject;
  Field: TField);
begin
  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'MOINHO' then
  begin
    if not DMBancoAgencia.QBancoMovCons.Eof then
    begin
      MeDtBaixa.text := datetostr(date);
      MEValor.text := FloatToStr(DMBancoAgencia.QBancoMovConsVAL_MOVIMENTO.value - DMBancoAgencia.QBancoMovConsVAL_BAIXADO.value);
    end;
  end;
  If DMBancoAgencia.QBancoMovConsInd_Tipo_Cheque.Value = 'NORMAL' Then
     RgTipo.ItemIndex := 0;
  If DMBancoAgencia.QBancoMovConsInd_Tipo_Cheque.Value = 'CUSTODIA' Then
     RgTipo.ItemIndex := 1;
  If DMBancoAgencia.QBancoMovConsInd_Tipo_Cheque.Value = 'DESCONTO' Then
     RgTipo.ItemIndex := 2;
  If DMBancoAgencia.QBancoMovConsInd_Tipo_Cheque.Value = 'DEPOSITO' Then
     RgTipo.ItemIndex := 3;
end;

procedure TFBancosBaixaCheque.SpeedButton4Click(Sender: TObject);
begin
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=mrOk then
    MECodHistoricoBaixa.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);
end;

procedure TFBancosBaixaCheque.MECodHistoricoBaixaChange(Sender: TObject);
begin
  if Trim(MECodHistoricoBaixa.Text)<>'' then
    MEHistoricoBaixa.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+MECodHistoricoBaixa.Text)
  else
    MEHistoricoBaixa.Clear;
end;

procedure TFBancosBaixaCheque.MECodContaCorrenteBaixaChange(
  Sender: TObject);
begin
  if Trim(MECodContaCorrenteBaixa.Text) <> '' then
    MEContaCorrenteBaixa.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+MECodContaCorrenteBaixa.Text)
  else
    MEContaCorrenteBaixa.Clear;
end;

procedure TFBancosBaixaCheque.SpeedButton5Click(Sender: TObject);
begin
  if FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal=mrOk then
    MECodContaCorrenteBaixa.Text:=floattostr(DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value);
end;

end.
