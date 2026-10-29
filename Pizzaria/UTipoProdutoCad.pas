unit UTipoProdutoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, ImgList, IBCustomDataSet, IBUpdateSQL, IBDatabase, DB,
  IBQuery, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  Mask, DBCtrls;

type
  TFTipoProdutoCad = class(TFPadrao)
    TBCOD_TIPO_PRODUTO: TIntegerField;
    TBDESC_TIPO_PRODUTO: TIBStringField;
    TBNUM_SABORES: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DbEFoco: TDBEdit;
    CbSabores: TCheckBox;
    TBind_sabores: TStringField;
    TBIND_TICKET_COZINHA: TIBStringField;
    TBIND_TICKET_ENTREGADOR: TIBStringField;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TGravarClick(Sender: TObject);
    procedure TIncluirClick(Sender: TObject);
    procedure TEditarClick(Sender: TObject);
    procedure TBCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTipoProdutoCad: TFTipoProdutoCad;

implementation

uses UDmTipoProduto;

{$R *.dfm}

procedure TFTipoProdutoCad.FormCreate(Sender: TObject);
begin
  inherited;
  CampoRetorno := 'COD_TIPO_PRODUTO';
end;

procedure TFTipoProdutoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if DmTipoProduto.QSelTipoProduto.Active then
  Begin
    DmTipoProduto.QSelTipoProduto.Close;
    DmTipoProduto.QSelTipoProduto.Open;
  End;
end;

procedure TFTipoProdutoCad.TGravarClick(Sender: TObject);
begin
  if TBDESC_TIPO_PRODUTO.Value = '' then
  Begin
    MessageDlg('Informe a Descrição.', mtWarning, [mbOK], 0);
    DbEFoco.SetFocus;
    Exit;
  End;

  if CbSabores.Checked then
    TBNUM_SABORES.Value := 1
  else
    TBNUM_SABORES.Value := 0;

  inherited;

end;

procedure TFTipoProdutoCad.TIncluirClick(Sender: TObject);
begin
  inherited;
  CbSabores.Checked := False;
  TBIND_TICKET_COZINHA.Value := 'S';
  TBIND_TICKET_ENTREGADOR.Value := 'S';
end;

procedure TFTipoProdutoCad.TEditarClick(Sender: TObject);
begin
  inherited;
  CbSabores.Checked := TBNUM_SABORES.Value > 0;
end;

procedure TFTipoProdutoCad.TBCalcFields(DataSet: TDataSet);
begin
  inherited;
  if TBNUM_SABORES.Value > 0 then
    TBind_sabores.Value := 'S'
  else
    TBind_sabores.Value := 'N';
end;

end.
