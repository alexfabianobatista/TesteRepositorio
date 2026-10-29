unit UVenda_Nova;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, Mask, StdCtrls, Buttons, ExtCtrls,
  ImgList, TeEngine, Series, TeeProcs, Chart, DbChart, ToolEdit, CurrEdit;

type
  TFVenda_Nova = class(TForm)
    PnFundo: TPanel;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    EObs: TEdit;
    BtnLimpar: TBitBtn;
    MeTelefone: TMaskEdit;
    ECliente: TEdit;
    PcItens: TPageControl;
    TabSheet1: TTabSheet;
    DbGDados: TDBGrid;
    BtnCancelar: TBitBtn;
    BtnGravar: TBitBtn;
    ImageList1: TImageList;
    GbManutencao: TGroupBox;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MeCodProduto: TMaskEdit;
    EProduto: TEdit;
    CeQtde: TCurrencyEdit;
    CePreco: TCurrencyEdit;
    CeTotal: TCurrencyEdit;
    BtnCancelarItem: TBitBtn;
    BtnGravarItem: TBitBtn;
    GbItens: TGroupBox;
    DBGrid1: TDBGrid;
    MeCodCliente: TMaskEdit;
    Label7: TLabel;
    CeTotalGeral: TCurrencyEdit;
    Label8: TLabel;
    CeTaxa: TCurrencyEdit;
    Label9: TLabel;
    CeQtdTaxa: TCurrencyEdit;
    Label10: TLabel;
    CeTaxaTotal: TCurrencyEdit;
    PnSabores: TPanel;
    DbGSabores: TDBGrid;
    PcSabores: TPageControl;
    procedure FormShow(Sender: TObject);
    procedure DbGDadosCellClick(Column: TColumn);
    procedure DbGDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DbGDadosDblClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GbManutencaoExit(Sender: TObject);
    procedure DbGSaboresCellClick(Column: TColumn);
    procedure DbGSaboresDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DbGSaboresKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnGravarItemClick(Sender: TObject);
    procedure BtnCancelarItemClick(Sender: TObject);
    procedure DbGDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CePrecoExit(Sender: TObject);
    procedure CeQtdeExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnGravarClick(Sender: TObject);
    procedure MeTelefoneEnter(Sender: TObject);
    procedure MeTelefoneExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MeCodClienteChange(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure MeTelefoneChange(Sender: TObject);
    procedure CeTaxaChange(Sender: TObject);
    procedure CeQtdTaxaChange(Sender: TObject);
    procedure CeTaxaTotalChange(Sender: TObject);
    procedure CeTotalGeralChange(Sender: TObject);
    procedure PcSaboresChange(Sender: TObject);
  private
    QtdMaxSabores: Integer;
    Gravando: Boolean;
    TotalProd: Currency;
    procedure AlteraTamanho;
    procedure CalculaTaxa;
    procedure CalculaTabs(Limpa: Boolean = False);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVenda_Nova: TFVenda_Nova;

implementation

uses UDmVenda_Nova, DB, UDmProduto, UFuncoes, UProdutoCad, UDmSistema,
  UDmCliente, UClienteCadRapido, UClienteCad, UDmParamSistema, Math;

{$R *.dfm}

procedure TFVenda_Nova.AlteraTamanho;
Begin
  GbManutencao.Height := 160;

  if GbItens.Visible then
    GbManutencao.Height := GbManutencao.Height + GbItens.Height + 22;

  if PnSabores.Visible then
  Begin
    GbManutencao.Height := GbManutencao.Height + PnSabores.Height;
    GbItens.Top := 304;
  End
  Else
    GbItens.Top := 104;

  GbManutencao.Top := trunc(ClientHeight / 2) - trunc(GbManutencao.Height / 2);
  GbManutencao.Left := trunc(ClientWidth / 2) - trunc(GbManutencao.Width / 2);

  BtnCancelarItem.Top := GbManutencao.Height - BtnCancelarItem.Height - 17;
  BtnGravarItem.Top := GbManutencao.Height - BtnGravarItem.Height - 17;
End;

procedure TFVenda_Nova.FormShow(Sender: TObject);
var seq: Integer;
begin
  DmVenda_Nova.cdProdutosVenda.Close;
  DmVenda_Nova.cdProdutosVenda.Open;
  DmVenda_Nova.CdSabor.Close;
  DmVenda_Nova.CdSabor.Open;
  DmVenda_Nova.CdSelSabor.Close;
  DmVenda_Nova.CdSelSabor.Open;

  MeTelefone.Text := '(45) ';
  CeTotalGeral.Value := 0;
  TotalProd := 0;

  AlteraTamanho;

  GbManutencao.BringToFront;

  DbGDados.SetFocus;
  DbGDados.SelectedIndex := 0;

  seq := 1;
  DmVenda_Nova.cdProdutosVenda.First;
  while not DmVenda_Nova.cdProdutosVenda.Eof do
  Begin
    DmVenda_Nova.cdProdutosVenda.Edit;
    DmVenda_Nova.CdProdutosVendaCOD_VENDA_ITEM.Value := seq;
    DmVenda_Nova.cdProdutosVenda.Post;

    Inc(seq);

    DmVenda_Nova.cdProdutosVenda.Next;
  End;

  DmVenda_Nova.cdProdutosVenda.First;

  CeTaxa.Value := DmParamSistema.QParamSistemaVAL_TAXA_ENTREGA.Value;
  CeQtde.Value := 0;
  CeTaxaTotal.Value := 0;
end;

procedure TFVenda_Nova.DbGDadosCellClick(Column: TColumn);
begin
  if Column.Title.Caption = 'X' then
  Begin
    if DmVenda_Nova.CdProdutosVendaMARCADO.Value = 'S' then
    Begin
      TotalProd := TotalProd - DmVenda_Nova.CdProdutosVendaval_total_digitado.Value;
    End;

    DmVenda_Nova.CdProdutosVenda.Edit;
    DmVenda_Nova.CdProdutosVendaMARCADO.Value := 'N';
    DmVenda_Nova.CdProdutosVenda.Post;

    CalculaTaxa;
    CeTotalGeral.Value := TotalProd + CeTaxaTotal.Value;
  End;
end;

procedure TFVenda_Nova.DbGDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Column.Title.Caption = 'X') then
  begin DbGDados.Canvas.FillRect(Rect);
    if DmVenda_Nova.CdProdutosVendaMARCADO.Value = 'S' then
      ImageList1.Draw(DbGDados.Canvas, Rect.Left + 5, Rect.Top + 1, 1)
     else
      ImageList1.Draw(DbGDados.Canvas, Rect.Left + 5, Rect.Top + 1, 0);
    end;
end;

procedure TFVenda_Nova.DbGDadosDblClick(Sender: TObject);
var i: Integer;
begin
  if DbGDados.Columns[DbGDados.SelectedIndex].Title.Caption = 'X' then Exit;

  Gravando := False;

  GbManutencao.Visible := True;
  BtnGravarItem.SetFocus;
  MeCodProduto.Text := IntToStr(DmVenda_Nova.CdProdutosVendaCOD_PRODUTO.Value);
  EProduto.Text := DmVenda_Nova.CdProdutosVendaDESC_PRODUTO.Value;

  DmProduto.QQtdSabores.Close;
  DmProduto.QQtdSabores.ParamByName('COD_PRODUTO').AsInteger := StrToInt(Trim(MeCodProduto.Text));
  DmProduto.QQtdSabores.Open;

  DmVenda_Nova.CdProdutosVenda.Edit;

  CeQtde.Value := DmVenda_Nova.CdProdutosVendaQT_QUANTIDADE_DIGITADO.Value;
  CePreco.Value := DmVenda_Nova.CdProdutosVendaVAL_PRECO_DIGITADO.Value;
  CeTotal.Value := CeQtde.Value * CePreco.Value;

  DmVenda_Nova.CdProdutoItens.Close;
  DmVenda_Nova.QProdutoItens.ParamByName('COD_PRODUTO').AsInteger := StrToInt(Trim(MeCodProduto.Text));
  DmVenda_Nova.CdProdutoItens.Open;

  GbItens.Visible := True;
  if ((DmVenda_Nova.CdProdutoItens.IsEmpty) or (DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value = DmVenda_Nova.CdProdutosVendaCOD_PRODUTO.Value)) then
  Begin
    DmVenda_Nova.CdProdutoItens.Append;
    DmVenda_Nova.CdProdutoItensCOD_PRODUTO_ITEM.Value := StrToInt(Trim(MeCodProduto.Text));
    DmVenda_Nova.CdProdutoItensCOD_TIPO_PRODUTO_ITEM.Clear;
    DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value := StrToInt(Trim(MeCodProduto.Text));
    DmVenda_Nova.CdProdutoItensCLASSE_SELECIONADO.Value := 'PRODUTO';
    DmVenda_Nova.CdProdutoItensDESC_PRODUTO.Value := BuscaString('DESC_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO', StrToInt(MeCodProduto.Text));
    DmVenda_Nova.CdProdutoItensDESC_TIPO_PRODUTO.Clear;
    DmVenda_Nova.CdProdutoItensDESC_SELECIONADO.Value := BuscaString('DESC_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO', StrToInt(MeCodProduto.Text));
    DmVenda_Nova.CdProdutoItensCOD_TIPO_PRODUTO.Value := BuscaInteger('COD_TIPO_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO', StrToInt(MeCodProduto.Text));
    DmVenda_Nova.CdProdutoItens.Post;

    GbItens.Visible := False;
  End;

  DmVenda_Nova.CdProdutoItens.First;

  if Trim(DmVenda_Nova.CdProdutoItensCLASSE_SELECIONADO.Value) = 'PRODUTO' then
  Begin
    MeCodProduto.ReadOnly := True;
    MeCodProduto.Color := clBtnFace;
    SpeedButton1.Enabled := False;

    DmProduto.QQtdSabores.Close;
    DmProduto.QQtdSabores.ParamByName('COD_PRODUTO').AsInteger := DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value;
    DmProduto.QQtdSabores.Open;

    DmVenda_Nova.CdSabor.Filtered := False;
    DmVenda_Nova.CdSabor.Filter := 'COD_VENDA_ITEM = ' + IntToStr(DmVenda_Nova.CdProdutosVendaCOD_VENDA_ITEM.Value);
    DmVenda_Nova.CdSabor.Filtered := True;
    DmVenda_Nova.CdSabor.First;

    DmVenda_Nova.CdBackup.Close;
    DmVenda_Nova.CdBackup.Open;
    while not DmVenda_Nova.CdSabor.Eof do
    Begin
      DmVenda_Nova.CdBackup.Append;
      DmVenda_Nova.CdBackupCOD_VENDA.Value := DmVenda_Nova.CdSaborCOD_VENDA.Value;
      DmVenda_Nova.CdBackupCOD_VENDA_ITEM.Value := DmVenda_Nova.CdSaborCOD_VENDA_ITEM.Value;
      DmVenda_Nova.CdBackupCOD_PRODUTO.Value := DmVenda_Nova.CdSaborCOD_PRODUTO.Value;
      DmVenda_Nova.CdBackupCOD_ITEM.Value := DmVenda_Nova.CdSaborCOD_ITEM.Value;
      DmVenda_Nova.CdBackupCOD_SABOR.Value := DmVenda_Nova.CdSaborCOD_SABOR.Value;
      DmVenda_Nova.CdBackupQT_QUANTIDADE.Value := DmVenda_Nova.CdSaborQT_QUANTIDADE.Value;
      DmVenda_Nova.CdBackupINDICE.Value := DmVenda_Nova.CdSaborINDICE.Value;
      DmVenda_Nova.CdBackup.Post;

      DmVenda_Nova.CdSabor.Next;
    End;

    DmVenda_Nova.CdSelSabor.Close;
    DmVenda_Nova.QSelSabor.ParamByName('COD_TIPO_PRODUTO').AsInteger := DmVenda_Nova.CdProdutoItensCOD_TIPO_PRODUTO_ITEM.Value;
    DmVenda_Nova.CdSelSabor.Open;

    if (DmProduto.QQtdSaboresNUM_SABORES.IsNull) or (DmProduto.QQtdSaboresNUM_SABORES.Value <= 0) then
    Begin
      PnSabores.Visible := False;

      DmVenda_Nova.CdSabor.Filtered := False;
      DmVenda_Nova.CdSabor.Filter := '(COD_VENDA_ITEM = ' + IntToStr(DmVenda_Nova.CdProdutosVendaCOD_VENDA_ITEM.Value) + ' and COD_PRODUTO = ' + IntToStr(DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value) + ' and COD_ITEM = 1)';
      DmVenda_Nova.CdSabor.Filtered := True;
    End
    else
    Begin
      PnSabores.Visible := True;

      QtdMaxSabores := DmProduto.QQtdSaboresNUM_SABORES.Value;

      DmVenda_Nova.CdSabor.Filtered := False;
      DmVenda_Nova.CdSabor.Filter := '(COD_VENDA_ITEM = ' + IntToStr(DmVenda_Nova.CdProdutosVendaCOD_VENDA_ITEM.Value) + ' and COD_PRODUTO = ' + IntToStr(DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value) + ' and COD_ITEM = 1 and INDICE = 1)';
      DmVenda_Nova.CdSabor.Filtered := True;
      DmVenda_Nova.CdSabor.First;

      CalculaTabs(True);
      PcSaboresChange(Self);

//      for i := 0 to CeQtde.AsInteger - 1 do
//        with TTabSheet.Create(Self) do
//        begin
//          PageControl := GbSabores;
//          TabVisible := True;
//          Caption := 'Pizza ' + IntToStr(i + 1);
//
//          DmVenda_Nova.CdSelSabor.Close;
//          DmVenda_Nova.CdSelSabor.Open;
//          while not DmVenda_Nova.CdSabor.Eof do
//          Begin
//            if DmVenda_Nova.CdSelSabor.Locate('COD_SABOR', DmVenda_Nova.CdSaborCOD_SABOR.Value, []) then
//            Begin
//              DmVenda_Nova.CdSelSabor.Edit;
//              DmVenda_Nova.CdSelSaborMARCADO.Value := 'S';
//              DmVenda_Nova.CdSelSabor.Post;
//            End;
//
//            DmVenda_Nova.CdSabor.Next;
//          End;
//          DmVenda_Nova.CdSelSabor.First;
//        end;
//
//      DmVenda_Nova.CdSelSabor.Close;
//      DmVenda_Nova.CdSelSabor.Open;
//      while not DmVenda_Nova.CdSabor.Eof do
//      Begin
//        if DmVenda_Nova.CdSelSabor.Locate('COD_SABOR', DmVenda_Nova.CdSaborCOD_SABOR.Value, []) then
//        Begin
//          DmVenda_Nova.CdSelSabor.Edit;
//          DmVenda_Nova.CdSelSaborMARCADO.Value := 'S';
//          DmVenda_Nova.CdSelSabor.Post;
//        End;
//
//        DmVenda_Nova.CdSabor.Next;
//      End;
//      DmVenda_Nova.CdSelSabor.First;
    End;

  End
  Else
  Begin
    PnSabores.Visible := False;
//    MeCodProduto.ReadOnly := False;
//    MeCodProduto.Color := clWindow;
//    SpeedButton1.Enabled := True;
  End;

  AlteraTamanho;

  if ((DmVenda_Nova.CdProdutoItens.IsEmpty) or (DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value = DmVenda_Nova.CdProdutosVendaCOD_PRODUTO.Value)) then
    if (DmProduto.QQtdSaboresNUM_SABORES.IsNull) or (DmProduto.QQtdSaboresNUM_SABORES.Value <= 0) then
      if DmVenda_Nova.CdProdutosVendaMARCADO.Value <> 'S' then
        BtnGravarItem.Click;
end;

procedure TFVenda_Nova.DBGrid1CellClick(Column: TColumn);
var i: Integer;
begin
  if Trim(DmVenda_Nova.CdProdutoItensCLASSE_SELECIONADO.Value) = 'PRODUTO' then
  Begin
    MeCodProduto.ReadOnly := True;
    MeCodProduto.Color := clBtnFace;
    SpeedButton1.Enabled := False;

    DmProduto.QQtdSabores.Close;
    DmProduto.QQtdSabores.ParamByName('COD_PRODUTO').AsInteger := DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value;
    DmProduto.QQtdSabores.Open;
    if (DmProduto.QQtdSaboresNUM_SABORES.IsNull) or (DmProduto.QQtdSaboresNUM_SABORES.Value <= 0) then
      PnSabores.Visible := False
    else
    Begin
      PnSabores.Visible := True;

      QtdMaxSabores := DmProduto.QQtdSaboresNUM_SABORES.Value;

      CalculaTabs(True);

      DmVenda_Nova.CdSabor.Filtered := False;
      DmVenda_Nova.CdSabor.Filter := '(COD_VENDA_ITEM = ' + IntToStr(DmVenda_Nova.CdProdutosVendaCOD_VENDA_ITEM.Value) + ' and COD_PRODUTO = ' + IntToStr(DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value) + ' and COD_ITEM = 1 and INDICE = 1)';
      DmVenda_Nova.CdSabor.Filtered := True;
      DmVenda_Nova.CdSabor.First;

      DmVenda_Nova.CdSelSabor.Close;
      DmVenda_Nova.QSelSabor.ParamByName('COD_TIPO_PRODUTO').AsInteger := DmVenda_Nova.CdProdutoItensCOD_TIPO_PRODUTO.Value;
      DmVenda_Nova.CdSelSabor.Open;
      while not DmVenda_Nova.CdSabor.Eof do
      Begin
        if DmVenda_Nova.CdSelSabor.Locate('COD_SABOR', DmVenda_Nova.CdSaborCOD_SABOR.Value, []) then
        Begin
          DmVenda_Nova.CdSelSabor.Edit;
          DmVenda_Nova.CdSelSaborMARCADO.Value := 'S';
          DmVenda_Nova.CdSelSabor.Post;
        End;

        DmVenda_Nova.CdSabor.Next;
      End;
      DmVenda_Nova.CdSelSabor.First;

//      for i := 1 to QtdMaxSabores do
//      Begin
//        DmVenda_Nova.CdSabor.Append;
//        DmVenda_Nova.CdSaborCOD_VENDA.Value := 0;
//        DmVenda_Nova.CdSaborCOD_VENDA_ITEM.Value := DmVenda_Nova.CdProdutosVendaCOD_VENDA_ITEM.Value;
//        DmVenda_Nova.CdSaborCOD_PRODUTO.Value := DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value;
//        DmVenda_Nova.CdSaborCOD_ITEM.Value := 1;
//        DmVenda_Nova.CdSaborCOD_SABOR.Value := i * (-1);
//        DmVenda_Nova.CdSaborQT_QUANTIDADE.Value := 1;
//        DmVenda_Nova.CdSabor.Post;
//      End;
    End;

  End
  Else
  Begin
    PnSabores.Visible := False;
//    MeCodProduto.ReadOnly := False;
//    MeCodProduto.Color := clWindow;
//    SpeedButton1.Enabled := True;

//    MeCodProduto.Clear;
//    EProduto.Clear;
//    CeQtde.AsInteger := 0;
//    CePreco.AsInteger := 0;
//    CeTotal.AsInteger := 0;
  End;

  AlteraTamanho;
end;

procedure TFVenda_Nova.SpeedButton1Click(Sender: TObject);
begin
//  Application.CreateForm(TFProdutoCad, FProdutoCad);
//  FProdutoCad.Consultando := True;
//  if Trim(DmVenda_Nova.CdProdutoItensCLASSE_SELECIONADO.Value) = 'TIPO DE PRODUTO' then
//    FProdutoCad.Filtro := 'COD_TIPO_PRODUTO = ' + IntToStr(DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value);
//  FProdutoCad.ShowModal;
//
//  if RetornoConsulta > -1 then
//    MeCodProduto.Text := IntToStr(RetornoConsulta)
//  else
//    MeCodProduto.Clear;
//
//  MeCodProduto.SetFocus;
end;

procedure TFVenda_Nova.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_DOWN) or (Key = VK_UP) then
    DBGrid1CellClick(DBGrid1.Columns[DBGrid1.SelectedIndex]);
end;

procedure TFVenda_Nova.GbManutencaoExit(Sender: TObject);
begin
  BtnCancelarItem.Click;
end;

procedure TFVenda_Nova.DbGSaboresCellClick(Column: TColumn);
begin
  if Column.Title.Caption = 'X' then
  Begin
    DmVenda_Nova.CdSelSabor.Edit;
    if DmVenda_Nova.CdSelSaborMARCADO.Value = 'S' then
    Begin
      DmVenda_Nova.CdSelSaborMARCADO.Value := 'N';

      if DmVenda_Nova.CdSabor.Locate('COD_SABOR', DmVenda_Nova.CdSelSaborCOD_SABOR.Value, []) then
        DmVenda_Nova.CdSabor.Delete
    End
    else
    Begin
      DmVenda_Nova.CdSelSaborMARCADO.Value := 'S';

      DmVenda_Nova.CdSabor.Append;
      DmVenda_Nova.CdSaborCOD_VENDA.Value := 0;
      DmVenda_Nova.CdSaborCOD_VENDA_ITEM.Value := DmVenda_Nova.CdProdutosVendaCOD_VENDA_ITEM.Value;
      DmVenda_Nova.CdSaborCOD_PRODUTO.Value := DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value;
      DmVenda_Nova.CdSaborCOD_ITEM.Value := 1;
      DmVenda_Nova.CdSaborCOD_SABOR.Value := DmVenda_Nova.CdSelSaborCOD_SABOR.Value;
      DmVenda_Nova.CdSaborQT_QUANTIDADE.Value := 1;
      DmVenda_Nova.CdSaborINDICE.Value := PcSabores.ActivePageIndex + 1;
      DmVenda_Nova.CdSabor.Post;
    End;
    DmVenda_Nova.CdSelSabor.Post;
  End;
end;

procedure TFVenda_Nova.DbGSaboresDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (Column.Title.Caption = 'X') then
  begin DbGSabores.Canvas.FillRect(Rect);
    if DmVenda_Nova.CdSelSaborMARCADO.Value = 'S' then
      ImageList1.Draw(DbGSabores.Canvas, Rect.Left + 5, Rect.Top + 1, 1)
     else
      ImageList1.Draw(DbGSabores.Canvas, Rect.Left + 5, Rect.Top + 1, 0);
    end;
end;

procedure TFVenda_Nova.DbGSaboresKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_space) or (Key = vk_return) then
  Begin
    DmVenda_Nova.CdSelSabor.Edit;
    if DmVenda_Nova.CdSelSaborMARCADO.Value = 'S' then
      DmVenda_Nova.CdSelSaborMARCADO.Value := 'N'
    else
      DmVenda_Nova.CdSelSaborMARCADO.Value := 'S';
    DmVenda_Nova.CdSelSabor.Post;
  End;
end;

procedure TFVenda_Nova.BtnGravarItemClick(Sender: TObject);
var Marcados, i: Integer;
EstavaMarcado: Boolean;
TotalAnterior, TaxaEntregaAnterior, TaxaEntrega: Currency;
begin
  if CeQtde.Value < 0 then
  Begin
    MessageDlg('Informe a Quantidade.', mtWarning, [mbOK], 0);
    CeQtde.SetFocus;
    Exit;
  End;

  if CePreco.Value < 0 then
  Begin
    MessageDlg('Informe o Preço.', mtWarning, [mbOK], 0);
    CePreco.SetFocus;
    Exit;
  End;

//  EstavaMarcado := DmVenda_Nova.CdProdutosVendaMARCADO.Value = 'S';
  if DmVenda_Nova.CdProdutosVendaMARCADO.Value = 'S' then
    TotalAnterior := DmVenda_Nova.CdProdutosVendaval_total_digitado.Value
  else
    TotalAnterior := 0;

  TaxaEntregaAnterior := CeTaxaTotal.Value;

  DmVenda_Nova.CdProdutosVendaMARCADO.Value := 'S';
  DmVenda_Nova.CdProdutosVendaQT_QUANTIDADE_DIGITADO.Value := CeQtde.Value;
  DmVenda_Nova.CdProdutosVendaVAL_PRECO_DIGITADO.Value := CePreco.Value;

  DmVenda_Nova.CdProdutoItens.First;
  while not DmVenda_Nova.CdProdutoItens.Eof do
  Begin
    DBGrid1CellClick(DBGrid1.Columns[DBGrid1.SelectedIndex]);
    DmProduto.QQtdSabores.Close;
    DmProduto.QQtdSabores.ParamByName('COD_PRODUTO').AsInteger := DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value;
    DmProduto.QQtdSabores.Open;

    if ((not DmProduto.QQtdSaboresNUM_SABORES.IsNull) and (DmProduto.QQtdSaboresNUM_SABORES.Value > 0)) then
    Begin
      Marcados := 0;
      DmVenda_Nova.CdSelSabor.First;
      while not DmVenda_Nova.CdSelSabor.Eof do
      Begin
        if DmVenda_Nova.CdSelSaborMARCADO.Value = 'S' then
          Inc(Marcados);
        DmVenda_Nova.CdSelSabor.Next;
      End;

      if Marcados <= 0 then
      Begin
        MessageDlg('Informe pelo menos 1 (um) sabor para a pizza.', mtWarning, [mbOK], 0);
        DBGrid1CellClick(DBGrid1.Columns[DBGrid1.SelectedIndex]);
        Exit;
      End;
    End;

    DmVenda_Nova.CdProdutoItens.Next;
  End;

//  for i := 0 to PcSabores.PageCount -1 do
//  Begin
//    DmVenda_Nova.CdSabor.Filtered := False;
//    DmVenda_Nova.CdSabor.Filter := '(COD_VENDA_ITEM = ' + IntToStr(DmVenda_Nova.CdProdutosVendaCOD_VENDA_ITEM.Value) + ' and COD_PRODUTO = ' + IntToStr(DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value) + ' and COD_ITEM = 1 and INDICE = ' + IntToStr(i + 1) + ')';
//    DmVenda_Nova.CdSabor.Filtered := True;
//    DmVenda_Nova.CdSabor.First;
//    while not DmVenda_Nova.CdSabor.IsEmpty do
//      DmVenda_Nova.CdSabor.Delete;
//
//    DmVenda_Nova.CdSelSabor.First;
//    while not DmVenda_Nova.CdSelSabor.Eof do
//    Begin
//      if DmVenda_Nova.CdSelSaborMARCADO.Value = 'S' then
//      Begin
//        DmVenda_Nova.CdSabor.Append;
//        DmVenda_Nova.CdSaborCOD_VENDA.Value := 0;
//        DmVenda_Nova.CdSaborCOD_VENDA_ITEM.Value := DmVenda_Nova.CdProdutosVendaCOD_VENDA_ITEM.Value;
//        DmVenda_Nova.CdSaborCOD_PRODUTO.Value := DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value;
//        DmVenda_Nova.CdSaborCOD_ITEM.Value := 1;
//        DmVenda_Nova.CdSaborCOD_SABOR.Value := DmVenda_Nova.CdSelSaborCOD_SABOR.Value;
//        DmVenda_Nova.CdSaborQT_QUANTIDADE.Value := 1;
//        DmVenda_Nova.CdSaborINDICE.Value := i + 1;
//        DmVenda_Nova.CdSabor.Post;
//      End;
//
//      DmVenda_Nova.CdSelSabor.Next;
//    End;
//
//  End;

  DmVenda_Nova.CdProdutosVenda.Post;

  if (DmVenda_Nova.CdProdutosVendaMARCADO.Value = 'S') then
    TotalProd := TotalProd - TotalAnterior + DmVenda_Nova.CdProdutosVendaval_total_digitado.Value;
//    CeTotalGeral.Value := CeTotalGeral.Value - TaxaEntregaAnterior - TotalAnterior + DmVenda_Nova.CdProdutosVendaval_total_digitado.Value;

  CalculaTaxa;

  CeTotalGeral.Value := TotalProd + CeTaxaTotal.Value;

  Gravando := True;
  BtnCancelarItem.Click;
  Gravando := False;
end;

procedure TFVenda_Nova.BtnCancelarItemClick(Sender: TObject);
begin
  if DmVenda_Nova.CdProdutosVenda.State in [dsInsert, dsEdit] then
    DmVenda_Nova.CdProdutosVenda.Cancel;

  if not Gravando then
  Begin
    DmVenda_Nova.CdSabor.Filtered := False;
    DmVenda_Nova.CdSabor.Filter := 'COD_VENDA_ITEM = ' + IntToStr(DmVenda_Nova.CdProdutosVendaCOD_VENDA_ITEM.Value);
    DmVenda_Nova.CdSabor.Filtered := True;
    DmVenda_Nova.CdSabor.First;

    while not DmVenda_Nova.CdSabor.IsEmpty do
      DmVenda_Nova.CdSabor.Delete;

    DmVenda_Nova.CdBackup.First;
    while not DmVenda_Nova.CdBackup.Eof do
    Begin
      DmVenda_Nova.CdSabor.Append;
      DmVenda_Nova.CdSaborCOD_VENDA.Value := DmVenda_Nova.CdBackupCOD_VENDA.Value;
      DmVenda_Nova.CdSaborCOD_VENDA_ITEM.Value := DmVenda_Nova.CdBackupCOD_VENDA_ITEM.Value;
      DmVenda_Nova.CdSaborCOD_PRODUTO.Value := DmVenda_Nova.CdBackupCOD_PRODUTO.Value;
      DmVenda_Nova.CdSaborCOD_ITEM.Value := DmVenda_Nova.CdBackupCOD_ITEM.Value;
      DmVenda_Nova.CdSaborCOD_SABOR.Value := DmVenda_Nova.CdBackupCOD_SABOR.Value;
      DmVenda_Nova.CdSaborQT_QUANTIDADE.Value := DmVenda_Nova.CdBackupQT_QUANTIDADE.Value;
      DmVenda_Nova.CdSaborINDICE.Value := DmVenda_Nova.CdBackupINDICE.Value;
      DmVenda_Nova.CdSabor.Post;

      DmVenda_Nova.CdBackup.Next;
    End;
  End;

  GbManutencao.Visible := False;
  DbGDados.SetFocus;
end;

procedure TFVenda_Nova.DbGDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    DbGDadosCellClick(DBGrid1.Columns[DbGDados.SelectedIndex]);
  if Key = VK_TAB then
    MeTelefone.SetFocus; 
end;

procedure TFVenda_Nova.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    if GbManutencao.Visible then
      BtnCancelarItem.Click
    else
      BtnCancelar.Click;
  if Key = VK_F9 then
    if GbManutencao.Visible then
      BtnGravarItem.Click
    else
      BtnGravar.Click;
end;

procedure TFVenda_Nova.CePrecoExit(Sender: TObject);
begin
  CeTotal.Value := CeQtde.Value * CePreco.Value;
end;

procedure TFVenda_Nova.CeQtdeExit(Sender: TObject);
begin
  DmProduto.QQtdSabores.Close;
  DmProduto.QQtdSabores.ParamByName('COD_PRODUTO').AsInteger := DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value;
  DmProduto.QQtdSabores.Open;

  if not ((DmProduto.QQtdSaboresNUM_SABORES.IsNull) or (DmProduto.QQtdSaboresNUM_SABORES.Value <= 0)) then
    CalculaTabs(False);
end;

procedure TFVenda_Nova.CalculaTabs(Limpa: Boolean = False);
var i, valorUsar: Integer;
begin
  CeTotal.Value := CeQtde.Value * CePreco.Value;

  DmVenda_Nova.CdSabor.Filtered := False;
  DmVenda_Nova.CdSabor.Filter := '(COD_VENDA_ITEM = ' + IntToStr(DmVenda_Nova.CdProdutosVendaCOD_VENDA_ITEM.Value) + ' and COD_PRODUTO = ' + IntToStr(DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value) + ' and COD_ITEM = 1 and INDICE = ' + IntToStr(i + 1) + ')';
  DmVenda_Nova.CdSabor.Filtered := True;
  DmVenda_Nova.CdSabor.First;

  if Limpa then
    while PcSabores.PageCount > 0 do
      PcSabores.Pages[0].Destroy;

  if CeQtde.AsInteger < CeQtde.Value then
    valorUsar := CeQtde.AsInteger + 1
  else
    valorUsar := CeQtde.AsInteger;

  if PcSabores.PageCount > valorUsar then
  Begin
    for i := PcSabores.PageCount - 1 downto valorUsar do
    Begin
      PcSabores.Pages[i].Destroy;

//      DmVenda_Nova.CdSabor.Filtered := False;
//      DmVenda_Nova.CdSabor.Filter := '(COD_VENDA_ITEM = ' + IntToStr(DmVenda_Nova.CdProdutosVendaCOD_VENDA_ITEM.Value) + ' and COD_PRODUTO = ' + IntToStr(DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value) + ' and COD_ITEM = 1 and INDICE = ' + IntToStr(i + 1) + ')';
//      DmVenda_Nova.CdSabor.Filtered := True;
//      DmVenda_Nova.CdSabor.First;
      while not DmVenda_Nova.CdSabor.IsEmpty do
        DmVenda_Nova.CdSabor.Delete;
    End;
  End
  Else
  Begin
    for i := PcSabores.PageCount to valorUsar - 1 do
      with TTabSheet.Create(Self) do
      begin
        PageControl := PcSabores;
        TabVisible := True;
        Caption := 'Pizza ' + IntToStr(i + 1);

        DmVenda_Nova.CdSelSabor.Close;
        DmVenda_Nova.QSelSabor.ParamByName('COD_TIPO_PRODUTO').AsInteger := DmVenda_Nova.CdProdutoItensCOD_TIPO_PRODUTO.Value;
        DmVenda_Nova.CdSelSabor.Open;
        while not DmVenda_Nova.CdSabor.Eof do
        Begin
          if DmVenda_Nova.CdSelSabor.Locate('COD_SABOR', DmVenda_Nova.CdSaborCOD_SABOR.Value, []) then
          Begin
            DmVenda_Nova.CdSelSabor.Edit;
            DmVenda_Nova.CdSelSaborMARCADO.Value := 'S';
            DmVenda_Nova.CdSelSabor.Post;
          End;

          DmVenda_Nova.CdSabor.Next;
        End;
        DmVenda_Nova.CdSelSabor.First;
      end;
  End;

  PcSabores.ActivePageIndex := 0;
end;

procedure TFVenda_Nova.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DmVenda_Nova.CdProdutosVenda.Close;
  DmVenda_Nova.CdProdutoItens.Close;
  DmVenda_Nova.CdSabor.Close;
  DmVenda_Nova.CdSelSabor.Close;
  DmVenda_Nova.CdBackup.Close;

  Action := caFree;
end;

procedure TFVenda_Nova.BtnGravarClick(Sender: TObject);
var venda, Marcados: Integer;
begin
  Marcados := 0;
  DmVenda_Nova.CdProdutosVenda.First;
  while not DmVenda_Nova.CdProdutosVenda.Eof do
  Begin
    if DmVenda_Nova.CdProdutosVendaMARCADO.Value = 'S' then
      Inc(Marcados);
    DmVenda_Nova.CdProdutosVenda.Next;
  End;
  if Marcados <= 0 then
  Begin
    MessageDlg('Informe pelo menos 1 (um) produto.', mtWarning, [mbOK], 0);
    Exit;
  End;

  if ((Trim(MeCodCliente.Text) = '') or (Trim(ECliente.Text) = '')) then
  Begin
    MessageDlg('Informe o Cliente.', mtWarning, [mbOK], 0);
    MeTelefone.SetFocus;
    Exit;
  End;

  DmSistema.TSistema.CommitRetaining;
  try
    DmVenda_Nova.QUltimaVenda.Close;
    DmVenda_Nova.QUltimaVenda.Open;

    venda := DmVenda_Nova.QUltimaVendaULTIMO.Value + 1;

    DmVenda_Nova.QInsVenda.Close;
    DmVenda_Nova.QInsVenda.ParamByName('COD_VENDA').AsInteger := venda;
    DmVenda_Nova.QInsVenda.ParamByName('COD_CLIENTE').AsInteger := StrToInt(Trim(MeCodCliente.Text));
    DmVenda_Nova.QInsVenda.ParamByName('COD_OPERADOR').AsInteger := OperadorLogado;
    DmVenda_Nova.QInsVenda.ParamByName('DESC_OBSERVACAO').AsString := EObs.Text;
    DmVenda_Nova.QInsVenda.ParamByName('DT_VENDA').AsDate := Date;
    DmVenda_Nova.QInsVenda.ParamByName('VAL_TAXA_TOTAL').AsFloat := CeTaxaTotal.Value;
    DmVenda_Nova.QInsVenda.ExecSQL;

    DmVenda_Nova.CdProdutosVenda.First;
    while not DmVenda_Nova.CdProdutosVenda.Eof do
    Begin
      if DmVenda_Nova.CdProdutosVendaMARCADO.Value = 'S' then
      Begin
        DmVenda_Nova.QInsVendaItem.Close;
        DmVenda_Nova.QInsVendaItem.ParamByName('COD_VENDA').AsInteger := venda;
        DmVenda_Nova.QInsVendaItem.ParamByName('COD_VENDA_ITEM').AsInteger := DmVenda_Nova.CdProdutosVendaCOD_VENDA_ITEM.Value;
        DmVenda_Nova.QInsVendaItem.ParamByName('COD_PRODUTO').AsInteger := DmVenda_Nova.CdProdutosVendaCOD_PRODUTO.Value;
        DmVenda_Nova.QInsVendaItem.ParamByName('QT_QUANTIDADE').AsFloat := DmVenda_Nova.CdProdutosVendaQT_QUANTIDADE_DIGITADO.Value;
        DmVenda_Nova.QInsVendaItem.ParamByName('VAL_PRECO').AsFloat := DmVenda_Nova.CdProdutosVendaVAL_PRECO_DIGITADO.Value;
        DmVenda_Nova.QInsVendaItem.ExecSQL;

        DmVenda_Nova.CdProdutoItens.Close;
        DmVenda_Nova.QProdutoItens.ParamByName('COD_PRODUTO').AsInteger := DmVenda_Nova.CdProdutosVendaCOD_PRODUTO.Value;
        DmVenda_Nova.CdProdutoItens.Open;

        DmVenda_Nova.CdProdutoItens.First;
        while not DmVenda_Nova.CdProdutoItens.Eof do
        Begin
          DmVenda_Nova.CdSabor.Filtered := False;
          DmVenda_Nova.CdSabor.Filter := '(COD_VENDA_ITEM = ' + IntToStr(DmVenda_Nova.CdProdutosVendaCOD_VENDA_ITEM.Value) + ' and COD_PRODUTO = ' + IntToStr(DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value) + ' and COD_ITEM = 1)';
          DmVenda_Nova.CdSabor.Filtered := True;
          DmVenda_Nova.CdSabor.First;

          while not DmVenda_Nova.CdSabor.Eof do
          Begin
            DmVenda_Nova.QInsVendaItemSabor.Close;
            DmVenda_Nova.QInsVendaItemSabor.ParamByName('COD_VENDA').AsInteger := venda;
            DmVenda_Nova.QInsVendaItemSabor.ParamByName('COD_VENDA_ITEM').AsInteger := DmVenda_Nova.CdProdutosVendaCOD_VENDA_ITEM.Value;
            DmVenda_Nova.QInsVendaItemSabor.ParamByName('COD_PRODUTO').AsInteger := DmVenda_Nova.CdSaborCOD_PRODUTO.Value;
            DmVenda_Nova.QInsVendaItemSabor.ParamByName('COD_ITEM').AsInteger := DmVenda_Nova.CdSaborCOD_ITEM.Value;
            DmVenda_Nova.QInsVendaItemSabor.ParamByName('COD_SABOR').AsInteger := DmVenda_Nova.CdSaborCOD_SABOR.Value;
            DmVenda_Nova.QInsVendaItemSabor.ParamByName('QT_QUANTIDADE').AsInteger := DmVenda_Nova.CdSaborQT_QUANTIDADE.Value;
            DmVenda_Nova.QInsVendaItemSabor.ParamByName('INDICE').AsInteger := DmVenda_Nova.CdSaborINDICE.Value;
            DmVenda_Nova.QInsVendaItemSabor.ExecSQL;

            DmVenda_Nova.CdSabor.Next;
          End;

          DmVenda_Nova.CdProdutoItens.Next;
        End;
      End;
      DmVenda_Nova.CdProdutosVenda.Next;
    End;
  except
    MessageDlg('Erro durante a Gravação.', mtError, [mbOK], 0);
    DmSistema.TSistema.RollbackRetaining;
    Abort;
  end;

  DmSistema.TSistema.CommitRetaining;

  ImprimeTicket(venda, 'COZINHA');
  ImprimeTicket(venda);

  BtnLimpar.Click;
end;

procedure TFVenda_Nova.MeTelefoneEnter(Sender: TObject);
begin
  MeTelefone.SelStart := 5;
  MeTelefone.SelLength := 9;
  MeTelefone.Refresh;
end;

procedure TFVenda_Nova.MeTelefoneExit(Sender: TObject);
begin
  DmCliente.QTelCadastrado.Close;
  DmCliente.QTelCadastrado.ParamByName('DESC_TELEFONE').AsString := Trim(MeTelefone.Text);
  DmCliente.QTelCadastrado.Open;

  if DmCliente.QTelCadastrado.IsEmpty then
  Begin
    Application.CreateForm(TFClienteCadRapido, FClienteCadRapido);
    FClienteCadRapido.MeTelefone.Text := MeTelefone.Text;
    FClienteCadRapido.ShowModal;
    if FClienteCadRapido.Cliente = -1 then
    Begin
      MeCodCliente.Clear;
      ECliente.Clear;
      MeTelefone.Text := '(45)     -    ';
    End
    else
    Begin
      MeCodCliente.Text := IntToStr(FClienteCadRapido.Cliente);
      ECliente.Text := BuscaString('DESC_NOME', 'TB_CLIENTE', 'COD_CLIENTE', StrToInt(MeCodCliente.Text));
      MeTelefone.Text := BuscaString('DESC_TELEFONE', 'TB_CLIENTE', 'COD_CLIENTE', StrToInt(MeCodCliente.Text));
    End;
    FClienteCadRapido.Free;
  End
  Else
  Begin
    MeCodCliente.Text := IntToStr(DmCliente.QTelCadastradoCOD_CLIENTE.Value);
    ECliente.Text := BuscaString('DESC_NOME', 'TB_CLIENTE', 'COD_CLIENTE', StrToInt(MeCodCliente.Text));
    MeTelefone.Text := BuscaString('DESC_TELEFONE', 'TB_CLIENTE', 'COD_CLIENTE', StrToInt(MeCodCliente.Text));
  End;
end;

procedure TFVenda_Nova.SpeedButton2Click(Sender: TObject);
begin
  Application.CreateForm(TFClienteCad, FClienteCad);
  FClienteCad.Consultando := True;
  FClienteCad.ShowModal;

  if RetornoConsulta > -1 then
  Begin
    MeCodCliente.Text := IntToStr(RetornoConsulta);
    MeTelefone.Text := BuscaString('DESC_TELEFONE', 'TB_CLIENTE', 'COD_CLIENTE', RetornoConsulta);
  End
  else
  Begin
    MeCodCliente.Clear;
    MeTelefone.Text := '(45)     -    ';
  End;

  MeTelefone.SetFocus;
end;

procedure TFVenda_Nova.MeCodClienteChange(Sender: TObject);
begin
  if MeCodCliente.Text <> '' then
    ECliente.Text := BuscaString('DESC_NOME', 'TB_CLIENTE', 'COD_CLIENTE', StrToInt(MeCodCliente.Text))
  else
    ECliente.Clear;
end;

procedure TFVenda_Nova.BtnLimparClick(Sender: TObject);
begin
  DmVenda_Nova.CdProdutosVenda.Close;
  DmVenda_Nova.CdProdutosVenda.Open;
  DmVenda_Nova.CdProdutoItens.Close;
  DmVenda_Nova.CdProdutoItens.Open;
  DmVenda_Nova.CdSabor.Close;
  DmVenda_Nova.CdSabor.Open;
  DmVenda_Nova.CdSelSabor.Close;
  DmVenda_Nova.CdSelSabor.Open;
  MeTelefone.Text := '(45) ';
  MeCodCliente.Clear;
  ECliente.Clear;
  EObs.Clear;

  CeTotalGeral.Value := 0;
  TotalProd := 0;

  CeTaxa.Value := DmParamSistema.QParamSistemaVAL_TAXA_ENTREGA.Value;
  CeQtdTaxa.Value := 0;
  CeTaxaTotal.Value := 0;

  DbGDados.SetFocus;
  DbGDados.SelectedIndex := 0;
end;

procedure TFVenda_Nova.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFVenda_Nova.MeTelefoneChange(Sender: TObject);
begin
  DmCliente.QTelCadastrado.Close;
  DmCliente.QTelCadastrado.ParamByName('DESC_TELEFONE').AsString := Trim(MeTelefone.Text);
  DmCliente.QTelCadastrado.Open;

  MeCodCliente.Text := IntToStr(DmCliente.QTelCadastradoCOD_CLIENTE.Value);
  ECliente.Text := BuscaString('DESC_NOME', 'TB_CLIENTE', 'COD_CLIENTE', StrToInt(MeCodCliente.Text));
end;

procedure TFVenda_Nova.CeTaxaChange(Sender: TObject);
begin
  CeTaxaTotal.Value := CeTaxa.Value * CeQtdTaxa.Value;
end;

procedure TFVenda_Nova.CeQtdTaxaChange(Sender: TObject);
begin
  CeTaxaTotal.Value := CeTaxa.Value * CeQtdTaxa.Value;
end;

procedure TFVenda_Nova.CeTaxaTotalChange(Sender: TObject);
begin
  CeTotalGeral.Value := TotalProd + CeTaxaTotal.Value;
end;

procedure TFVenda_Nova.CalculaTaxa;
var TaxaEntrega: Currency;
teste: Integer;
Begin
  TaxaEntrega := 0;
  CeQtdTaxa.Value := 0;
  teste := DmVenda_Nova.CdProdutosVenda.RecNo;
  DmVenda_Nova.CdProdutosVenda.First;
  while not DmVenda_Nova.CdProdutosVenda.Eof do
  begin
    if (DmVenda_Nova.CdProdutosVendaMARCADO.Value = 'S') then
    Begin
      DmProduto.QQtdSabores.Close;
      DmProduto.QQtdSabores.ParamByName('COD_PRODUTO').AsInteger := DmVenda_Nova.CdProdutosVendaCOD_PRODUTO.Value;
      DmProduto.QQtdSabores.Open;

      if DmProduto.QQtdSaboresIND_TIPO_TAXA_ENTREGA.Value = '1' then
      Begin
        TaxaEntrega := TaxaEntrega + CeTaxa.Value;
        CeQtdTaxa.Value := CeQtdTaxa.Value + 1;
      End;
      if DmProduto.QQtdSaboresIND_TIPO_TAXA_ENTREGA.Value = '2' then
      Begin
        TaxaEntrega := TaxaEntrega + (CeTaxa.Value * DmVenda_Nova.CdProdutosVendaQT_QUANTIDADE_DIGITADO.Value);
        CeQtdTaxa.Value := CeQtdTaxa.Value + DmVenda_Nova.CdProdutosVendaQT_QUANTIDADE_DIGITADO.Value;
      End;
    End;

    DmVenda_Nova.CdProdutosVenda.Next;
  end;
//  DmVenda_Nova.CdProdutosVenda.First;
  DmVenda_Nova.CdProdutosVenda.RecNo := teste;

  CeTaxaTotal.Value := TaxaEntrega;
End;

procedure TFVenda_Nova.CeTotalGeralChange(Sender: TObject);
begin
  if CeTotalGeral.Value < 0 then
    CeTotalGeral.Value := 0;
end;

procedure TFVenda_Nova.PcSaboresChange(Sender: TObject);
begin
  DmVenda_Nova.CdSabor.Filtered := False;
  DmVenda_Nova.CdSabor.Filter := '(COD_VENDA_ITEM = ' + IntToStr(DmVenda_Nova.CdProdutosVendaCOD_VENDA_ITEM.Value) + ' and COD_PRODUTO = ' + IntToStr(DmVenda_Nova.CdProdutoItensCOD_SELECIONADO.Value) + ' and COD_ITEM = 1 and INDICE = ' + IntToStr(PcSabores.ActivePageIndex + 1) + ')';
  DmVenda_Nova.CdSabor.Filtered := True;
  DmVenda_Nova.CdSabor.First;

  DmVenda_Nova.CdSelSabor.Close;
  DmVenda_Nova.QSelSabor.ParamByName('COD_TIPO_PRODUTO').AsInteger := DmVenda_Nova.CdProdutoItensCOD_TIPO_PRODUTO.Value;
  DmVenda_Nova.CdSelSabor.Open;
  while not DmVenda_Nova.CdSabor.Eof do
  Begin
    if DmVenda_Nova.CdSelSabor.Locate('COD_SABOR', DmVenda_Nova.CdSaborCOD_SABOR.Value, []) then
    Begin
      DmVenda_Nova.CdSelSabor.Edit;
      DmVenda_Nova.CdSelSaborMARCADO.Value := 'S';
      DmVenda_Nova.CdSelSabor.Post;
    End;

    DmVenda_Nova.CdSabor.Next;
  End;
  DmVenda_Nova.CdSelSabor.First;
end;

end.
