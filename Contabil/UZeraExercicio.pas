unit UZeraExercicio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls;

type
  TFZeraExercicio = class(TForm)
    MECodFilial: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MEFilial: TMaskEdit;
    MEPeriodo: TMaskEdit;
    MENumConta: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MEDescConta: TMaskEdit;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Label4: TLabel;
    MeDtLancamento: TMaskEdit;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    BitBtn5: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MECodFilialChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MENumContaExit(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FZeraExercicio: TFZeraExercicio;

implementation

uses UFilialCons, UFilial_cl, UOracle_cl, UPlanoContaCons, UPlanoConta_cl,
  UParamSistema_cl, UPlanilha_cl, UBiblioteca;

{$R *.DFM}

procedure TFZeraExercicio.BitBtn1Click(Sender: TObject);
begin
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=mrOk then
    MECodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFZeraExercicio.BitBtn2Click(Sender: TObject);
begin
  If FPlanoContaCons=Nil then
    FPlanoContaCons:=TFPlanoContaCons.Create(Application);
  DMPlanoConta.QPlanoContaCons.Close;
  if FPlanoContaCons.ShowModal=mrOk then
    MENumConta.Text:=DMPlanoConta.QPlanoContaConsNum_Plano_Conta.Value;
  DMPlanoConta.QPlanoContaCons.Close;
end;

procedure TFZeraExercicio.MECodFilialChange(Sender: TObject);
begin
  if Trim(MECodFilial.Text)<>'' then
    MEFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MECodFilial.Text)
  else
    MEFilial.Clear;
end;

procedure TFZeraExercicio.FormActivate(Sender: TObject);
begin
  With DMPlanoConta do
  Begin
    QPlanoConta.Open;
    Case Round(DMParamSistema.QParamSistemaNum_Graus_Contabil.Value) Of
       4: MENumConta.EditMask := '#.##.##.######;0;';
       5: MENumConta.EditMask := '#.##.##.##.######;0;';
       6: MENumConta.EditMask := '#.##.##.##.##.######;0;';
    End;
  End;
end;

procedure TFZeraExercicio.MENumContaExit(Sender: TObject);
begin
  if ((Trim(Bib.LimpaString(MENumConta.Text,'.')))<>'') then
    begin
      MEDescConta.Text:=DMOracle.BuscaNome('SELECT DESC_PLANO_CONTA FROM TB_PLANO_CONTA','NUM_PLANO_CONTA = '+Bib.LimpaString(MENumConta.Text,'.'));
    end
  else
    begin
      MEDescConta.Clear;
    end;

end;

procedure TFZeraExercicio.BitBtn5Click(Sender: TObject);
var AnoMes: Integer;
begin
  AnoMes := StrToInt(copy(MEPeriodo.Text, 1, 4) + copy(MEPeriodo.Text, 6, 2));

  DMOracle.ExecutaSql('DELETE FROM TB_SALDO_CONTABIL_ENCERRAMENTO WHERE DT_ANO_MES = ' + IntToStr(AnoMes));

  DMPlanilha.QSaldoContabilEnc.Close;
  DMPlanilha.QSaldoContabilEnc.SetVariable('ANO_MES', AnoMes);
  DMPlanilha.QSaldoContabilEnc.open;

  DMPlanilha.QSaldoContabilEnc.First;

  try
    while not DMPlanilha.QSaldoContabilEnc.Eof do
    Begin
      DMPlanilha.QInsSaldoContabilEnc.Close;
      DMPlanilha.QInsSaldoContabilEnc.SetVariable('COD_FILIAL', DMPlanilha.QSaldoContabilEncCOD_FILIAL.Value);
      DMPlanilha.QInsSaldoContabilEnc.SetVariable('COD_PLANO_CONTA', DMPlanilha.QSaldoContabilEncCOD_PLANO_CONTA.Value);
      DMPlanilha.QInsSaldoContabilEnc.SetVariable('DT_ANO_MES', DMPlanilha.QSaldoContabilEncDT_ANO_MES.Value);
      DMPlanilha.QInsSaldoContabilEnc.SetVariable('VAL_ANTERIOR', DMPlanilha.QSaldoContabilEncVAL_ANTERIOR.Value);
      DMPlanilha.QInsSaldoContabilEnc.SetVariable('VAL_ATUAL', DMPlanilha.QSaldoContabilEncVAL_ATUAL.Value);
      DMPlanilha.QInsSaldoContabilEnc.SetVariable('VAL_CREDITO', DMPlanilha.QSaldoContabilEncVAL_CREDITO.Value);
      DMPlanilha.QInsSaldoContabilEnc.SetVariable('VAL_DEBITO', DMPlanilha.QSaldoContabilEncVAL_DEBITO.Value);
      DMPlanilha.QInsSaldoContabilEnc.SetVariable('VAL_SALDO_DRE', DMPlanilha.QSaldoContabilEncVAL_SALDO_DRE.Value);
      DMPlanilha.QInsSaldoContabilEnc.ExecSQL;

      DMPlanilha.QSaldoContabilEnc.Next;
    End;

    DMOracle.DBCemapa.Commit;
  except
    MessageDlg('Erro ao salvar.', mtError, [mbOK], 0);
    Abort;
  end;

  MessageDlg('Saldo salvo com sucesso.', mtInformation, [mbOK], 0);
end;

procedure TFZeraExercicio.BitBtn3Click(Sender: TObject);
begin
  if (Panel1.Visible) then
    if MessageDlg('Deseja salvar o saldo das contas contábeis?',
      mtConfirmation, [mbYes, mbNo],0) = mrYes then
      BitBtn5Click(Sender);
end;

end.
