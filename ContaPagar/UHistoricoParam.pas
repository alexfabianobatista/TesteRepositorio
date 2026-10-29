unit UHistoricoParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFHistoricoParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    RgOrdem: TRadioGroup;
    TabSheet2: TTabSheet;
    ME1Filial: TMaskEdit;
    SB1Filial: TSpeedButton;
    Ed1Filial: TEdit;
    GroupBox1: TGroupBox;
    ME1DTInicial: TMaskEdit;
    ME1DtFinal: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ME1Departamento: TMaskEdit;
    SB1Departamento: TSpeedButton;
    Ed1Departamento: TEdit;
    Label4: TLabel;
    Rg1ContasPagar: TRadioGroup;
    RgSituacao: TRadioGroup;
    RgOperacao: TRadioGroup;
    procedure SB1FilialClick(Sender: TObject);
    procedure ME1FilialExit(Sender: TObject);
    procedure SB1DepartamentoClick(Sender: TObject);
    procedure ME1DepartamentoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FHistoricoParam: TFHistoricoParam;

implementation

uses UFilialCons, UOracle_cl, UFilial_cl, UDepartamentoCons,
  UDepartamento_cl;

{$R *.DFM}

procedure TFHistoricoParam.SB1FilialClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons:=TFFilialCons.Create(Application);
  if FFilialCons.Showmodal=mrOk then
    ME1Filial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
    Ed1Filial.Text:=DMFilial.QFilialConsDesc_Filial.Text;
end;

procedure TFHistoricoParam.ME1FilialExit(Sender: TObject);
begin
  inherited;
if Trim(ME1Filial.text)<>'' then
    begin
      Ed1Filial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL ='+ME1Filial.Text);
    end
  else
    begin
      Ed1Filial.Text := 'Todas';
   end;

end;

procedure TFHistoricoParam.SB1DepartamentoClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = Nil then
    FDepartamentoCons:=TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.Showmodal=mrOk then
    ME1Departamento.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
    Ed1Departamento.Text:=DMDepartamento.QDepartamentoConsDesc_Departamento.Text;

end;

procedure TFHistoricoParam.ME1DepartamentoExit(Sender: TObject);
begin
  inherited;
if Trim(ME1Departamento.text)<>'' then
    begin
      Ed1Departamento.Text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO ='+ME1DEPARTAMENTO.Text);
    end
  else
    begin
      Ed1Departamento.Text := 'Todos';
   end;
end;

end.
