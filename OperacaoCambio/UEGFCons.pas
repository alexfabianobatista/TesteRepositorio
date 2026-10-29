unit UEGFCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants;

type
  TFEGFCons = class(TFTConsulta)
    MEBanco: TMaskEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    edtBanco: TEdit;
    MEContaCorrente: TMaskEdit;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    edtContaCorrente: TEdit;
    MELocal: TMaskEdit;
    Label4: TLabel;
    SpeedButton3: TSpeedButton;
    edtLocal: TEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    MEDtCreditoInicio: TMaskEdit;
    MEDtCreditoFim: TMaskEdit;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    MEDtVencimentoInicio: TMaskEdit;
    MEDtVencimentoFim: TMaskEdit;
    RGBaixados: TRadioGroup;
    Label5: TLabel;
    SpeedButton4: TSpeedButton;
    MEDepartamento: TMaskEdit;
    EDDepartamento: TEdit;
    MEDtBase: TMaskEdit;
    Label10: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MEContaCorrenteExit(Sender: TObject);
    procedure MEBancoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MELocalExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure MEDepartamentoExit(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEGFCons: TFEGFCons;

implementation

uses UEGF_cl, UContaCorrenteCons, UBancoAgencia_cl, UOracle_cl, UBancosCons,
  UFilialCons, UFilial_cl, UDepartamentoCons, UDepartamento_cl;

{$R *.DFM}

procedure TFEGFCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMEGF.QEGFCons.close;

  if Trim(MEDtBase.Text) = '' then
    raise Exception.create('Informe a data base')
  else
    DMEGF.QEGFCons.SetVariable('DT_BASE',strtodate(trim(MEDtBase.Text)));

  if trim(METexto.Text) <> '' then
    DMEGF.QEGFCons.SetVariable('DESC_PRODUTO',trim(METexto.Text))
  else
    DMEGF.QEGFCons.SetVariable('DESC_PRODUTO',null);

  if trim(MELocal.Text) <> '' then
    DMEGF.QEGFCons.SetVariable('COD_FILIAL',strtoint(trim(MELocal.Text)))
  else
    DMEGF.QEGFCons.SetVariable('COD_FILIAL',null);

  if trim(MEContaCorrente.Text) <> '' then
    DMEGF.QEGFCons.SetVariable('COD_CONTA_CORRENTE',strtoint(trim(MEContaCorrente.Text)))
  else
    DMEGF.QEGFCons.SetVariable('COD_CONTA_CORRENTE',null);

  if trim(MEBanco.Text) <> '' then
    DMEGF.QEGFCons.SetVariable('COD_BANCO_AGENCIA',strtoint(trim(MEBanco.Text)))
  else
    DMEGF.QEGFCons.SetVariable('COD_BANCO_AGENCIA',null);

  if trim(MEDtCreditoInicio.Text) <> '' then
    DMEGF.QEGFCons.SetVariable('DT_CREDITO_INI',strtodate(trim(MEDtCreditoInicio.Text)))
  else
    DMEGF.QEGFCons.SetVariable('DT_CREDITO_INI',null);

  if trim(MEDtCreditoFim.Text) <> '' then
    DMEGF.QEGFCons.SetVariable('DT_CREDITO_FIM',strtodate(trim(MEDtCreditoFim.Text)))
  else
    DMEGF.QEGFCons.SetVariable('DT_CREDITO_FIM',null);

  if trim(MEDtVencimentoInicio.Text) <> '' then
    DMEGF.QEGFCons.SetVariable('DT_VENCIMENTO_INI',strtodate(trim(MEDtVencimentoInicio.Text)))
  else
    DMEGF.QEGFCons.SetVariable('DT_VENCIMENTO_INI',null);

  if trim(MEDtVencimentoFim.Text) <> '' then
    DMEGF.QEGFCons.SetVariable('DT_VENCIMENTO_FIM',strtodate(trim(MEDtVencimentoFim.Text)))
  else
    DMEGF.QEGFCons.SetVariable('DT_VENCIMENTO_FIM',null);

  if trim(MEDepartamento.Text) <> '' then
    DMEGF.QEGFCons.SetVariable('COD_DEPARTAMENTO',StrToInt(trim(MEDepartamento.Text)))
  else
    DMEGF.QEGFCons.SetVariable('COD_DEPARTAMENTO',null);

  if RGBaixados.ItemIndex = 0 then
    DMEGF.QEGFCons.SetVariable('IND_BAIXADO',null);
  if RGBaixados.ItemIndex = 1 then
    DMEGF.QEGFCons.SetVariable('IND_BAIXADO','SIM');
  if RGBaixados.ItemIndex = 2 then
    DMEGF.QEGFCons.SetVariable('IND_BAIXADO','NAO');

  DMEGF.QEGFCons.open;
end;

procedure TFEGFCons.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  If (FContaCorrenteCons = nil) Then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If (FContaCorrenteCons.ShowModal = mrOk) Then
  begin
    MEContaCorrente.Text := floattostr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value);
    MEContaCorrenteExit(sender);
  end;
end;

procedure TFEGFCons.MEContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(MEContaCorrente.Text) <> '' then
    EDTContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + MEContaCorrente.Text)
  else
    EDTContaCorrente.Text := '';
end;

procedure TFEGFCons.MEBancoExit(Sender: TObject);
begin
  inherited;
  if trim(MEBanco.Text) <> '' then
    edtBanco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = ' + MEBanco.Text)
  else
    edtBanco.Text := '';
end;

procedure TFEGFCons.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FBancosCons = nil then
    FBancosCons := tFBancosCons.create(application);

  if FBancosCons.showmodal = mrok then
  begin
    MEBanco.Text := DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Text;
    MEBancoExit(sender);
  end;
end;

procedure TFEGFCons.MELocalExit(Sender: TObject);
begin
  inherited;
  if Trim(MELocal.Text)<>'' then
    edtLocal.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+MELocal.Text)
  else
    edtLocal.Clear;
end;

procedure TFEGFCons.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    MELocal.Text:=DMFilial.QFilialConsCod_Filial.Text;
    MELocalExit(Self);
  end;
end;

procedure TFEGFCons.MEDepartamentoExit(Sender: TObject);
begin
  inherited;
  if trim(MEDepartamento.Text) <> '' then
    edDepartamento.Text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = ' + Trim(MEDepartamento.Text))
  else
    edDepartamento.Text := '';
end;

procedure TFEGFCons.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := tFDepartamentoCons.create(application);

  if FDepartamentoCons.showmodal = mrok then
  begin
    MEDepartamento.Text := DMDepartamento.QDepartamentoConsCOD_DEPARTAMENTO.Text;
    MEDepartamentoExit(sender);
  end;
end;

procedure TFEGFCons.FormCreate(Sender: TObject);
begin
  inherited;
  MEDtBase.Text := datetostr(date);
end;

end.
