unit UVerbaRepresentanteParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTPARAMETRO, StdCtrls, ExtCtrls, Buttons, ComCtrls, Mask;

type
  TFVerbaRepresentanteParam = class(TFTParametro)
    TabSheet1: TTabSheet;
    Label61: TLabel;
    Me1Representante: TMaskEdit;
    Bt1Representante: TBitBtn;
    Ed1DescRepresentante: TEdit;
    Me1Mes: TMaskEdit;
    Label1: TLabel;
    Me1Ano: TMaskEdit;
    Label2: TLabel;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    Me2Mes: TMaskEdit;
    Label4: TLabel;
    Me2Ano: TMaskEdit;
    Label5: TLabel;
    Me2Representante: TMaskEdit;
    Bt2Representante: TBitBtn;
    Ed2DescRepresentante: TEdit;
    procedure Me1RepresentanteExit(Sender: TObject);
    procedure Bt1RepresentanteClick(Sender: TObject);
    procedure Me2RepresentanteExit(Sender: TObject);
    procedure Bt2RepresentanteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVerbaRepresentanteParam: TFVerbaRepresentanteParam;

implementation

uses UOracle_cl, UVendedorCons, UVendedor_cl;

{$R *.dfm}

procedure TFVerbaRepresentanteParam.Me1RepresentanteExit(Sender: TObject);
begin
  inherited;
  if Trim(Me1Representante.Text) <> '' then
    Ed1DescRepresentante.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR =' + Trim(Me1Representante.Text))
  else
    Ed1DescRepresentante.Text := 'Todos';
end;

procedure TFVerbaRepresentanteParam.Bt1RepresentanteClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = MrOk then
    Me1Representante.Text := DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
  Me1RepresentanteExit(Self);
end;

procedure TFVerbaRepresentanteParam.Me2RepresentanteExit(Sender: TObject);
begin
  inherited;
  if Trim(Me2Representante.Text) <> '' then
    Ed2DescRepresentante.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR =' + Trim(Me2Representante.Text))
  else
    Ed2DescRepresentante.Text := 'Todos';
end;

procedure TFVerbaRepresentanteParam.Bt2RepresentanteClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = MrOk then
    Me2Representante.Text := DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
  Me2RepresentanteExit(Self);
end;

end.
