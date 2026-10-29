unit UBancoMovCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus,
  UFmDepartamento;

type
  TFBancoMovCons = class(TFTConsulta)
    SpeedButton1: TSpeedButton;
    MEHistorico: TMaskEdit;
    MECodHistorico: TMaskEdit;
    SpeedButton2: TSpeedButton;
    MEContaCorrente: TMaskEdit;
    MECodContaCorrente: TMaskEdit;
    GroupBox1: TGroupBox;
    MEDtInicial: TMaskEdit;
    MEDtFinal: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    MECodBanco: TMaskEdit;
    SpeedButton3: TSpeedButton;
    MEBanco: TMaskEdit;
    Label6: TLabel;
    MeNrNota: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    MeCodCadastro: TMaskEdit;
    SpeedButton4: TSpeedButton;
    MeCadastro: TMaskEdit;
    Label9: TLabel;
    MeValor: TMaskEdit;
    LblValor: TLabel;
    Label10: TLabel;
    FmDepartamento1: TFmDepartamento;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MECodHistoricoChange(Sender: TObject);
    procedure MECodContaCorrenteChange(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure MECodBancoChange(Sender: TObject);
    procedure MeCodCadastroChange(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBancoMovCons: TFBancoMovCons;

implementation

uses UHistoricoCons, UHistorico_cl, UContaCorrenteCons, UBancoAgencia_cl,
  UOracle_cl, UBancosCons, UCadastroCons,UBiblioteca,UCadastro_cl;

{$R *.DFM}

procedure TFBancoMovCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FHistoricoCons = Nil then
    FHistoricoCons := TFHistoricoCons.Create(Application);
  if FHistoricoCons.ShowModal=mrOk then
    MECodHistorico.Text:=FloatToStr(DMHistorico.QHistoricoConsCod_Historico.Value);
end;

procedure TFBancoMovCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FContaCorrenteCons = Nil then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  if FContaCorrenteCons.ShowModal=mrOk then
    MECodContaCorrente.Text:=FloatToStr(DMBancoAgencia.QContaCorrenteConsCod_Conta_Corrente.Value);
end;

procedure TFBancoMovCons.MECodHistoricoChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodHistorico.Text)<>'' then
    MEHistorico.Text:=DMOracle.BuscaNome('SELECT DESC_HISTORICO FROM TB_HISTORICO','COD_HISTORICO = '+MECodHistorico.Text)
  else
    MEHistorico.Clear;
end;

procedure TFBancoMovCons.MECodContaCorrenteChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodContaCorrente.Text)<>'' then
    MEContaCorrente.Text:=DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = '+MECodContaCorrente.Text)
  else
    MEContaCorrente.Clear;
end;

procedure TFBancoMovCons.BtProcurarClick(Sender: TObject);
Var wSql : String;
 wValorTotal :real;
begin
  inherited;
  with DMBancoAgencia do
    begin
      QBancoMovCons.Close;
      QBancoMovCons.Sql.Clear;
      wSql :=        'SELECT ';
      wSql := wSql + '  TB_BCO_MOVIMENTO.COD_BCO_MOVIMENTO,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.COD_USUARIO,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.COD_HISTORICO,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.COD_CONTA_CORRENTE,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.NUM_CHEQUE,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.IND_BAIXA_CHEQUE,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.DT_MOVIMENTO,';
      wSql := wSql + '  DECODE(TB_HISTORICO.IND_OPERACAO,' + chr(39) + '+' + chr(39) + ',TB_BCO_MOVIMENTO.VAL_MOVIMENTO,TB_BCO_MOVIMENTO.VAL_MOVIMENTO * -1) AS VAL_MOVIMENTO, ';
      wSql := wSql + '  TB_BCO_MOVIMENTO.DESC_OBSERVACAO,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.DESC_COMPLEMENTO1,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.DESC_COMPLEMENTO2,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.COD_NOTA_CAB,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.COD_CONTA_RECEBER_CAB,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.COD_CONTA_PAGAR_CAB,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.DT_USUARIO,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.NUM_NOTA,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.COD_SERIE,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.COD_CADASTRO,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.NUM_CARGA,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.IND_TIPO_CHEQUE,';
      wSql := wSql + '  TB_BANCO_AGENCIA.DESC_BANCO_AGENCIA,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.IND_DEPOSITO_PENDENTE,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.VAL_BAIXADO,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.COD_DEPARTAMENTO,';
      wSql := wSql + '  TB_BCO_MOVIMENTO.COD_VENDEDOR ';
      wSql := wSql + 'FROM ';
      wSql := wSql + '  TB_BCO_MOVIMENTO,';
      wSql := wSql + '  TB_CONTA_CORRENTE,';
      wSql := wSql + '  TB_BANCO_AGENCIA, ';
      wSql := wSql + '  TB_HISTORICO ';
      wSql := wSql + 'WHERE ';
      wSql := wSql + '  TB_BCO_MOVIMENTO.COD_CONTA_CORRENTE = TB_CONTA_CORRENTE.COD_CONTA_CORRENTE ';
      wSql := wSql + '  AND ';
      wSql := wSql + '  TB_CONTA_CORRENTE.COD_BANCO_AGENCIA = TB_BANCO_AGENCIA.COD_BANCO_AGENCIA ';
      wSql := wSql + '  AND ';
      wSql := wSql + '  TB_BCO_MOVIMENTO.COD_HISTORICO = TB_HISTORICO.COD_HISTORICO ';
      if Trim(MECodBanco.Text) <> '' then
         wSql := wSql + ' AND TB_BANCO_AGENCIA.COD_BANCO_AGENCIA = ' + Trim(MECodBanco.Text);
      if Trim(MECodHistorico.Text) <> '' then
         wSql := wSql + ' AND TB_BCO_MOVIMENTO.COD_HISTORICO = ' + Trim(MECodHistorico.Text);
      if Trim(MECodContaCorrente.Text) <> '' then
         wSql := wSql + ' AND TB_CONTA_CORRENTE.COD_CONTA_CORRENTE = ' + Trim(MECodContaCorrente.Text);
      if Trim(METexto.Text) <> '' then
         wSql := wSql + ' AND TB_BCO_MOVIMENTO.NUM_CHEQUE = ' + Trim(METexto.Text);
      if Trim(MENrNota.Text) <> '' then
         wSql := wSql + ' AND TB_BCO_MOVIMENTO.NUM_NOTA = ' + Trim(MENrNota.Text);
      if Trim(MECodCadastro.Text) <> '' then
         wSql := wSql + ' AND TB_BCO_MOVIMENTO.COD_CADASTRO = ' + Trim(MECodCadastro.Text);
      if Trim(MEDtInicial.Text) <> '' then
         wSql := wSql + ' AND TB_BCO_MOVIMENTO.DT_MOVIMENTO >= ' + chr(39) + Trim(MEDtInicial.Text) + chr(39);
      if Trim(MEDtFinal.Text) <> '' then
         wSql := wSql + ' AND TB_BCO_MOVIMENTO.DT_MOVIMENTO <= ' + chr(39) + Trim(MEDtFinal.Text) + chr(39);
      if Trim(MeValor.Text) <> '' then
         wSql := wSql + ' AND TB_BCO_MOVIMENTO.VAL_MOVIMENTO = ' + Bib.TrocaVirgulaPorPonto(Trim(MeValor.Text));
      if Trim(FmDepartamento1.MeDepartamento.Text) <> '' then
        wSql := wSql + ' AND TB_BCO_MOVIMENTO.COD_DEPARTAMENTO = ' + Trim(FmDepartamento1.MeDepartamento.Text);

      QBancoMovCons.Sql.Add(wSql);
      QBancoMovCons.Open;

      wValorTotal := 0;
      QBancoMovCons.First;
      while Not QBancoMovCons.Eof Do
      begin
        wValorTotal := wValorTotal + QBancoMovConsVal_Movimento.Value;
        QBancoMovCons.next;
      end;
      LblValor.Caption := FormatFloat('#,##0.00',wValorTotal);
    end;
end;

procedure TFBancoMovCons.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FBancosCons = Nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal=mrOk then
    MECodbanco.Text:=FloatToStr(DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value);
end;

procedure TFBancoMovCons.MECodBancoChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodBanco.Text)<>'' then
    MEBanco.Text:=DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = '+MECodBanco.Text)
  else
    MEBanco.Clear;
end;

procedure TFBancoMovCons.MeCodCadastroChange(Sender: TObject);
begin
  inherited;
  if Trim(MECodCadastro.Text)<>'' then
    MECadastro.Text:=DMOracle.BuscaNome('SELECT NOME FROM TB_CADASTRO','COD_CADASTRO = '+MECodCadastro.Text)
  else
    MECadastro.Clear;
end;

procedure TFBancoMovCons.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  if FCadastroCons.ShowModal=mrOk then
    MECodCadastro.Text:=FloatToStr(DMCadastro.QCadastroConsCod_Cadastro.Value);
end;

procedure TFBancoMovCons.FormCreate(Sender: TObject);
begin
  inherited;
    MEDtInicial.Text := DateToStr(Date());
    MEDtFinal.Text := DateToStr(Date());
end;

end.
