unit UBancoConciliaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants, Menus;

type
  TFBancoConciliaCons = class(TFTConsulta)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    MEHistorico: TMaskEdit;
    MECodHistorico: TMaskEdit;
    MEContaCorrente: TMaskEdit;
    MECodContaCorrente: TMaskEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    MEDtInicial: TMaskEdit;
    MEDtFinal: TMaskEdit;
    MECodBanco: TMaskEdit;
    Label6: TLabel;
    SpeedButton3: TSpeedButton;
    MEBanco: TMaskEdit;
    BitBtn1: TBitBtn;
    Label7: TLabel;
    MeDtCompensacao: TMaskEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure MECodHistoricoChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MECodContaCorrenteChange(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure MECodBancoChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBancoConciliaCons: TFBancoConciliaCons;

implementation

uses UHistoricoCons, UOracle_cl, UContaCorrenteCons, UHistorico_cl,
  UBancoAgencia_cl, UBancosCons, UParamSistema_cl;

{$R *.DFM}

procedure TFBancoConciliaCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=mrOk then
    MECodHistorico.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);
end;

procedure TFBancoConciliaCons.MECodHistoricoChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodHistorico.Text)<>'' then
    MEHistorico.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+MECodHistorico.Text)
  else
    MEHistorico.Clear;
end;

procedure TFBancoConciliaCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal=mrOk then
    MECodContaCorrente.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value);

end;

procedure TFBancoConciliaCons.MECodContaCorrenteChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodContaCorrente.Text)<>'' then
    MEContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+MECodContaCorrente.Text)
  else
    MEContaCorrente.Clear;
end;

procedure TFBancoConciliaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMBancoAgencia do
    begin
      QBancoConciliaCons.Close;

      if Trim(METexto.Text) <> '' then
        QBancoConciliaCons.SetVariable('NUM_CHEQUE',StrToInt(Trim(METexto.Text)))
      else
        QBancoConciliaCons.SetVariable('NUM_CHEQUE',Null);

      if Trim(MECodBanco.Text)<>'' then
        QBancoConciliaCons.SetVariable('COD_BANCO_AGENCIA',StrToInt(Trim(MECodBanco.Text)))
      else
        QBancoConciliaCons.SetVariable('COD_BANCO_AGENCIA',Null);

      if Trim(MECodHistorico.Text)<>'' then
        QBancoConciliaCons.SetVariable('COD_HISTORICO',StrToInt(Trim(MECodHistorico.Text)))
      else
        QBancoConciliaCons.SetVariable('COD_HISTORICO',Null);

      if Trim(MECodContaCorrente.Text) <> '' then
        QBancoConciliaCons.SetVariable('COD_CONTA_CORRENTE',StrToInt(Trim(MECodContaCorrente.Text)))
      else
        QBancoConciliaCons.SetVariable('COD_CONTA_CORRENTE',Null);

      if Trim(MEDtInicial.Text) <> '' then
        QBancoConciliaCons.SetVariable('DT_INICIAL',StrToDate(MEDtInicial.Text))
      else
        Raise Exception.Create('Informar Data de Movimento Inicial');

      if Trim(MEDtFinal.Text) <> '' then
        QBancoConciliaCons.SetVariable('DT_FINAL',StrToDate(MEDtFinal.Text))
      else
        Raise Exception.Create('Informar Data de Movimento Final');
      If DMParamSistema.QParamSistemaCod_Empresa.Value = 'GRASEL' Then
       Begin
         QBancoConciliaCons.Sql[QBancoConciliaCons.Sql.Count -1] := '';
         QBancoConciliaCons.Sql.Add(' Order by VAL_MOVIMENTO')
       End;
      QBancoConciliaCons.Open;
    end;
end;

procedure TFBancoConciliaCons.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal=mrOk then
    MECodbanco.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value);
end;

procedure TFBancoConciliaCons.MECodBancoChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodBanco.Text)<>'' then
    MEBanco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MECodBanco.Text)
  else
    MEBanco.Clear;
end;

procedure TFBancoConciliaCons.BitBtn1Click(Sender: TObject);
Var wComando : String;
begin
  inherited;
  If Not(DMBancoAgencia.QBancoConciliaCons.Eof) Then
   Begin
     If DMBancoAgencia.QBancoConciliaConsCod_Bco_Movimento.Text <> '' Then
      Begin
        DMOracle.QExecSQL.Close;
        DMOracle.QExecSQL.SQL.Clear;
        wComando := 'UPDATE TB_BCO_MOVIMENTO SET DT_COMPENSACAO = ' + QuoteDStr(MeDtCompensacao.Text);
        If DMParamSistema.QParamSistemaCod_Empresa.Value = 'SR' Then  // FEITO PELO CÉSAR 08/12/2015 SOLICITACAO LANI
           wComando := wComando + ',DT_MOVIMENTO = ' + QuoteDStr(MeDtCompensacao.Text);
        wComando := wComando + ' WHERE COD_BCO_MOVIMENTO = ' + DMBancoAgencia.QBancoConciliaConsCod_Bco_Movimento.Text;
        DMOracle.QExecSQL.SQL.Add(wComando);
        DMOracle.QExecSQL.ExecSQL;
        DMOracle.QExecSQL.Close;
      End;
     DMOracle.QExecSQL.Close;
     DMOracle.QExecSQL.SQL.Clear;
     wComando := 'DELETE FROM TB_BCO_CONCILIA';
     wComando := wComando + ' WHERE COD_BCO_CONCILIA = ' + DMBancoAgencia.QBancoConciliaConsCod_Bco_Concilia.Text;
     DMOracle.QExecSQL.SQL.Add(wComando);
     DMOracle.QExecSQL.ExecSQL;
     DMOracle.QExecSQL.Close;
     If DMOracle.DBCemapa.InTransaction then //Se o estiver com a Transação em Aberto
        DMOracle.DBCemapa.Commit;
     DMBancoAgencia.QBancoConciliaCons.Close;
     DMBancoAgencia.QBancoConciliaCons.Open;
   End;
End;

procedure TFBancoConciliaCons.FormActivate(Sender: TObject);
begin
  inherited;
  MeDtCompensacao.Text := DateToStr(Date);
end;

end.
