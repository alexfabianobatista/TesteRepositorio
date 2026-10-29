unit UMensagemCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, Menus, ComCtrls,
  ActnList;

type
  TFMensagemCons = class(TFTConsulta)
    StatusBar1: TStatusBar;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMensagemCons: TFMensagemCons;

implementation

uses UMensagem_cl, UParamSistema_cl;

{$R *.DFM}

procedure TFMensagemCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  With DMMensagem do
  Begin
    QMensagemCons.Close;
    QMensagemCons.SetVariable('DESC_MENSAGEM',Trim(METexto.Text));
    QMensagemCons.Open;
  End;
end;

procedure TFMensagemCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

end.
