unit UMarketplaceDetalhes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ClipBrd;

type
  TFMarketplaceDetalhes = class(TForm)
    Panel1: TPanel;
    memoDetalhes: TMemo;
    lbPedido: TLabel;
    lbMarketplace: TLabel;
    BitBtn1: TBitBtn;
    btnCopiar: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnCopiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMarketplaceDetalhes: TFMarketplaceDetalhes;

implementation

{$R *.dfm}

procedure TFMarketplaceDetalhes.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TFMarketplaceDetalhes.btnCopiarClick(Sender: TObject);
begin
  memoDetalhes.SelectAll;
  memoDetalhes.CopyToClipboard;
  SetFocus;
end;

end.
