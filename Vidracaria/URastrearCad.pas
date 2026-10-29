unit URastrearCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, ActnList, Grids, DBGrids, UFmProduto,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFRastrearCad = class(TFTCadSimples)
    Label2: TLabel;
    OpenDialog1: TOpenDialog;
    MeLote: TMaskEdit;
    Label1: TLabel;
    MePeca: TMaskEdit;
    BitBtn2: TBitBtn;
    DBGrid1: TDBGrid;
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRastrearCad: TFRastrearCad;

implementation

uses UPedido_cl, UOracle_cl, UVidracaria_cl;

{$R *.dfm}

procedure TFRastrearCad.BitBtn2Click(Sender: TObject);
begin
  inherited;
  with DMVidracaria do
  Begin
    If (Trim(MePeca.Text) = '') and (Trim(MeLote.Text) = '') then
      Raise Exception.Create('Informe a Peça ou o Lote!');
    QRRastreamento.Close;
    if Trim(MePeca.Text) = '' then
      QRRastreamento.SetVariable('COD_PECA',NULL)
    Else
      QRRastreamento.SetVariable('COD_PECA',Trim(MePeca.Text));
    if Trim(MeLote.Text) = '' then
      QRRastreamento.SetVariable('COD_LOTE',NULL)
    Else
      QRRastreamento.SetVariable('COD_LOTE',Trim(MeLote.Text));
    QRRastreamento.Open;
  end;
  MeLote.Clear;
  MePeca.Clear;
end;

end.
