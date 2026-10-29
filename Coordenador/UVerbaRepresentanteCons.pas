unit UVerbaRepresentanteCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons;

type
  TFVerbaRepresentanteCons = class(TFTConsulta)
    BtRepresentante: TBitBtn;
    EdDescRepresentante: TEdit;
    MeAno: TMaskEdit;
    MeMes: TMaskEdit;
    Label2: TLabel;
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
  FVerbaRepresentanteCons: TFVerbaRepresentanteCons;

implementation

uses UVerbaRepresentante_cl, UOracle_cl, UVendedorCons, UVendedor_cl;

{$R *.dfm}

procedure TFVerbaRepresentanteCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMVerbaRepresentante do
  begin
    DMVerbaRepresentante.QVerbaRepresentanteCons.Close;

    if Trim(MeTexto.Text) <> '' then
      QVerbaRepresentanteCons.SetVariable('REPRESENTANTE', Trim(MeTexto.Text))
    else
      QVerbaRepresentanteCons.SetVariable('REPRESENTANTE', Null);

    if Trim(MeMes.Text) <> '' then
      QVerbaRepresentanteCons.SetVariable('MES', Trim(MeMes.Text))
    else
      QVerbaRepresentanteCons.SetVariable('MES', Null);

    if Trim(MeAno.Text) <> '' then
      QVerbaRepresentanteCons.SetVariable('ANO', Trim(MeAno.Text))
    else
      QVerbaRepresentanteCons.SetVariable('ANO', Null);


    DMVerbaRepresentante.QVerbaRepresentanteCons.Open;
  end;
end;

procedure TFVerbaRepresentanteCons.METextoExit(Sender: TObject);
begin
  inherited;
  if Trim(MeTexto.Text) <> '' then
    EdDescRepresentante.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR','COD_VENDEDOR =' + Trim(MeTexto.Text))
  else
    EdDescRepresentante.Text := 'Todos';
end;

procedure TFVerbaRepresentanteCons.BtRepresentanteClick(Sender: TObject);
begin
  inherited;
  if FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  if FVendedorCons.ShowModal = MrOk then
    MeTexto.Text := DMVendedor.QVendedorConsCOD_VENDEDOR.Text;
  MeTextoExit(Self);
end;

end.
