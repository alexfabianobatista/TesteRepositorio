unit UTipoConhecimentoCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, DB, Grids, DBGrids, StdCtrls, Mask, Buttons, Menus,
  ActnList, ComCtrls;

type
  TFTipoConhecimentoCons = class(TFTConsulta)
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
  FTipoConhecimentoCons: TFTipoConhecimentoCons;

implementation

uses UNotaSaida_cl, UParamSistema_cl, UImpressoraFiscal;

{$R *.dfm}

procedure TFTipoConhecimentoCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMNotaSaida do
  Begin
     QTipoConhecimentoCons.close;
     if MEtexto.text = '' then
        QTipoConhecimentoCons.setvariable('DESC_TIPO_CONHECIMENTO',Null)
     else
        QTipoConhecimentoCons.setvariable('DESC_TIPO_CONHECIMENTO',MEtexto.text);
     QTipoConhecimentoCons.open;
  end;
end;

procedure TFTipoConhecimentoCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFTipoConhecimentoCons.Action1Execute(Sender: TObject);
begin
  inherited;
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

end.
