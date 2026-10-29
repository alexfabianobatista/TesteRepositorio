unit UProdutoAgricolaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Buttons, Grids, DBGrids, Db;

type
  TFProdutoAgricolaCons = class(TForm)
    BtOk: TBitBtn;
    BtCancela: TBitBtn;
    BtProcurar: TBitBtn;
    METexto: TMaskEdit;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DSConsulta: TDataSource;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProdutoAgricolaCons: TFProdutoAgricolaCons;

implementation

uses UProdutoAgricola_cl;

{$R *.DFM}

procedure TFProdutoAgricolaCons.DBGrid1DblClick(Sender: TObject);
begin
  Self.ModalResult := mrOk;
end;

procedure TFProdutoAgricolaCons.FormActivate(Sender: TObject);
begin
  //DSConsulta.DataSet.Close;
  //DSConsulta.DataSet.Open;
end;

procedure TFProdutoAgricolaCons.BtProcurarClick(Sender: TObject);
begin
  With DMProdutoAgricola do
  Begin
    QProdutoAgricolaCons.Close;
    QProdutoAgricolaCons.setVariable('DescProduto',Trim(MeTexto.Text));
    QProdutoAgricolaCons.Open;
  end;
end;

end.
