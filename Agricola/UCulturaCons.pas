unit UCulturaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus, ActnList,
  ComCtrls;

type
  TFCulturaCons = class(TFTConsulta)
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
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
  FCulturaCons: TFCulturaCons;

implementation

uses UCultura_cl, UParamSistema_cl, UImpressoraFiscal;

{$R *.DFM}

procedure TFCulturaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DmCultura do
  Begin
       QCulturaCons.Close;
       QCulturaCons.Open;
  end;

end;

procedure TFCulturaCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFCulturaCons.Action1Execute(Sender: TObject);
begin
  inherited;
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

end.
