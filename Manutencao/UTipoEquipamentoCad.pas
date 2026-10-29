unit UTipoEquipamentoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFTipoEquipamentoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    RelaoTipoEquipamento1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaoTipoEquipamento1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoEquipamentoCad: TFTipoEquipamentoCad;

implementation

uses UTipoEquipamento_cl, UTipoEquipamentoCons, URTipoEquipamento,
  URPatrimonio;

{$R *.DFM}

procedure TFTipoEquipamentoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMTipoEquipamento.QTipoEquipamento.Open;
end;

procedure TFTipoEquipamentoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMTipoEquipamento.QTipoEquipamento.Close;
end;

procedure TFTipoEquipamentoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FTipoEquipamentoCons = Nil then
    FTipoEquipamentoCons := TFTipoEquipamentoCons.Create(Application);
  If FTipoEquipamentoCons.ShowModal = mrOk then
  With DMTipoEquipamento do
  Begin
    QTipoEquipamento.Close;
    QTipoEquipamento.SetVariable('PK',QTipoEquipamentoConsCod_Tipo_Equipamento.Value);
    QTipoEquipamento.Open;
  End;

end;

procedure TFTipoEquipamentoCad.RelaoTipoEquipamento1Click(Sender: TObject);
begin
  inherited;
  with DMTipoEquipamento do
  begin
    QRTipoEquipamento.Close;
    QRTipoEquipamento.Open;

    If FRTipoEquipamento = Nil then
      FRTipoEquipamento := TFRTipoEquipamento.Create(Application);
    FRTipoEquipamento.QRPrimario.Preview;
    QRTipoEquipamento.Close;
  End;
end;

end.
