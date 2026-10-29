unit UGuiaTransito_Cad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, Grids, DBGrids, DBCtrls, ActnList, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

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
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit2Change(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure EmissoGuiaTransito1Click(Sender: TObject);
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
     DMGuiaTransito.QGuiaTransito_CadCod_Nota_Cab.Value := DmNotaSaida.QNotaSaidaConsCod_Nota_Cab.Value;
     DMGuiaTransito.QGuiaTransito_CadNum_Guia_Transito.Value := DmNotaSaida.QNotaSaidaConsNum_Nota.AsInteger;
     setLength(x, 3); //4 sql diferentes
     setLength(y, 3);

     x[0] := 'SELECT NOME FROM TB_CADASTRO WHERE COD_CADASTRO = '+DmNotaSaida.QNotaSaidaConsCod_Cadastro.Text;
     x[1] := 'SELECT DESC_CIDADE FROM TB_CADASTRO WHERE COD_CADASTRO = '+DmNotaSaida.QNotaSaidaConsCod_Cadastro.Text;
     x[2] := 'SELECT COD_ESTADO FROM TB_CADASTRO WHERE COD_CADASTRO = '+DmNotaSaida.QNotaSaidaConsCod_Cadastro.Text;

     DMOracle.BuscaNomes(x, y);
     DMGuiaTransito.QGuiaTransito_CadDESC_CONSIGNATARIO.Value := Y[0];
     DMGuiaTransito.QGuiaTransito_CadDESC_DESTINO.Value := Y[1] + ' - '+Y[2];
   End;
end;

procedure TFGuiaTransito_Cad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  SbConsNota.Enabled := DsPrimario.State in [DsEdit,DsInsert];
end;

procedure TFGuiaTransito_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMGuiaTransito.QGuiaTransito_Cad.Open;
  DMGuiaTransito.QGuiaTransito_Itens.Open;
end;

procedure TFGuiaTransito_Cad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMGuiaTransito.QGuiaTransito_Cad.Close;
  DMGuiaTransito.QGuiaTransito_Itens.Close;

end;

procedure TFGuiaTransito_Cad.DBEdit2Change(Sender: TObject);
begin
  inherited;
  with DMGuiaTransito do
  begin
    QGuiaTransito_Itens.Close;
    QGuiaTransito_Itens.SetVariable('Cod_Nota_Cab',DMGuiaTransito.QGuiaTransito_CadCod_Nota_Cab.Value);
    QGuiaTransito_Itens.Open;

    QGuiaTransito_Itens2.Close;
    QGuiaTransito_Itens2.SetVariable('Cod_Nota_Cab',DMGuiaTransito.QGuiaTransito_CadCod_Nota_Cab.Value);
  end;
end;

procedure TFGuiaTransito_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FGuiaTransito_Cons = Nil then
     FGuiaTransito_Cons := TFGuiaTransito_Cons.Create(Application);
  If FGuiaTransito_Cons.ShowModal = Mrok Then
   Begin
     DMGuiaTransito.QGuiaTransito_Cad.Close;
     DMGuiaTransito.QGuiaTransito_Cad.SetVariable('Pk',DMGuiaTransito.QGuiaTransito_ConsCod_Guia_Transito.Value);
     DMGuiaTransito.QGuiaTransito_Cad.Open;                           
   End;
end;

procedure TFGuiaTransito_Cad.EmissoGuiaTransito1Click(Sender: TObject);
begin
  inherited;
  If DMGuiaTransito.QGuiaTransito_CadCOD_GUIA_TRANSITO.Text = '' Then
    Raise Exception.Create('Selecionar uma guia de trânsito para imprimir')
  Else
    FNotaImpressao.EmiteGuia;

end;

end.
