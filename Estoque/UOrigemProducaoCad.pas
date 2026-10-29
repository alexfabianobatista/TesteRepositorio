unit UOrigemProducaoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, DBCtrls, StdCtrls, ImgList, Db, Menus, ComCtrls, Mask,
  Buttons, ExtCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFOrigemProducaoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOrigemProducaoCad: TFOrigemProducaoCad;

implementation

uses UOrigemProducao_cl, UOrigemProducaoCons;

{$R *.DFM}

procedure TFOrigemProducaoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMOrigemProducao.QOrigemProducao.Open;
end;

procedure TFOrigemProducaoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  action:=caFree;
  FOrigemProducaoCad:=nil;
end;

procedure TFOrigemProducaoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FOrigemProducaoCons = Nil then
    FOrigemProducaoCons := TFOrigemProducaoCons.Create(Application);
  If FOrigemProducaoCons.ShowModal = mrOk then
  With DMOrigemProducao do
  Begin
    QOrigemProducao.Close;
    QOrigemProducao.SetVariable('PK',QOrigemProducaoConsCod_Origem_Producao.Value);
    QOrigemProducao.Open;
  End;
end;

end.
