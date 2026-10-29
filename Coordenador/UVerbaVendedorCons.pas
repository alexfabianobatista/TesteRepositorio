unit UVerbaVendedorCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFVerbaVendedorCons = class(TFTConsulta)
    EdDescRepresentante: TEdit;
    BtRepresentante: TBitBtn;
    Label2: TLabel;
    MeAno: TMaskEdit;
    MeMes: TMaskEdit;
    Label3: TLabel;
    procedure BtProcurarClick(Sender: TObject);
    procedure METextoExit(Sender: TObject);
    procedure BtRepresentanteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVerbaVendedorCons: TFVerbaVendedorCons;

implementation

uses UVerbaRepresentante_cl, UVerbaVendedor, UOracle_cl, UUsuario_cl,
  UVendedorCons, UVendedor_cl;

{$R *.dfm}

procedure TFVerbaVendedorCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMVerbaRepresentante do
  begin
    QVerbaVendedorCons.Close;
    QVerbaVendedorCons.SetVariable('VENDEDOR',Trim(MeTexto.Text));

    if Trim(MeMes.Text) <> '' then
      QVerbaVendedorCons.SetVariable('MES', Trim(MeMes.Text))
    else
      QVerbaVendedorCons.SetVariable('MES', Null);

    if Trim(MeAno.Text) <> '' then
      QVerbaVendedorCons.SetVariable('ANO', Trim(MeAno.Text))
    else
      QVerbaVendedorCons.SetVariable('ANO', Null);

    QVerbaVendedorCons.Open;
  end;
end;

procedure TFVerbaVendedorCons.METextoExit(Sender: TObject);
begin
  inherited;
  if Trim(MeTexto.Text) <> '' then
    EdDescRepresentante.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR =' + Trim(MeTexto.Text))
  else
    EdDescRepresentante.Text := 'Todos';
end;

procedure TFVerbaVendedorCons.BtRepresentanteClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = MrOk then
    MeTexto.Text := DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
  MeTextoExit(Self);
end;

end.
