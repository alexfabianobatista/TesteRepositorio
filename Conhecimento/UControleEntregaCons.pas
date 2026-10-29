unit UControleEntregaCons;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTConsulta, UFmFilial, UFmCadastro, Menus, DB, Grids, DBGrids,
  StdCtrls, Mask, Buttons;

type
  TFControleEntregaCons = class(TFTConsulta)
    FmCadastroRemetente: TFmCadastro;
    FmCadastroDestinatario: TFmCadastro;
    FmCadastroRecebedor: TFmCadastro;
    Label11: TLabel;
    MeDtFim: TMaskEdit;
    procedure BtProcurarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FControleEntregaCons: TFControleEntregaCons;

implementation

uses UUsuario_cl, UConhecimento_cl;

{$R *.dfm}

procedure TFControleEntregaCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  with DMConhecimento do
  begin
    QControleEntregaCons.close;
    if Trim(FmCadastroRemetente.MeCadastro.Text) = '' then
      QControleEntregaCons.SetVariable('REMETENTE', Null)
    else
      QControleEntregaCons.SetVariable('REMETENTE', Trim(FmCadastroRemetente.MeCadastro.Text));
   if Trim(FmCadastroDestinatario.MeCadastro.Text) = '' then
      QControleEntregaCons.SetVariable('DESTINATARIO', Null)
    else
      QControleEntregaCons.SetVariable('DESTINATARIO', Trim(FmCadastroDestinatario.MeCadastro.Text));
   if Trim(FmCadastroRecebedor.MeCadastro.Text) = '' then
      QControleEntregaCons.SetVariable('RECEBEDOR', Null)
    else
      QControleEntregaCons.SetVariable('RECEBEDOR', Trim(FmCadastroRecebedor.MeCadastro.Text));
    if trim(MeTexto.text) = '' then
      QControleEntregaCons.SetVariable('DT_ENTREGA_INI', NULL)
    else
      QControleEntregaCons.SetVariable('DT_ENTREGA_INI', MeTexto.text);
    if trim(MeDtFim.text) = '' then
      QControleEntregaCons.SetVariable('DT_ENTREGA_FIM', NULL)
    else
      QControleEntregaCons.SetVariable('DT_ENTREGA_FIM', MeDtFim.text);
    QControleEntregaCons.open;
   end;
end;

procedure TFControleEntregaCons.FormActivate(Sender: TObject);
begin
  inherited;
  If (MeTexto.Enabled) and (MeTexto.Visible) Then
  MeTexto.SetFocus;
end;

end.
