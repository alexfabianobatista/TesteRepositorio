unit UFormaRecebimentoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, DBPanel, ActnList, ImgList, DB, Menus, ComCtrls,
  StdCtrls, Mask, Buttons, ExtCtrls, DBCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFFormaRecebimentoCad = class(TFTCadSimples)
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBCheckBox1: TDBCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFormaRecebimentoCad: TFFormaRecebimentoCad;

implementation

uses UFormaRecebimento_cl, UFormaRecebimentoCons;

{$R *.dfm}

procedure TFFormaRecebimentoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DmFormaRecebimento.QFormaRecebimento.Open;
end;

procedure TFFormaRecebimentoCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet = nil then
    DSPrimario.dataset := DmFormaRecebimento.QFormaRecebimento;
end;

procedure TFFormaRecebimentoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FFormaRecebimentoCons = nil then
    FFormaRecebimentoCons := TFFormaRecebimentoCons.Create(Application);
  if FFormaRecebimentoCons.Showmodal = mrOk then
    DmFormaRecebimento.QFormaRecebimento.Close;
  DmFormaRecebimento.QFormaRecebimento.SetVariable('PK', DmFormaRecebimento.QFormaRecebimentoConsCOD_FORMA_RECEBIMENTO.Value);
  DmFormaRecebimento.QFormaRecebimento.Open;
end;

end.
