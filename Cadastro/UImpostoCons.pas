unit UImpostoCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus, ComCtrls,
  ActnList;

type
  TFImpostoCons = class(TFTConsulta)
    ActionList1: TActionList;
    StatusBar1: TStatusBar;
    Action1: TAction;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImpostoCons: TFImpostoCons;

implementation

uses UImposto_cl, UParamSistema_cl, UImpressoraFiscal;

{$R *.DFM}

procedure TFImpostoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DMImposto.QImpostoCons.close;
  DMImposto.QImpostoCons.SetVariable('DESC_IMPOSTO', METexto.text);
  DMImposto.QImpostoCons.Open;
end;

procedure TFImpostoCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFImpostoCons.Action1Execute(Sender: TObject);
begin
  inherited;
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

end.
