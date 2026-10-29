unit USerieCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Grids, DBGrids, StdCtrls, Mask, Buttons, Db, variants, Menus,
  ComCtrls, ActnList;

type
  TFSerieCons = class(TFTConsulta)
    BtConsFilial: TBitBtn;
    StatusBar1: TStatusBar;
    procedure BtProcurarClick(Sender: TObject);
    procedure BtConsFilialClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSerieCons: TFSerieCons;

implementation

uses USerie_cl, UFilialCons, UFilial_cl, UUsuario_cl, UOracle_cl,
  UParamSistema_cl, USerieCad;

{$R *.DFM}

procedure TFSerieCons.BtProcurarClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(METexto.Text),'CONHECIMENTO');
  With DMSerie do
  Begin
    QSerieCons.Close;
    If Trim(METexto.Text) = '' then
      QSerieCons.SetVariable('FILIAL',Null)
    Else
      QSerieCons.SetVariable('FILIAL',Trim(METexto.Text));
    QSerieCons.Open;
  End;
  //FSerieCad.EdNomeUsuario.Text := DMOracle.FastSelect('NOME','TB_USUARIO','COD_USUARIO = '+  FSerieCad.DBECodUsuario.Text);
end;


procedure TFSerieCons.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    METexto.Text := DMFilial.QFilialConsCod_Filial.Text;
end;

procedure TFSerieCons.FormCreate(Sender: TObject);
begin
  inherited;
  if DSConsulta.DataSet = nil then
    DSConsulta.DataSet := DMSerie.QSerieCons;
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

end.
