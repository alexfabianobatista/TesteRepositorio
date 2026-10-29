unit UEGFParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFEGFParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    ME0Produto: TMaskEdit;
    Label4: TLabel;
    ME0Local: TMaskEdit;
    SB0Local: TSpeedButton;
    edt0Local: TEdit;
    Label2: TLabel;
    ME0Banco: TMaskEdit;
    edt0Banco: TEdit;
    SB0Banco: TSpeedButton;
    ME0ContaCorrente: TMaskEdit;
    Label3: TLabel;
    SB0ContaCorrente: TSpeedButton;
    edt0ContaCorrente: TEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    ME0DtCreditoInicio: TMaskEdit;
    ME0DtCreditoFim: TMaskEdit;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    ME0DtVencimentoInicio: TMaskEdit;
    ME0DtVencimentoFim: TMaskEdit;
    TabSheet2: TTabSheet;
    Label5: TLabel;
    ME1Produto: TMaskEdit;
    ME1Local: TMaskEdit;
    Label10: TLabel;
    SB1Local: TSpeedButton;
    edt1Local: TEdit;
    Label11: TLabel;
    ME1Banco: TMaskEdit;
    SB1Banco: TSpeedButton;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    ME1DtCreditoInicio: TMaskEdit;
    ME1DtCreditoFim: TMaskEdit;
    GroupBox4: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    ME1DtVencimentoInicio: TMaskEdit;
    ME1DtVencimentoFim: TMaskEdit;
    ME1ContaCorrente: TMaskEdit;
    Label16: TLabel;
    SB1ContaCorrente: TSpeedButton;
    edt1ContaCorrente: TEdit;
    edt1Banco: TEdit;
    TabSheet3: TTabSheet;
    Label17: TLabel;
    ME2Produto: TMaskEdit;
    ME2Local: TMaskEdit;
    Label18: TLabel;
    SB2Local: TSpeedButton;
    edt2Local: TEdit;
    Label19: TLabel;
    ME2Banco: TMaskEdit;
    SB2Banco: TSpeedButton;
    edt2Banco: TEdit;
    ME2ContaCorrente: TMaskEdit;
    Label20: TLabel;
    SB2ContaCorrente: TSpeedButton;
    edt2ContaCorrente: TEdit;
    GroupBox5: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    ME2DtCreditoInicio: TMaskEdit;
    ME2DtCreditoFim: TMaskEdit;
    GroupBox6: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    ME2DtVencimentoInicio: TMaskEdit;
    ME2DtVencimentoFim: TMaskEdit;
    RG0Baixados: TRadioGroup;
    RG1Baixados: TRadioGroup;
    RG2Baixados: TRadioGroup;
    ME0DtBase: TMaskEdit;
    Label25: TLabel;
    procedure ME0LocalExit(Sender: TObject);
    procedure SB0LocalClick(Sender: TObject);
    procedure ME0BancoExit(Sender: TObject);
    procedure SB0BancoClick(Sender: TObject);
    procedure ME0ContaCorrenteExit(Sender: TObject);
    procedure SB0ContaCorrenteClick(Sender: TObject);
    procedure ME1LocalExit(Sender: TObject);
    procedure SB1LocalClick(Sender: TObject);
    procedure ME1BancoExit(Sender: TObject);
    procedure SB1BancoClick(Sender: TObject);
    procedure ME1ContaCorrenteExit(Sender: TObject);
    procedure SB1ContaCorrenteClick(Sender: TObject);
    procedure ME2LocalExit(Sender: TObject);
    procedure SB2LocalClick(Sender: TObject);
    procedure ME2BancoExit(Sender: TObject);
    procedure SB2BancoClick(Sender: TObject);
    procedure ME2ContaCorrenteExit(Sender: TObject);
    procedure SB2ContaCorrenteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEGFParam: TFEGFParam;

implementation

uses UOracle_cl, UFilialCons, UFilial_cl, UBancosCons, UBancoAgencia_cl,
  UContaCorrenteCons;

{$R *.DFM}

procedure TFEGFParam.ME0LocalExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0Local.Text)<>'' then
    edt0Local.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME0Local.Text)
  else
    edt0Local.Clear;
end;

procedure TFEGFParam.SB0LocalClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME0Local.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME0LocalExit(Self);
  end;
end;

procedure TFEGFParam.ME0BancoExit(Sender: TObject);
begin
  inherited;
  if trim(ME0Banco.Text) <> '' then
    edt0Banco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = ' + ME0Banco.Text)
  else
    edt0Banco.Text := '';
end;

procedure TFEGFParam.SB0BancoClick(Sender: TObject);
begin
  inherited;
  if FBancosCons = nil then
    FBancosCons := tFBancosCons.create(application);

  if FBancosCons.showmodal = mrok then
  begin
    ME0Banco.Text := DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Text;
    ME0BancoExit(sender);
  end;
end;

procedure TFEGFParam.ME0ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(ME0ContaCorrente.Text) <> '' then
    EDT0ContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + ME0ContaCorrente.Text)
  else
    EDT0ContaCorrente.Text := '';
end;

procedure TFEGFParam.SB0ContaCorrenteClick(Sender: TObject);
begin
  inherited;
  If (FContaCorrenteCons = nil) Then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If (FContaCorrenteCons.ShowModal = mrOk) Then
  begin
    ME0ContaCorrente.Text := floattostr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value);
    ME0ContaCorrenteExit(sender);
  end;
end;

procedure TFEGFParam.ME1LocalExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1Local.Text)<>'' then
    edt1Local.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME1Local.Text)
  else
    edt1Local.Clear;
end;

procedure TFEGFParam.SB1LocalClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME1Local.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME1LocalExit(Self);
  end;
end;

procedure TFEGFParam.ME1BancoExit(Sender: TObject);
begin
  inherited;
  if trim(ME1Banco.Text) <> '' then
    edt1Banco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = ' + ME1Banco.Text)
  else
    edt1Banco.Text := '';
end;

procedure TFEGFParam.SB1BancoClick(Sender: TObject);
begin
  inherited;
  if FBancosCons = nil then
    FBancosCons := tFBancosCons.create(application);

  if FBancosCons.showmodal = mrok then
  begin
    ME1Banco.Text := DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Text;
    ME1BancoExit(sender);
  end;
end;

procedure TFEGFParam.ME1ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(ME1ContaCorrente.Text) <> '' then
    EDT1ContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + ME1ContaCorrente.Text)
  else
    EDT1ContaCorrente.Text := '';
end;

procedure TFEGFParam.SB1ContaCorrenteClick(Sender: TObject);
begin
  inherited;
  If (FContaCorrenteCons = nil) Then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If (FContaCorrenteCons.ShowModal = mrOk) Then
  begin
    ME1ContaCorrente.Text := floattostr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value);
    ME1ContaCorrenteExit(sender);
  end;
end;

procedure TFEGFParam.ME2LocalExit(Sender: TObject);
begin
  inherited;
  if Trim(ME2Local.Text)<>'' then
    edt2Local.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+ME2Local.Text)
  else
    edt2Local.Clear;
end;

procedure TFEGFParam.SB2LocalClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal = mrOk then
  begin
    ME2Local.Text := DMFilial.QFilialConsCod_Filial.Text;
    ME2LocalExit(Self);
  end;
end;

procedure TFEGFParam.ME2BancoExit(Sender: TObject);
begin
  inherited;
  if trim(ME2Banco.Text) <> '' then
    edt2Banco.Text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA','COD_BANCO_AGENCIA = ' + ME2Banco.Text)
  else
    edt2Banco.Text := '';
end;

procedure TFEGFParam.SB2BancoClick(Sender: TObject);
begin
  inherited;
  if FBancosCons = nil then
    FBancosCons := tFBancosCons.create(application);

  if FBancosCons.showmodal = mrok then
  begin
    ME2Banco.Text := DMBancoAgencia.QBancoAgenciaConsCOD_BANCO_AGENCIA.Text;
    ME2BancoExit(sender);
  end;
end;

procedure TFEGFParam.ME2ContaCorrenteExit(Sender: TObject);
begin
  inherited;
  if trim(ME2ContaCorrente.Text) <> '' then
    EDT2ContaCorrente.Text := DMOracle.BuscaNome('SELECT DESC_CONTA_CORRENTE FROM TB_CONTA_CORRENTE','COD_CONTA_CORRENTE = ' + ME2ContaCorrente.Text)
  else
    EDT2ContaCorrente.Text := '';
end;

procedure TFEGFParam.SB2ContaCorrenteClick(Sender: TObject);
begin
  inherited;
  If (FContaCorrenteCons = nil) Then
    FContaCorrenteCons := TFContaCorrenteCons.Create(Application);
  If (FContaCorrenteCons.ShowModal = mrOk) Then
  begin
    ME2ContaCorrente.Text := floattostr(DMBancoAgencia.QContaCorrenteConsCOD_CONTA_CORRENTE.Value);
    ME2ContaCorrenteExit(sender);
  end;
end;

end.
