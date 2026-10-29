unit UPedidoBaixaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, StdCtrls, Buttons, DBCtrls, ImgList, Db, Menus, ComCtrls,
  Mask, ExtCtrls;

type
  TFPedidoBaixaCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    BtPedidoCons: TBitBtn;
    BitBtn1: TBitBtn;
    procedure SBHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPedidoBaixaCad: TFPedidoBaixaCad;

implementation

uses UPedido_cl, UPedidoConsItem, UNotaConsultaItem, UNotaSaida_cl,
  UPedidoBaixaCons;

{$R *.DFM}

procedure TFPedidoBaixaCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext (4);
end;

end.
