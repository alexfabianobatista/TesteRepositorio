unit UMensagemPocket_Cons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, variants;

type
  TFMensagemPocket_Cons = class(TFTConsulta)
    BitBtn1: TBitBtn;
    EdVendedor: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure METextoExit(Sender: TObject);
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMensagemPocket_Cons: TFMensagemPocket_Cons;

implementation

uses UVendedorCons, UOracle_cl, UMensagemPocket_cl, UVendedor_cl;

{$R *.DFM}

procedure TFMensagemPocket_Cons.BitBtn1Click(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.Create(Application);
  If FVendedorCons.ShowModal = mrOk then
    MeTexto.Text := DMVendedor.QVendedorConsCod_Vendedor.Text;

end;

procedure TFMensagemPocket_Cons.METextoExit(Sender: TObject);
begin
  inherited;
  If Trim(MeTexto.Text) <> '' Then
     Edvendedor.Text := DMOracle.BuscaNome('SELECT NOME FROM TB_VENDEDOR',
                                                   'COD_VENDEDOR = '+Trim(MeTexto.Text));

end;

procedure TFMensagemPocket_Cons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMMensagemPocket do
  Begin
    QMensagemPocket_Cons.Close;
    If Trim(MeTexto.Text) <> '' Then
       QMensagemPocket_Cons.SetVariable('Cod_Vendedor',Trim(MeTexto.Text))
    Else
       QMensagemPocket_Cons.SetVariable('Cod_Vendedor',Null);
    QMensagemPocket_Cons.Open;
  End;
end;

procedure TFMensagemPocket_Cons.FormCreate(Sender: TObject);
begin
  inherited;
  if DSConsulta.DataSet = nil then
    DSConsulta.DataSet := DMMensagemPocket.QMensagemPocket_Cons;
end;

end.
