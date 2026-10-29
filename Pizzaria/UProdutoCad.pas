unit UProdutoCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, ImgList, IBCustomDataSet, IBUpdateSQL, IBDatabase, DB,
  IBQuery, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls, ToolWin,
  Mask, DBCtrls;

type
  TFProdutoCad = class(TFPadrao)
    TBCOD_PRODUTO: TIntegerField;
    TBDESC_PRODUTO: TIBStringField;
    TBVLR_VENDA: TFloatField;
    TBCOD_TIPO_PRODUTO: TIntegerField;
    Label5: TLabel;
    SpeedButton1: TSpeedButton;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit6: TDBEdit;
    TBdesc_tipo_produto: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DbEFoco: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    DbGItensProd: TDBGrid;
    DbGItensTipo: TDBGrid;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    TBQT_QUANTIDADE_PADRAO: TFloatField;
    DBRadioGroup1: TDBRadioGroup;
    TBIND_TIPO_TAXA_ENTREGA: TIBStringField;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TBCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure TGravarClick(Sender: TObject);
    procedure TIncluirClick(Sender: TObject);
    procedure TEditarClick(Sender: TObject);
    procedure DbGItensProdEditButtonClick(Sender: TObject);
    procedure DbGItensTipoEditButtonClick(Sender: TObject);
  private
    { Private declarations }
    FazerInsertEdit: Boolean;
  public
    { Public declarations }
  end;

var
  FProdutoCad: TFProdutoCad;

implementation

uses UTipoProdutoCad, UDmSistema, UFuncoes, UDmTipoProduto, UDmProduto;

{$R *.dfm}

procedure TFProdutoCad.SpeedButton1Click(Sender: TObject);
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

procedure TFProdutoCad.FormCreate(Sender: TObject);
begin
  inherited;
  CampoRetorno := 'COD_PRODUTO';
end;

procedure TFProdutoCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if DmProduto.QSelProduto.Active then
  Begin
    DmProduto.QSelProduto.Close;
    DmProduto.QSelProduto.Open;
  End;
end;

procedure TFProdutoCad.TBCalcFields(DataSet: TDataSet);
begin
  inherited;
  TBdesc_tipo_produto.Value := BuscaString('DESC_TIPO_PRODUTO', 'TB_TIPO_PRODUTO', 'COD_TIPO_PRODUTO', TBCOD_TIPO_PRODUTO.Value);
end;

procedure TFProdutoCad.FormShow(Sender: TObject);
begin
  inherited;
  DmTipoProduto.QSelTipoProduto.Close;
  DmTipoProduto.QSelTipoProduto.Open;

  FazerInsertEdit := True;
end;

procedure TFProdutoCad.TGravarClick(Sender: TObject);
begin
  if TBVLR_VENDA.IsNull then
    TBVLR_VENDA.Value := 0;

  if TBDESC_PRODUTO.Value = '' then
  Begin
    MessageDlg('Informe a Descrição.', mtWarning, [mbOK], 0);
    DbEFoco.SetFocus;
    Exit;
  End;

  if TBQT_QUANTIDADE_PADRAO.IsNull then
  Begin
    MessageDlg('Informe a Quantidade Padrão.', mtWarning, [mbOK], 0);
    DBEdit2.SetFocus;
    Exit;
  End;

  if DmProduto.CdProduto.IsEmpty then
  Begin
    DmProduto.CdProduto.Filtered := False;
    DmProduto.CdProduto.Filter := 'COD_PRODUTO = COD_PRODUTO_ITEM';
    DmProduto.CdProduto.Filtered := True;
    if DmProduto.CdProduto.IsEmpty then
    Begin
      DmProduto.CdProduto.Append;
      DmProduto.CdProdutoCOD_PRODUTO.Value := TBCOD_PRODUTO.Value;
      DmProduto.CdProdutoCOD_ITEM.Value := 1;
      DmProduto.CdProdutoCOD_PRODUTO_ITEM.Value := TBCOD_PRODUTO.Value;
      DmProduto.CdProdutoCOD_TIPO_PRODUTO_ITEM.Clear;
      DmProduto.CdProduto.Post;
    End;
  End
  Else
  Begin
    DmProduto.CdProduto.Filtered := False;
    DmProduto.CdProduto.Filter := 'COD_PRODUTO = COD_PRODUTO_ITEM';
    DmProduto.CdProduto.Filtered := True;
    if not DmProduto.CdProduto.IsEmpty then
      DmProduto.CdProduto.Delete;
  End;

  FazerInsertEdit := False;
  inherited;
  FazerInsertEdit := True;

  DmSistema.TSistema.CommitRetaining;
  DmProduto.CdProduto.ApplyUpdates(-1);
  DmProduto.CdTipo.ApplyUpdates(-1);
  DmSistema.TSistema.CommitRetaining;

  DmProduto.CdProduto.Close;
  DmProduto.QProduto.ParamByName('COD_PRODUTO').AsInteger := TBCOD_PRODUTO.Value;
  DmProduto.CdProduto.Open;
  DmProduto.CdProduto.Filtered := False;
  DmProduto.CdProduto.Filter := 'COD_PRODUTO <> COD_PRODUTO_ITEM';
  DmProduto.CdProduto.Filtered := True;

  DmProduto.CdTipo.Close;
  DmProduto.QTipo.ParamByName('COD_PRODUTO').AsInteger := TBCOD_PRODUTO.Value;
  DmProduto.CdTipo.Open;
end;

procedure TFProdutoCad.TIncluirClick(Sender: TObject);
begin
  inherited;

  if FazerInsertEdit then
  Begin
    DmProduto.CdProduto.Close;
    DmProduto.QProduto.ParamByName('COD_PRODUTO').AsInteger := TBCOD_PRODUTO.Value;
    DmProduto.CdProduto.Open;
    DmProduto.CdProduto.Filtered := False;
    DmProduto.CdProduto.Filter := 'COD_PRODUTO <> COD_PRODUTO_ITEM';
    DmProduto.CdProduto.Filtered := True;

    DmProduto.CdTipo.Close;
    DmProduto.QTipo.ParamByName('COD_PRODUTO').AsInteger := TBCOD_PRODUTO.Value;
    DmProduto.CdTipo.Open;

    TBQT_QUANTIDADE_PADRAO.Value := 1;
    TBIND_TIPO_TAXA_ENTREGA.Value := '2';
  End;

  PageControl1.ActivePageIndex := 0;
end;

procedure TFProdutoCad.TEditarClick(Sender: TObject);
begin
  inherited;

  if FazerInsertEdit then
  Begin
    DmProduto.CdProduto.Close;
    DmProduto.QProduto.ParamByName('COD_PRODUTO').AsInteger := TBCOD_PRODUTO.Value;
    DmProduto.CdProduto.Open;
    DmProduto.CdProduto.Filtered := False;
    DmProduto.CdProduto.Filter := 'COD_PRODUTO <> COD_PRODUTO_ITEM';
    DmProduto.CdProduto.Filtered := True;

    DmProduto.CdTipo.Close;
    DmProduto.QTipo.ParamByName('COD_PRODUTO').AsInteger := TBCOD_PRODUTO.Value;
    DmProduto.CdTipo.Open;
  End;

  PageControl1.ActivePageIndex := 0;
end;

procedure TFProdutoCad.DbGItensProdEditButtonClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFProdutoCad, FProdutoCad);
  FProdutoCad.Consultando := True;
  FProdutoCad.ShowModal;

  if not (DmProduto.CdProduto.State in [dsInsert, dsEdit]) then
    try
      DmProduto.CdProduto.Edit;
    except
      DmProduto.CdProduto.Append;
    end;
  if RetornoConsulta > -1 then
    DmProduto.CdProdutoCOD_PRODUTO_ITEM.Value := RetornoConsulta
  else
    DmProduto.CdProdutoCOD_PRODUTO_ITEM.Clear;
end;

procedure TFProdutoCad.DbGItensTipoEditButtonClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFTipoProdutoCad, FTipoProdutoCad);
  FTipoProdutoCad.Consultando := True;
  FTipoProdutoCad.ShowModal;

  if not (DmProduto.CdTipo.State in [dsInsert, dsEdit]) then
    try
      DmProduto.CdTipo.Edit;
    except
      DmProduto.CdTipo.Append;
    end;
  if RetornoConsulta > -1 then
    DmProduto.CdTipoCOD_TIPO_PRODUTO_ITEM.Value := RetornoConsulta
  else
    DmProduto.CdTipoCOD_TIPO_PRODUTO_ITEM.Clear;
end;

end.
