unit UEquipamentoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, StdCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList, ImgList, DB, Menus,
  ComCtrls, Mask, ExtCtrls, Buttons, DBCtrls;

type
  TFEquipamentoCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBComboBox1: TDBComboBox;
    procedure FormActivate(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEquipamentoCad: TFEquipamentoCad;

implementation

uses UOrdemServico_cl, UOracle_cl, UEquipamentoFichaCons;

{$R *.dfm}

procedure TFEquipamentoCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMOrdemservico do
  Begin
    QEquipamentoFicha.Close;
    QEquipamentoFicha.SetVariable('PK',0);
    QEquipamentoFicha.Open;
  End;
end;

procedure TFEquipamentoCad.SBConfirmarClick(Sender: TObject);
begin
  inherited;
  DMOracle.DBCemapa.Commit;
end;

procedure TFEquipamentoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FEquipamentoCons = nil then
    FEquipamentoCons := TFEquipamentoCons.Create(Application);
  FEquipamentoCons.ShowModal;

  With DMOrdemServico do
  Begin
    QEquipamentoFicha.Close;
    QEquipamentoFicha.SetVariable('PK', QEquipamentoFichaConsCOD_EQUIPAMENTO_FICHA.Value);
    QEquipamentoFicha.Open;
  End;

end;

end.
