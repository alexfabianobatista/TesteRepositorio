unit USaborCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, ImgList, IBCustomDataSet, IBUpdateSQL, IBDatabase, DB,
  IBQuery, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  Mask, DBCtrls;

type
  TFSaborCad = class(TFPadrao)
    TBCOD_SABOR: TIntegerField;
    TBDESC_SABOR: TIBStringField;
    TBVLR_INTEGRAL: TFloatField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DbEFoco: TDBEdit;
    TBCOD_TIPO_PRODUTO: TIntegerField;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSaborCad: TFSaborCad;

implementation

uses UDmSabor, UDmTipoProduto, UTipoProdutoCad, UFuncoes;

{$R *.dfm}

procedure TFSaborCad.FormCreate(Sender: TObject);
begin
  inherited;
  CampoRetorno := 'COD_SABOR';
end;

procedure TFSaborCad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if DmSabor.QSelSabor.Active then
  Begin
    DmSabor.QSelSabor.Close;
    DmSabor.QSelSabor.Open;
  End;
end;

procedure TFSaborCad.TGravarClick(Sender: TObject);
begin
  if TBDESC_SABOR.Value = '' then
  Begin
    MessageDlg('Informe a Descrição.', mtWarning, [mbOK], 0);
    DbEFoco.SetFocus;
    Exit;
  End;

  inherited;

end;

procedure TFSaborCad.FormShow(Sender: TObject);
begin
  inherited;
  DmTipoProduto.QSelTipoProduto.Close;
  DmTipoProduto.QSelTipoProduto.Open;
end;

procedure TFSaborCad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFTipoProdutoCad, FTipoProdutoCad);
  FTipoProdutoCad.Consultando := True;
  FTipoProdutoCad.ShowModal;

  if RetornoConsulta > -1 then
    TBCOD_TIPO_PRODUTO.Value := RetornoConsulta
  else
    TBCOD_TIPO_PRODUTO.Clear;
end;

end.
