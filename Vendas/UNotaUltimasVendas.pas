unit UNotaUltimasVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, DB, ActnList, ComCtrls;

type
  TFNotaUltimasVendas = class(TForm)
    DSUltimasVendas: TDataSource;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Action1: TAction;
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNotaUltimasVendas: TFNotaUltimasVendas;

implementation

uses UNotaSaida_cl, UParamSistema_cl, UImpressoraFiscal;

{$R *.dfm}

procedure TFNotaUltimasVendas.FormCreate(Sender: TObject);
begin
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFNotaUltimasVendas.Action1Execute(Sender: TObject);
begin
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressorafiscal.ShowModal;
end;

end.
