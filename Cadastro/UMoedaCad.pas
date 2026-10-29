unit UMoedaCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons, ExtCtrls,
  DBCtrls, ImgList, DBDirceu, ActnList, DBPanel, OracleNavigator, Grids,
  DBGrids, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP;

type
  TFMoedaCad = class(TFTCadSimples)
    Moeda1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    TabSheet2: TTabSheet;
    DsCotacao: TDataSource;
    DBGrid1: TDBGrid;
    DBNavigator1: TOracleNavigator;
    DBPanel3: TDBPanel;
    BtnSalvarComposicao: TBitBtn;
    DBPanel4: TDBPanel;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Moeda1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject;
      Button: TOracleNavigateBtn);
    procedure BtnSalvarComposicaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMoedaCad: TFMoedaCad;

implementation

uses UMoeda_cl, UMoedaCons, URMoeda_Moeda;

{$R *.DFM}

procedure TFMoedaCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FMoedaCons = Nil then
    FMoedaCons := TFMoedaCons.Create(Application);
  If FMoedaCons.ShowModal = mrOk then
  With DMMoeda do
  Begin
    QMoeda.Close;
    QMoeda.SetVariable('PK',QMoedaConsCod_Moeda.Value);
    QMoeda.Open;
  End;
end;

procedure TFMoedaCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMMoeda do
    QMoeda.Open;
end;

procedure TFMoedaCad.Moeda1Click(Sender: TObject);
begin
  inherited;
  DMMoeda.QRMoeda.Open;
  If FRMoeda_Moeda = Nil then
    FRMoeda_Moeda := TFRMoeda_Moeda.Create(Application);
  FRMoeda_Moeda.QRPrimario.Preview;
  DMMoeda.QRMoeda.Close;
end;

procedure TFMoedaCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(3);
end;

procedure TFMoedaCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMMoeda.QMoeda.Close;
  Action := CaFree;
  FMoedaCad := Nil;
end;

procedure TFMoedaCad.FormCreate(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePageIndex := 0;
end;

procedure TFMoedaCad.DBNavigator1Click(Sender: TObject;
  Button: TOracleNavigateBtn);
begin
  inherited;
  if Button = nbInsert then
    DBPanel3.SetFocus;
end;

procedure TFMoedaCad.BtnSalvarComposicaoClick(Sender: TObject);
begin
  inherited;
  if ValidaCampos(Self, DsCotacao) then
    DMMoeda.QCotacaoCad.Post;
end;

end.
