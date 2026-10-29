unit UProcedimentoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, StdCtrls, Buttons, DBCtrls, Grids, DBGrids, ImgList, Db,
  Menus, ComCtrls, Mask, ExtCtrls;

type
  TFProcedimentoCad = class(TFTCadSimples)
    Label2: TLabel;
    DBEdit1: TDBEdit;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label4: TLabel;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBEdit7: TDBEdit;
    DBEdit4: TDBEdit;
    BtConsCategoria: TBitBtn;
    Label1: TLabel;
    RelaoProcedimentos1: TMenuItem;
    DBEdit2: TDBEdit;
    procedure BtConsCategoriaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaoProcedimentos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProcedimentoCad: TFProcedimentoCad;

implementation

uses UProcedimento_cl, UAtividadeCons, UAtividade_cl, UProcedimentoCons,
  URProcedimento;

{$R *.DFM}

procedure TFProcedimentoCad.BtConsCategoriaClick(Sender: TObject);
begin
  inherited;
  If FAtividadeCons = Nil then
    FAtividadeCons := TFAtividadeCons.Create(Application);
  If FAtividadeCons.showModal = mrOk then
    DMProcedimento.QProcedimentoItemCod_Atividade_cab.Value := DMAtividade.QAtividadeConsCod_Atividade_cab.Value;
end;

procedure TFProcedimentoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMProcedimento.QProcedimento.Open;
  DMProcedimento.QProcedimentoItem.Open;
  FProcedimentoCad.BtConsCategoria.enabled:=false;
end;

procedure TFProcedimentoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMProcedimento.QProcedimento.Close;
  DMProcedimento.QProcedimentoItem.Close;
  DMProcedimento.QProcedimentoCons.Close;
  Action := CaFree;
  FProcedimentoCad := Nil;
end;

procedure TFProcedimentoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
   If FProcedimentoCons = Nil then
    FProcedimentoCons := TFProcedimentoCons.Create(Application);
  If FProcedimentoCons.ShowModal = mrOk then
  With DMProcedimento do
  Begin
    QProcedimento.Close;
    QProcedimento.SetVariable('PK',QProcedimentoConsCod_Procedimento_cab.Value);
    QProcedimento.Open;
  End;
end;

procedure TFProcedimentoCad.RelaoProcedimentos1Click(Sender: TObject);
begin
  inherited;
  with DMProcedimento do
  begin
    QRProcedimento.Close;
    QRProcedimento.Open;

    if FRProcedimento = Nil then
      FRProcedimento := TFRProcedimento.Create(Application);
    FRProcedimento.QRPrimario.Preview;
    QRProcedimento.Close;
  End;
end;

end.
