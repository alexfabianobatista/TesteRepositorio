unit UTelaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Db, Menus, ComCtrls, Buttons, ExtCtrls, StdCtrls, Mask,
  DBCtrls, ImgList, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFTelaCad = class(TFTCadSimples)
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTelaCad: TFTelaCad;

implementation

uses UTela_cl, UTelaCons;

{$R *.DFM}

procedure TFTelaCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMTela.QTela.Open;
end;

procedure TFTelaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FTelaCons = Nil then
    FTelaCons := TFTelaCons.Create(Application);
  If FTelaCons.ShowModal = mrOk then
  With DMTela do
  Begin
    QTela.Close;
    QTela.SetVariable('PK',QTelaConsNome_Tela.Value);
    QTela.Open;
  End;
end;

end.
