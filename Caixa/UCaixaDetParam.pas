unit UCaixaDetParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTPARAMETRO, ComCtrls, StdCtrls, ExtCtrls, Buttons, Mask;

type
  TFCaixaDetParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label1: TLabel;
    MECodFilial: TMaskEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    MEFilial: TMaskEdit;
    MEDepartamento: TMaskEdit;
    MECodDepto: TMaskEdit;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    MEDtInicial: TMaskEdit;
    MEDtFinal: TMaskEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure MECodFilialExit(Sender: TObject);
    procedure MECodDeptoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCaixaDetParam: TFCaixaDetParam;

implementation

uses UFilialCons, UOracle_cl, UFilial_cl, UDepartamentoCons,
  UDepartamento_cl, UUsuario_cl;

{$R *.DFM}

procedure TFCaixaDetParam.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.ShowModal=MrOk then
    MECodFilial.Text:=FloatToStr(DMFilial.QFilialConsCod_Filial.Value);
end;

procedure TFCaixaDetParam.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal=MrOk then
    MECodDepto.Text:=FloatToStr(DMDepartamento.QDepartamentoConsCod_Departamento.Value);
end;

procedure TFCaixaDetParam.FormActivate(Sender: TObject);
begin
  inherited;
  MECodFilial.Text:=FloatToStr(DMUsuario.CodFilialUsuario);
end;

procedure TFCaixaDetParam.MECodFilialExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodFilial.Text)<>'' then
     MEFilial.Text:=DMOracle.BuscaNome('SELECT DESC_FILIAL FROM TB_FILIAL','COD_FILIAL = '+Trim(MECodFilial.Text))
  else
     MEFilial.Clear;

end;

procedure TFCaixaDetParam.MECodDeptoExit(Sender: TObject);
begin
  inherited;
  if Trim(MECodDepto.Text) <> '' then
     MEDepartamento.Text:=DMOracle.BuscaNome('SELECT DESC_DEPARTAMENTO FROM TB_DEPARTAMENTO','COD_DEPARTAMENTO = '+Trim(MECodDepto.Text))
  else
     MEDepartamento.Clear;

end;

end.
