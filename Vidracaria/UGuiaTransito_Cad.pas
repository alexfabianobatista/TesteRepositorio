unit UGuiaTransito_Cad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, Grids, DBGrids, DBCtrls;

type
  TFGuiaTransito_Cad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBGrid1: TDBGrid;
    SbConsNota: TSpeedButton;
    DsGuiaTransitoItens: TDataSource;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    EmissoGuiaTransito1: TMenuItem;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    procedure SbConsNotaClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGuiaTransito_Cad: TFGuiaTransito_Cad;

implementation

uses UGuiaTransito_cl, UNotaSaidaCons, UNotaSaida_cl, UGuiaTransito_Cons, UNotaImpressao,
  UOracle_cl;

{$R *.dfm}

procedure TFGuiaTransito_Cad.SbConsNotaClick(Sender: TObject);
var
 x, y: array of string;
begin
  inherited;
  If FNotaSaidaCons = Nil Then
     FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  If FNotaSaidaCons.ShowModal = MrOk Then
   Begin

     setLength(x, 3); //4 sql diferentes
     setLength(y, 3);

     x[0] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+DmNotaSaida.QNotaSaidaConsCod_Cadastro.Text;
     x[1] := 'SELECT DESC_CIDADE FROM TB_CADASTRO WHERE COD_CADASTRO = '+DmNotaSaida.QNotaSaidaConsCod_Cadastro.Text;
     x[2] := 'SELECT COD_ESTADO FROM TB_CADASTRO WHERE COD_CADASTRO = '+DmNotaSaida.QNotaSaidaConsCod_Cadastro.Text;

     DMOracle.BuscaNomes(x, y);

   End;
end;

procedure TFGuiaTransito_Cad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SbConsNota.Enabled := DsPrimario.State in [DsEdit,DsInsert];
end;

end.
