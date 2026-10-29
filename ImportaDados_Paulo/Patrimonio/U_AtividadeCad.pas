unit U_AtividadeCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids;

type
  TFAtividadeCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBEdit7: TDBEdit;
    DBEdit4: TDBEdit;
    BTCategoriaCons: TBitBtn;
    Label7: TLabel;
    Label4: TLabel;
    RelaoAtividades1: TMenuItem;
    DBEdit2: TDBEdit;
    procedure BTCategoriaConsClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaoAtividades1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAtividadeCad: TFAtividadeCad;

implementation

uses UAtividade_cl, UCategoriaCons, UCategoriaProfissional_cl,
  UAtividadeCons, URAtividade;

{$R *.DFM}

procedure TFAtividadeCad.BTCategoriaConsClick(Sender: TObject);
begin
  inherited;
  If FCategoriaCons = Nil then
    FCategoriaCons := TFCategoriaCons.Create(Application);
  If FCategoriaCons.showModal = mrOk then
  begin
    DMAtividade.QAtividadeItemCod_Categoria.Value := DMCategoriaProfissional.QCategoriaConsCod_Categoria.Value;
  end;
end;

procedure TFAtividadeCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMAtividade.QAtividade.Open;
  DMAtividade.QAtividadeItem.close;
  DMAtividade.QAtividadeItem.Open;
end;

procedure TFAtividadeCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMAtividade.QAtividade.Close;
  DMAtividade.QAtividadeItem.Close;
  DMAtividade.QAtividadeCons.Close;
  Action := CaFree;
  FAtividadeCad := Nil;
end;

procedure TFAtividadeCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
   If FAtividadeCons = Nil then
    FAtividadeCons := TFAtividadeCons.Create(Application);
  If FAtividadeCons.ShowModal = mrOk then
  With DMAtividade do
  Begin
    QAtividade.Close;
    QAtividade.SetVariable('PK',QAtividadeConsCod_Atividade_cab.Value);
    QAtividade.Open;
  End;
end;

procedure TFAtividadeCad.RelaoAtividades1Click(Sender: TObject);
begin
  inherited;
  with DMAtividade do
  begin
    QRAtividade.Close;
    QRAtividade.Open;

    if FRAtividade = Nil then
      FRAtividade := TFRAtividade.Create(Application);
    FRAtividade.QRPrimario.Preview;
    QRAtividade.Close;
  End;
end;

end.
