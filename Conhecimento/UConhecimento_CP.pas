unit UConhecimento_CP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, UFmHistorico, UFmContaCorrente;

type
  TFConhecimento_CP = class(TForm)
    SpeedButton1: TSpeedButton;
    SbCodBanco: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    LblBanco: TLabel;
    Label3: TLabel;
    MECodFinalidade: TMaskEdit;
    MEFinalidade: TMaskEdit;
    MECodbanco: TMaskEdit;
    MEBanco: TMaskEdit;
    MECodDepartamento: TMaskEdit;
    MEDepartamento: TMaskEdit;
    Button1: TButton;
    BitBtn1: TBitBtn;
    SBPedagio: TSpeedButton;
    LblPedagio: TLabel;
    MeCodFinalidadePedagio: TMaskEdit;
    MeFinalidadePedagio: TMaskEdit;
    MEDtVencimento: TMaskEdit;
    LBDtVencimento: TLabel;
    SBFinalidadeICMS: TSpeedButton;
    Label5: TLabel;
    MeFinalidadeICMS: TMaskEdit;
    EdFinalidadeICMS: TMaskEdit;
    FmHistorico: TFmHistorico;
    FmContaCorrente: TFmContaCorrente;
    procedure MECodFinalidadeExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure MECodbancoExit(Sender: TObject);
    procedure SbCodBancoClick(Sender: TObject);
    procedure MECodDepartamentoExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure MeCodFinalidadePedagioExit(Sender: TObject);
    procedure SBPedagioClick(Sender: TObject);
    procedure SBFinalidadeICMSClick(Sender: TObject);
    procedure MeFinalidadeICMSExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConhecimento_CP: TFConhecimento_CP;

implementation

uses UOracle_cl, UFinalidade_cl, UFinalidadeCons, UBancosCons,
  UBancoAgencia_cl, UDepartamentoCons, UDepartamento_cl;

{$R *.DFM}

procedure TFConhecimento_CP.MECodFinalidadeExit(Sender: TObject);
begin
  if Trim(MECodFinalidade.Text) <> '' then
    MEFinalidade.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE', 'COD_FINALIDADE = ' + MECodFinalidade.Text)
  else
    MEFinalidade.Clear;
end;

procedure TFConhecimento_CP.SpeedButton1Click(Sender: TObject);
begin
  if FFinalidadeCons = nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal = mrOk then
  begin
    MECodFinalidade.text := Floattostr(DMFinalidade.QFinalidadeConsCod_finalidade.Value);
    MECodFinalidadeExit(Self);
  end;
end;

procedure TFConhecimento_CP.MECodbancoExit(Sender: TObject);
begin
  if Trim(MECodBanco.text) <> '' then
    MEBanco.text := DMOracle.BuscaNome('SELECT DESC_BANCO_AGENCIA FROM TB_BANCO_AGENCIA', 'COD_BANCO_AGENCIA = ' + MEcodbanco.text)
  else
    MEBanco.Clear;
end;

procedure TFConhecimento_CP.SbCodBancoClick(Sender: TObject);
begin
  if FBancosCons = nil then
    FBancosCons := TFBancosCons.Create(Application);
  if FBancosCons.ShowModal = mrOk then
  begin
    MECodbanco.text := Floattostr(DMBancoAgencia.QBancoAgenciaConsCod_Banco_Agencia.Value);
    MECodBancoExit(Self);
  end;

end;

procedure TFConhecimento_CP.MECodDepartamentoExit(Sender: TObject);
begin
  if Trim(MECodDepartamento.text) <> '' then
    MEDepartamento.text := DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO', 'COD_DEPARTAMENTO = ' + MECodDepartamento.text)
  else
    MEDepartamento.Clear;
end;

procedure TFConhecimento_CP.SpeedButton3Click(Sender: TObject);
begin
  if FdepartamentoCons = nil then
    FdepartamentoCons := TFdepartamentoCons.Create(Application);
  if FdepartamentoCons.ShowModal = mrOk then
  begin
    MECodDepartamento.text := Floattostr(DMDepartamento.QdepartamentoConsCod_departamento.Value);
    MECodDepartamentoExit(Self);
  end;
end;

procedure TFConhecimento_CP.MeCodFinalidadePedagioExit(Sender: TObject);
begin
  if Trim(MeCodFinalidadePedagio.Text) <> '' then
    MeFinalidadePedagio.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE', 'COD_FINALIDADE = ' + MeCodFinalidadePedagio.Text)
  else
    MeFinalidadePedagio.Clear;

end;

procedure TFConhecimento_CP.SBPedagioClick(Sender: TObject);
begin
  if FFinalidadeCons = nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal = mrOk then
  begin
    MeCodFinalidadePedagio.text := Floattostr(DMFinalidade.QFinalidadeConsCod_finalidade.Value);
    MeCodFinalidadePedagioExit(Self);
  end;
end;

procedure TFConhecimento_CP.SBFinalidadeICMSClick(Sender: TObject);
begin
  if FFinalidadeCons = nil then
    FFinalidadeCons := TFFinalidadeCons.Create(Application);
  if FFinalidadeCons.ShowModal = mrOk then
  begin
    MeFinalidadeICMS.text := Floattostr(DMFinalidade.QFinalidadeConsCod_finalidade.Value);
    MeFinalidadeICMSExit(Self);
  end;
end;

procedure TFConhecimento_CP.MeFinalidadeICMSExit(Sender: TObject);
begin
  if Trim(MeFinalidadeICMS.Text) <> '' then
    EdFinalidadeICMS.Text := DMOracle.BuscaNome('SELECT DESC_FINALIDADE FROM TB_FINALIDADE', 'COD_FINALIDADE = ' + MeFinalidadeICMS.Text)
  else
    EdFinalidadeICMS.Clear;
end;

end.

