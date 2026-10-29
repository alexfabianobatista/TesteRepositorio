unit UVeiculoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask, UFmTipoCadastro;

type
  TFVeiculoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label27: TLabel;
    Bt0CodProprietario: TSpeedButton;
    ME0CodProprietario: TMaskEdit;
    ME0DescProprietario: TMaskEdit;
    Label1: TLabel;
    Me0CodEstado: TMaskEdit;
    Bt0Veiculo: TSpeedButton;
    Me0DescEstado: TMaskEdit;
    Rg0TipoVeiculo: TRadioGroup;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    Me1CodEstado: TMaskEdit;
    Bt1Estado: TSpeedButton;
    Me1DescEstado: TMaskEdit;
    Rg1Tipo: TRadioGroup;
    Me0Cnpj_Cgc: TMaskEdit;
    Label3: TLabel;
    ME1CNPJ: TMaskEdit;
    Label4: TLabel;
    Rg0Tipo: TRadioGroup;
    Rg1Situacao: TRadioGroup;
    FmTipoCadastro1: TFmTipoCadastro;
    RG0TipoPropriedade: TRadioGroup;
    procedure ME0CodProprietarioExit(Sender: TObject);
    procedure Bt0CodProprietarioClick(Sender: TObject);
    procedure Bt0VeiculoClick(Sender: TObject);
    procedure Me0CodEstadoExit(Sender: TObject);
    procedure Me1CodEstadoExit(Sender: TObject);
    procedure Bt1EstadoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVeiculoParam: TFVeiculoParam;

implementation

uses UOracle_cl, UProprietarioCons, UProprietario_cl, UEstadoCons,
  UEstado_cl;

{$R *.DFM}

procedure TFVeiculoParam.ME0CodProprietarioExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodProprietario.text)<>'' then
    ME0DescProprietario.text:=DMOracle.BuscaNome('SELECT NOME FROM TB_PROPRIETARIO','COD_PROPRIETARIO = '+Trim(ME0CodProprietario.text))
  else
    ME0DescProprietario.Clear;

end;

procedure TFVeiculoParam.Bt0CodProprietarioClick(Sender: TObject);
begin
  inherited;
  if FProprietarioCons = Nil then
    FProprietarioCons:=TFProprietarioCons.Create(Application);
  if FProprietarioCons.ShowModal = mrOk then
    begin
      ME0CodProprietario.text:=DMProprietario.QProprietarioConsCod_Proprietario.text;
      ME0CodProprietarioExit(Self);
    end;

end;

procedure TFVeiculoParam.Bt0VeiculoClick(Sender: TObject);
begin
  inherited;
  if FEstadoCons = Nil then
    FEstadoCons:=TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal = mrOk then
    begin
      ME0CodEstado.text:=DMEstado.QEstadoConsCod_Estado.text;
      ME0CodEstadoExit(Self);
    end;

end;

procedure TFVeiculoParam.Me0CodEstadoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME0CodEstado.text) <> '' then
    ME0DescEstado.text:=DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO','COD_ESTADO = '+Chr(39)+Trim(ME0CodEstado.text)+Chr(39))
  else
    ME0DescEstado.Clear;

end;

procedure TFVeiculoParam.Me1CodEstadoExit(Sender: TObject);
begin
  inherited;
  if Trim(ME1CodEstado.text) <> '' then
    ME1DescEstado.text:=DMOracle.BuscaNome('SELECT DESC_ESTADO FROM TB_ESTADO','COD_ESTADO = '+Chr(39)+Trim(ME1CodEstado.text)+Chr(39))
  else
    ME1DescEstado.Clear;

end;

procedure TFVeiculoParam.Bt1EstadoClick(Sender: TObject);
begin
  inherited;
  if FEstadoCons = Nil then
    FEstadoCons:=TFEstadoCons.Create(Application);
  if FEstadoCons.ShowModal = mrOk then
    begin
      Me1CodEstado.text:=DMEstado.QEstadoConsCod_Estado.text;
      Me1CodEstadoExit(Self);
    end;
end;

end.
