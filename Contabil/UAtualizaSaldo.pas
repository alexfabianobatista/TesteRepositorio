unit UAtualizaSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ComCtrls, ExtCtrls;

type
  TFAtualizaSaldo = class(TForm)
    Label8: TLabel;
    MECodFilial: TMaskEdit;
    BtFilial: TBitBtn;
    MEFilial: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MEAnoMes: TMaskEdit;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Pb: TProgressBar;
    Label10: TLabel;
    MEConta: TMaskEdit;
    BitBtn4: TBitBtn;
    MEDescConta: TMaskEdit;
    Panel2: TPanel;
    procedure MECodFilialChange(Sender: TObject);
    procedure BtFilialClick(Sender: TObject);
    procedure MEContaExit(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    encerramento: Boolean;
  end;

var
  FAtualizaSaldo: TFAtualizaSaldo;

implementation

uses UOracle_cl, UFilialCons, UFilial_cl, UPlanilha_cl,
  UPlanoConta_cl,UBiblioteca, UPlanoContaCons, UParamSistema_cl,
  UUsuario_cl;

{$R *.DFM}

procedure TFAtualizaSaldo.MECodFilialChange(Sender: TObject);
begin
  if Trim(MECodFilial.Text)<>'' then
    MEFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.Text)
  else
    MEFilial.Text:='Todos';

end;

procedure TFAtualizaSaldo.BtFilialClick(Sender: TObject);
begin
  if FFilialCons=Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
    begin
      MECodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    end;
end;

procedure TFAtualizaSaldo.MEContaExit(Sender: TObject);
begin
  if Trim(MEConta.Text)<>'' then
    MEDescConta.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+MEConta.Text+chr(39))
  else
    MEDescConta.Clear;
end;

procedure TFAtualizaSaldo.BitBtn4Click(Sender: TObject);
begin
  if FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  DMPlanoConta.QPlanoContaCons.Close;
  if FPlanoContaCons.ShowModal=mrOk then
  Begin
    MEConta.Text:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
    MEDescConta.Text:=DMPlanoConta.QPlanoContaConsDesc_Plano_Conta.Value;
  End;

end;

procedure TFAtualizaSaldo.FormActivate(Sender: TObject);
begin
  With DMPlanoConta do
  Begin
    QPlanoConta.Open;
    Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
       4:begin
         MEConta.EditMask := '#.##.##.######;0;';
         end;
       5:begin
         MEConta.EditMask := '#.##.##.##.######;0;';
         end;
       6:begin
         MEConta.EditMask := '#.##.##.##.##.######;0;';
         end;
    End;
  End;

end;

procedure TFAtualizaSaldo.BitBtn1Click(Sender: TObject);
Var vComp,wMes,wAno :Integer;
  wDataInicial,wDataFinal,wNum_Conta : String;
  wValor_Teste : Real;
  wCod_Num_Conta, wCont : Integer;
Begin
  if encerramento then
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FAtualizaSaldo.MECodFilial.Text),'CONTABIL');
    DMOracle.DBCemapa.StartTransaction;
    Try
      with DMPlanilha do
       begin
         vComp:=StrToInt(Copy(Bib.LimpaString(FAtualizaSaldo.MEAnoMes.Text,'/'),5,2));
         if vComp = 1 then
           vComp := 89
         else
           vComp := 1;
         QViradaMes.Close;
         QViradaMes.Sql.Clear;
         QViradaMes.Sql.Add('SELECT TB_SALDO_CONTABIL.COD_FILIAL,TB_SALDO_CONTABIL.COD_PLANO_CONTA,TB_SALDO_CONTABIL.DT_ANO_MES,VAL_ANTERIOR,VAL_ATUAL,VAL_CREDITO,VAL_DEBITO ');
         QViradaMes.Sql.Add('FROM TB_SALDO_CONTABIL ');
         If FAtualizaSaldo.MeConta.Text <> '' Then  // esta rotina serve para buscar as contas contabeis para virada
          Begin                      // somente teste o nivel 1 da conta contabil para trazer todos os lancamentos
            QViradaMes.Sql.Add(',TB_PLANO_CONTA WHERE TB_SALDO_CONTABIL.COD_PLANO_CONTA=TB_PLANO_CONTA.COD_PLANO_CONTA ');
            QViradaMes.Sql.Add(' AND SUBSTR(TB_PLANO_CONTA.NUM_PLANO_CONTA,1,1) =' + COPY(FAtualizaSaldo.MeConta.Text,1,1));
          End
         Else
            QViradaMes.Sql.Add(' Where TB_SALDO_CONTABIL.COD_PLANO_CONTA >= 0 ');
         QViradaMes.Sql.Add(' AND TB_SALDO_CONTABIL.DT_ANO_MES = ' + IntToStr(StrToInt(Bib.LimpaString(FAtualizaSaldo.MEAnoMes.Text,'/'))-vComp));
         If Trim(FAtualizaSaldo.MECodFilial.Text) <> '' then
            QViradaMes.Sql.Add(' AND TB_SALDO_CONTABIL.COD_FILIAL = ' + FAtualizaSaldo.MECodFilial.Text);
         QViradaMes.Open;

          // esta rotina irá zerar as contas já existentes com saldo antes da virada(no periodo)

         QZeraVirada.Close;
         QZeraVirada.Sql.Clear;
         QZeraVirada.Sql.Add(' UPDATE  TB_SALDO_CONTABIL_ENCERRAMENTO SET VAL_ANTERIOR = 0,VAL_ATUAL = 0,VAL_CREDITO = 0, VAL_DEBITO  = 0');
         QZeraVirada.Sql.Add(' WHERE ');
         QZeraVirada.Sql.Add(' DT_ANO_MES = '+Bib.LimpaString(FAtualizaSaldo.MEAnoMes.Text,'/'));
         If Trim(FAtualizaSaldo.MECodFilial.Text) <> '' then
            QZeraVirada.Sql.Add(' AND COD_FILIAL = ' + FAtualizaSaldo.MECodFilial.Text);
         If FAtualizaSaldo.MeConta.Text <> '' Then   // esta rotina serve para buscar as contas contabeis para virada
          Begin
            QViradaMes.First;
            while not(QViradaMes.Eof) do
            begin
              QZeraVirada.Sql.Add(' AND COD_PLANO_CONTA = ' + QViradaMesCod_Plano_Conta.Text);
              QZeraVirada.ExecSQL;
              QViradaMes.Next;
            End;
          End
         Else
          Begin
            QZeraVirada.Sql.Add(' AND COD_PLANO_CONTA >= 0');
            QZeraVirada.ExecSQL;
          End;

          wMes:=StrToInt(Copy(Bib.LimpaString(FAtualizaSaldo.MEAnoMes.Text,'/'),5,2));
          wAno:=StrToInt(Copy(Bib.LimpaString(FAtualizaSaldo.MEAnoMes.Text,'/'),1,4));
          wDataInicial:=('01/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno));
          wDataFinal:=(FormatFloat('00',DMOracle.DiasNoMes(StrToDate(wDataInicial)))+'/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno));

    //     QSaldoContabilEncerramento.Open;
          QViradaMes.First;
          while not(QViradaMes.Eof) do
          begin
            QSaldoContabilEncerramento.Close;
            QSaldoContabilEncerramento.SetVariable('COD_CONTA',QViradaMesCod_Plano_Conta.Value);
            QSaldoContabilEncerramento.SetVariable('FILIAL',QViradaMesCod_Filial.Value);
            QSaldoContabilEncerramento.SetVariable('ANO_MES',StrToInt(Bib.LimpaString(FAtualizaSaldo.MEAnoMes.Text,'/')));
            QSaldoContabilEncerramento.Open;
            If QSaldoContabilEncerramento.Eof Then
               QSaldoContabilEncerramento.Insert
            Else
               QSaldoContabilEncerramento.Edit;
            QSaldoContabilEncerramentoDt_Ano_Mes.Value:=StrToInt(Bib.LimpaString(FAtualizaSaldo.MEAnoMes.Text,'/'));
            QSaldoContabilEncerramentoCod_Plano_Conta.Value:=QViradaMesCod_Plano_Conta.Value;
            QSaldoContabilEncerramentoCod_Filial.Value:=QViradaMesCod_Filial.Value;
            QSaldoContabilEncerramentoVal_Anterior.Value:=QViradaMesVal_Atual.Value;
            QSaldoContabilEncerramentoVal_Credito.Value:=0;
            QSaldoContabilEncerramentoVal_Debito.Value:=0;
            QSaldoContabilEncerramentoVal_Atual.Value:=QViradaMesVal_Atual.Value;
            QSaldoContabilEncerramento.Post;
            QViradaMes.Next;
          End;
          QSaldoVirada.Close;     // esta query traz o saldo debito e credito do periodo
          QSaldoVirada.Sql.Clear;
          QSaldoVirada.Sql.Add('SELECT COD_PLANO_CONTA,COD_FILIAL,SVAL_DEBITO,SVAL_CREDITO,SVAL_CREDITO + SVAL_DEBITO AS SVAL_SALDO ');
          QSaldoVirada.Sql.Add('FROM (SELECT TB_LANCTO_CONTABIL.COD_PLANO_CONTA,TB_LANCTO_CONTABIL.COD_FILIAL,SUM(DECODE(IND_OPERACAO,'+CHR(39)+'D'+CHR(39)+',VAL_LANCAMENTO,0)) AS SVAL_DEBITO,');
          QSaldoVirada.Sql.Add('SUM(DECODE(IND_OPERACAO,'+CHR(39)+'C'+CHR(39)+',VAL_LANCAMENTO,0)) AS SVAL_CREDITO FROM TB_LANCTO_CONTABIL ');
          If FAtualizaSaldo.MeConta.Text <> '' Then  // esta rotina serve para buscar as contas contabeis para virada
           Begin                      // somente teste o nivel 1 da conta contabil para trazer todos os lancamentos
             QSaldoVirada.Sql.Add(',TB_PLANO_CONTA WHERE TB_LANCTO_CONTABIL.COD_PLANO_CONTA=TB_PLANO_CONTA.COD_PLANO_CONTA ');
             QSaldoVirada.Sql.Add(' AND SUBSTR(TB_PLANO_CONTA.NUM_PLANO_CONTA,1,1) =' + COPY(FAtualizaSaldo.MeConta.Text,1,1));
             QSaldoVirada.Sql.Add(' AND ');
           End
          Else
             QSaldoVirada.Sql.Add(' Where ');
          QSaldoVirada.Sql.Add(' DT_LANCAMENTO BETWEEN ' + CHR(39) + wDataInicial + CHR(39) + ' AND ' + CHR(39) + wDataFinal + CHR(39));
          If Trim(FAtualizaSaldo.MECodFilial.Text) <> '' Then
             QSaldoVirada.Sql.Add(' AND TB_LANCTO_CONTABIL.COD_FILIAL = ' + FAtualizaSaldo.MECodFilial.Text);
        QSaldoVirada.Sql.Add(' AND TB_LANCTO_CONTABIL.COD_historico_contabil <> ' + DMParamSistema.QParamSistemaCOD_HISTORICO_CONTABIL_ZERA_EX.Text);
  {        If MeConta.Text <> '' Then  // esta rotina serve para buscar as contas contabeis para virada
           Begin
             wConta:=DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+MeConta.Text+chr(39));
             QSaldoVirada.Sql.Add(' AND COD_PLANO_CONTA =' + wConta);
           End;  }
          QSaldoVirada.Sql.Add(' GROUP BY TB_LANCTO_CONTABIL.COD_PLANO_CONTA,TB_LANCTO_CONTABIL.COD_FILIAL)');
          QSaldoVirada.Open;      // até aqui
          FAtualizaSaldo.PB.Max := QSaldoVirada.RecordCount;
          wCont := 0;
          While Not (QSaldoVirada.Eof) Do
          Begin
            DMPlanoConta.QPlanoConta.Close;
            DMPlanoConta.QPlanoConta.SetVariable('PK',QSaldoViradaCod_Plano_Conta.Value);
            DMPlanoConta.QPlanoConta.Open;
            wNum_Conta := DMPlanoConta.QPlanoContaNum_Plano_Conta.Value;
            While wNum_Conta <> '' do
            Begin
              wCod_Num_Conta := DMPlanilha.CodConta(QSaldoViradaCod_Filial.Value,wNum_Conta);
              QSaldoContabilEncerramento.Close;
              QSaldoContabilEncerramento.SetVariable('COD_CONTA',wCod_Num_Conta);
              QSaldoContabilEncerramento.SetVariable('FILIAL',QSaldoViradaCod_Filial.Value);
              QSaldoContabilEncerramento.SetVariable('ANO_MES',StrToFloat(Bib.LimpaString(FAtualizaSaldo.MEAnoMes.Text,'/')));
              QSaldoContabilEncerramento.Open;
              If QSaldoContabilEncerramento.Eof Then
               Begin
                QSaldoContabilEncerramento.Insert;
                QSaldoContabilEncerramentoDt_Ano_Mes.Value:=StrToInt(Bib.LimpaString(FAtualizaSaldo.MEAnoMes.Text,'/'));
                QSaldoContabilEncerramentoCod_Plano_Conta.Value:=wCod_Num_Conta;
                QSaldoContabilEncerramentoCod_Filial.Value:=QSaldoViradaCod_Filial.Value;
                QSaldoContabilEncerramentoVal_Anterior.Value:=0;
               End
              Else
                 QSaldoContabilEncerramento.Edit;
              QSaldoContabilEncerramentoVal_Credito.Value:=(QSaldoContabilEncerramentoVal_Credito.Value + QSaldoViradaSVal_Credito.Value);
              QSaldoContabilEncerramentoVal_Debito.Value:=(QSaldoContabilEncerramentoVal_Debito.Value + QSaldoViradaSVal_Debito.Value);
              QSaldoContabilEncerramentoVal_Atual.Value:=QSaldoContabilEncerramentoVal_Atual.Value + QSaldoViradaSVal_Saldo.Value;
              QSaldoContabilEncerramento.Post;
              wNum_Conta := DMPlanilha.NivelSuperior(wNum_Conta);
            End;
            QSaldoVirada.Next;
            Inc(wCont);
            FAtualizaSaldo.PB.Position := wCont;
          End;
         FAtualizaSaldo.PB.Position := 0;
         QSaldoContabilEncerramento.Close;
         QSaldoVirada.Close;
       end;  // with
    Except
     DMOracle.DBCemapa.RollBack;
     Raise;
    End;
    DMOracle.DBCemapa.Commit;
    MessageDlg('Atualização de Saldo Encerramento Gerado com Sucesso!',mtInformation,[mbOk],0);
  End
  Else
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(MECodFilial.Text),'CONTABIL');
    DMOracle.DBCemapa.StartTransaction;
    Try
      with DMPlanilha do
       begin
         vComp:=StrToInt(Copy(Bib.LimpaString(MEAnoMes.Text,'/'),5,2));
         if vComp = 1 then
           vComp := 89
         else
           vComp := 1;
         QViradaMes.Close;
         QViradaMes.Sql.Clear;
         QViradaMes.Sql.Add('SELECT TB_SALDO_CONTABIL.COD_FILIAL,TB_SALDO_CONTABIL.COD_PLANO_CONTA,TB_SALDO_CONTABIL.DT_ANO_MES,VAL_ANTERIOR,VAL_ATUAL,VAL_CREDITO,VAL_DEBITO ');
         QViradaMes.Sql.Add('FROM TB_SALDO_CONTABIL ');
         If MeConta.Text <> '' Then  // esta rotina serve para buscar as contas contabeis para virada
          Begin                      // somente teste o nivel 1 da conta contabil para trazer todos os lancamentos
            QViradaMes.Sql.Add(',TB_PLANO_CONTA WHERE TB_SALDO_CONTABIL.COD_PLANO_CONTA=TB_PLANO_CONTA.COD_PLANO_CONTA ');
            QViradaMes.Sql.Add(' AND SUBSTR(TB_PLANO_CONTA.NUM_PLANO_CONTA,1,1) =' + COPY(MeConta.Text,1,1));
          End
         Else
            QViradaMes.Sql.Add(' Where TB_SALDO_CONTABIL.COD_PLANO_CONTA >= 0 ');
         QViradaMes.Sql.Add(' AND TB_SALDO_CONTABIL.DT_ANO_MES = ' + IntToStr(StrToInt(Bib.LimpaString(MEAnoMes.Text,'/'))-vComp));
         If Trim(MECodFilial.Text) <> '' then
            QViradaMes.Sql.Add(' AND TB_SALDO_CONTABIL.COD_FILIAL = ' + MECodFilial.Text);
         QViradaMes.Open;

          // esta rotina irá zerar as contas já existentes com saldo antes da virada(no periodo)

         QZeraVirada.Close;
         QZeraVirada.Sql.Clear;
         QZeraVirada.Sql.Add(' UPDATE  TB_SALDO_CONTABIL SET VAL_ANTERIOR = 0,VAL_ATUAL = 0,VAL_CREDITO = 0, VAL_DEBITO  = 0');
         QZeraVirada.Sql.Add(' WHERE ');
         QZeraVirada.Sql.Add(' DT_ANO_MES = '+Bib.LimpaString(MEAnoMes.Text,'/'));
         If Trim(MECodFilial.Text) <> '' then
            QZeraVirada.Sql.Add(' AND COD_FILIAL = ' + MECodFilial.Text);
         If MeConta.Text <> '' Then   // esta rotina serve para buscar as contas contabeis para virada
          Begin
            QViradaMes.First;
            while not(QViradaMes.Eof) do
            begin
              QZeraVirada.Sql.Add(' AND COD_PLANO_CONTA = ' + QViradaMesCod_Plano_Conta.Text);
              QZeraVirada.ExecSQL;
              QViradaMes.Next;
            End;
          End
         Else
          Begin
            QZeraVirada.Sql.Add(' AND COD_PLANO_CONTA >= 0');
            QZeraVirada.ExecSQL;
          End;

          wMes:=StrToInt(Copy(Bib.LimpaString(MEAnoMes.Text,'/'),5,2));
          wAno:=StrToInt(Copy(Bib.LimpaString(MEAnoMes.Text,'/'),1,4));
          wDataInicial:=('01/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno));
          wDataFinal:=(FormatFloat('00',DMOracle.DiasNoMes(StrToDate(wDataInicial)))+'/'+FormatFloat('00',wMes)+'/'+FormatFloat('0000',wAno));

    //     QSaldoContabil.Open;
          QViradaMes.First;
          while not(QViradaMes.Eof) do
          begin
            QSaldoContabil.Close;
            QSaldoContabil.SetVariable('COD_CONTA',QViradaMesCod_Plano_Conta.Value);
            QSaldoContabil.SetVariable('FILIAL',QViradaMesCod_Filial.Value);
            QSaldoContabil.SetVariable('ANO_MES',StrToInt(Bib.LimpaString(MEAnoMes.Text,'/')));
            QSaldoContabil.Open;
            If QSaldoContabil.Eof Then
               QSaldoContabil.Insert
            Else
               QSaldoContabil.Edit;
            QSaldoContabilDt_Ano_Mes.Value:=StrToInt(Bib.LimpaString(MEAnoMes.Text,'/'));
            QSaldoContabilCod_Plano_Conta.Value:=QViradaMesCod_Plano_Conta.Value;
            QSaldoContabilCod_Filial.Value:=QViradaMesCod_Filial.Value;
            QSaldoContabilVal_Anterior.Value:=QViradaMesVal_Atual.Value;
            QSaldoContabilVal_Credito.Value:=0;
            QSaldoContabilVal_Debito.Value:=0;
            QSaldoContabilVal_Atual.Value:=QViradaMesVal_Atual.Value;
            QSaldoContabil.Post;
            QViradaMes.Next;
          End;
          QSaldoVirada.Close;     // esta query traz o saldo debito e credito do periodo
          QSaldoVirada.Sql.Clear;
          QSaldoVirada.Sql.Add('SELECT COD_PLANO_CONTA,COD_FILIAL,SVAL_DEBITO,SVAL_CREDITO,SVAL_CREDITO + SVAL_DEBITO AS SVAL_SALDO ');
          QSaldoVirada.Sql.Add('FROM (SELECT TB_LANCTO_CONTABIL.COD_PLANO_CONTA,TB_LANCTO_CONTABIL.COD_FILIAL,SUM(DECODE(IND_OPERACAO,'+CHR(39)+'D'+CHR(39)+',VAL_LANCAMENTO,0)) AS SVAL_DEBITO,');
          QSaldoVirada.Sql.Add('SUM(DECODE(IND_OPERACAO,'+CHR(39)+'C'+CHR(39)+',VAL_LANCAMENTO,0)) AS SVAL_CREDITO FROM TB_LANCTO_CONTABIL ');
          If MeConta.Text <> '' Then  // esta rotina serve para buscar as contas contabeis para virada
           Begin                      // somente teste o nivel 1 da conta contabil para trazer todos os lancamentos
             QSaldoVirada.Sql.Add(',TB_PLANO_CONTA WHERE TB_LANCTO_CONTABIL.COD_PLANO_CONTA=TB_PLANO_CONTA.COD_PLANO_CONTA ');
             QSaldoVirada.Sql.Add(' AND SUBSTR(TB_PLANO_CONTA.NUM_PLANO_CONTA,1,1) =' + COPY(MeConta.Text,1,1));
             QSaldoVirada.Sql.Add(' AND ');
           End
          Else
             QSaldoVirada.Sql.Add(' Where ');
          QSaldoVirada.Sql.Add(' DT_LANCAMENTO BETWEEN ' + CHR(39) + wDataInicial + CHR(39) + ' AND ' + CHR(39) + wDataFinal + CHR(39));
          If Trim(MECodFilial.Text) <> '' Then
             QSaldoVirada.Sql.Add(' AND TB_LANCTO_CONTABIL.COD_FILIAL = ' + MECodFilial.Text);
  {        If MeConta.Text <> '' Then  // esta rotina serve para buscar as contas contabeis para virada
           Begin
             wConta:=DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+MeConta.Text+chr(39));
             QSaldoVirada.Sql.Add(' AND COD_PLANO_CONTA =' + wConta);
           End;  }
          QSaldoVirada.Sql.Add(' GROUP BY TB_LANCTO_CONTABIL.COD_PLANO_CONTA,TB_LANCTO_CONTABIL.COD_FILIAL)');
          QSaldoVirada.Open;      // até aqui
          PB.Max := QSaldoVirada.RecordCount;
          wCont := 0;
          While Not (QSaldoVirada.Eof) Do
          Begin
            DMPlanoConta.QPlanoConta.Close;
            DMPlanoConta.QPlanoConta.SetVariable('PK',QSaldoViradaCod_Plano_Conta.Value);
            DMPlanoConta.QPlanoConta.Open;
            wNum_Conta := DMPlanoConta.QPlanoContaNum_Plano_Conta.Value;
            While wNum_Conta <> '' do
            Begin
              wCod_Num_Conta := DMPlanilha.CodConta(QSaldoViradaCod_Filial.Value,wNum_Conta);
              QSaldoContabil.Close;
              QSaldoContabil.SetVariable('COD_CONTA',wCod_Num_Conta);
              QSaldoContabil.SetVariable('FILIAL',QSaldoViradaCod_Filial.Value);
              QSaldoContabil.SetVariable('ANO_MES',StrToFloat(Bib.LimpaString(MEAnoMes.Text,'/')));
              QSaldoContabil.Open;
              If QSaldoContabil.Eof Then
               Begin
                QSaldoContabil.Insert;
                QSaldoContabilDt_Ano_Mes.Value:=StrToInt(Bib.LimpaString(MEAnoMes.Text,'/'));
                QSaldoContabilCod_Plano_Conta.Value:=wCod_Num_Conta;
                QSaldoContabilCod_Filial.Value:=QSaldoViradaCod_Filial.Value;
                QSaldoContabilVal_Anterior.Value:=0;
               End
              Else
                 QSaldoContabil.Edit;
              QSaldoContabilVal_Credito.Value:=(QSaldoContabilVal_Credito.Value + QSaldoViradaSVal_Credito.Value);
              QSaldoContabilVal_Debito.Value:=(QSaldoContabilVal_Debito.Value + QSaldoViradaSVal_Debito.Value);
              QSaldoContabilVal_Atual.Value:=QSaldoContabilVal_Atual.Value + QSaldoViradaSVal_Saldo.Value;
              QSaldoContabil.Post;
              wNum_Conta := DMPlanilha.NivelSuperior(wNum_Conta);
            End;
            QSaldoVirada.Next;
            Inc(wCont);
            PB.Position := wCont;
          End;
         PB.Position := 0;
         QSaldoContabil.Close;
         QSaldoVirada.Close;
  {       QAtzMensal.Close;
         If Trim(MeCodFilial.Text) = '' Then
            QAtzMensal.SetVariable('COD_FILIAL',Null)
         Else
            QAtzMensal.SetVariable('COD_FILIAL',StrToInt(Trim(MECodFilial.Text)));
         QAtzMensal.SetVariable('DATA_INICIAL',StrToDate(wDataInicial));
         QAtzMensal.SetVariable('DATA_FINAL',StrToDate(wDataFinal));
         If MeConta.Text <> '' Then  // esta rotina serve para buscar as contas contabeis para virada
          Begin
            wConta:=DMOracle.BuscaNome('SELECT COD_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+chr(39)+MeConta.Text+chr(39));
            QAtzMensal.Sql.Add(' AND COD_PLANO_CONTA =' + wConta);
            QAtzMensal.ExecSql;
            QAtzMensal.Sql[QAtzMensal.Sql.Count -1] := '';
          End
         Else
          QAtzMensal.ExecSql;  }
       end;  // with
    Except
     DMOracle.DBCemapa.RollBack;
     Raise;
    End;
    DMOracle.DBCemapa.Commit;      
  End;
end;

end.
