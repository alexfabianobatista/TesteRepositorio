unit UFuncaoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, Grids, DBGrids, ImgList, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFFuncaoCad = class(TFTCadSimples)
    DBGrid1: TDBGrid;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label2: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFuncaoCad: TFFuncaoCad;

implementation

uses UFuncao_cl;

{$R *.DFM}

procedure TFFuncaoCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMFuncao do
  Begin
    QModulo.Open;
    QTela.Open;
    QFuncao.Open;
  End;
  MELocaliza.Visible := False;
  SBConsulta.Visible := False;
end;


end.
