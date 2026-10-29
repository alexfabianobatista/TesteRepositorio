unit UComissaoClasse_Cons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFComissaoClasse_Cons = class(TFTConsulta)
    BtVendedor: TSpeedButton;
    procedure BtVendedorClick(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FComissaoClasse_Cons: TFComissaoClasse_Cons;

implementation

uses UVendedorCons, UComissaoClasse_cl, UVendedor_cl;

{$R *.DFM}

procedure TFComissaoClasse_Cons.BtVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    MeTexto.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;

end;

procedure TFComissaoClasse_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMComissaoClasse Do
  Begin
    QComissaoClasseCons.Close;
    If Trim(MeTexto.Text) <> '' Then
       QComissaoClasseCons.SetVariable('COD_VENDEDOR',Trim(MeTexto.Text))
    Else
       QComissaoClasseCons.SetVariable('COD_VENDEDOR',Null);
    QComissaoClasseCons.Open;   
  End;
end;

end.
