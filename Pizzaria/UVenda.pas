unit UVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Buttons, Grids, DBGrids, ComCtrls,
  ToolEdit, CurrEdit, DBCtrls, TeEngine, Series, TeeProcs, Chart, DbChart,
  Menus, DB, DBTables, MemTable;

type
  TFVenda = class(TForm)
    Panel1: TPanel;
    Label6: TLabel;
    SpeedButton2: TSpeedButton;
    MeCodCliente: TMaskEdit;
    ECliente: TEdit;
    PcItens: TPageControl;
    TabSheet1: TTabSheet;
    DbGDados: TDBGrid;
    BtnCancelar: TBitBtn;
    BtnGravar: TBitBtn;
    SbEditar: TSpeedButton;
    SbInserir: TSpeedButton;
    SbExcluir: TSpeedButton;
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
    DBChart1: TDBChart;
    Series1: TPieSeries;
    PopupMenu1: TPopupMenu;
    Adicionar1: TMenuItem;
    Retirar1: TMenuItem;
    Edita1: TMenuItem;
    BtnLimpar: TBitBtn;
    Label5: TLabel;
    EObs: TEdit;
    procedure MeCodClienteChange(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MeCodClienteExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure BtnGravarItemClick(Sender: TObject);
    procedure BtnCancelarItemClick(Sender: TObject);
    procedure GbManutencaoExit(Sender: TObject);
    procedure CeQtdeExit(Sender: TObject);
    procedure CePrecoExit(Sender: TObject);
    procedure SbEditarClick(Sender: TObject);
    procedure SbInserirClick(Sender: TObject);
    procedure SbExcluirClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure MeCodProdutoChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure DBChart1ClickSeries(Sender: TCustomChart;
      Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Adicionar1Click(Sender: TObject);
    procedure Edita1Click(Sender: TObject);
    procedure Retirar1Click(Sender: TObject);
    procedure DbGDadosDblClick(Sender: TObject);
    procedure DbGDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnLimparClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    QtdMaxSabores, SaborClicado: Integer;
    BlockChange: Boolean;
    function ProcuraRegistro(dataset: TDataSet; RecNoRelativo: Integer): Boolean;
    procedure AlteraTamanho;
    procedure ImprimeTicket(NumVenda: Integer);
    function TiraAcentos(wString: String): String;
  public
    { Public declarations }
  end;

var
  FVenda: TFVenda;

implementation

uses UFuncoes, UClienteCad, UClienteCadRapido, UDmVenda, Math,
  UProdutoCad, UDmProduto, USaborCad, UDmSistema, UBiblioteca,
  UDmParamSistema;

{$R *.dfm}

procedure TFVenda.MeCodClienteChange(Sender: TObject);
begin
  if MeCodCliente.Text <> '' then
    ECliente.Text := BuscaString('DESC_NOME', 'TB_CLIENTE', 'COD_CLIENTE', StrToInt(MeCodCliente.Text))
  else
    ECliente.Clear;
end;

procedure TFVenda.SpeedButton2Click(Sender: TObject);
begin
  Application.CreateForm(TFClienteCad, FClienteCad);
  FClienteCad.Consultando := True;
  FClienteCad.ShowModal;

  if RetornoConsulta > -1 then
    MeCodCliente.Text := IntToStr(RetornoConsulta)
  else
    MeCodCliente.Clear;

  MeCodCliente.SetFocus;
end;

procedure TFVenda.MeCodClienteExit(Sender: TObject);
begin
  if ((ActiveControl = BtnCancelar) or (ActiveControl = BtnLimpar) or (ActiveControl = EObs) or (ActiveControl = DbGDados) or (ActiveControl = MeCodProduto)) then Exit;
  if Trim(MeCodCliente.Text) = '' then
  Begin
    Application.CreateForm(TFClienteCadRapido, FClienteCadRapido);
    FClienteCadRapido.ShowModal;
    if FClienteCadRapido.Cliente = -1 then
      MeCodCliente.Clear
    else
      MeCodCliente.Text := IntToStr(FClienteCadRapido.Cliente);
    FClienteCadRapido.Free;
  End;
end;

procedure TFVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DmVenda.CdItemVenda.Close;
  DmVenda.CdSabor.Close;
  DmVenda.CdBackup.Close;
  DmVenda.QUltimaVenda.Close;

  Action := caFree;
end;

procedure TFVenda.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TFVenda.FormShow(Sender: TObject);
begin
  DmVenda.CdItemVenda.Close;
  DmVenda.CdItemVenda.Open;
  DmVenda.CdSabor.Close;
  DmVenda.CdSabor.Open;
  BlockChange := False;

  AlteraTamanho;

  GbManutencao.BringToFront;

  DbGDados.SetFocus;
  DbGDados.SelectedIndex := 0;
end;

procedure TFVenda.BtnGravarItemClick(Sender: TObject);
var contErros: Integer;
begin
  if (Trim(MeCodProduto.Text) = '') or (Trim(MeCodProduto.Text) = '0') then
  Begin
    MessageDlg('Informe o Produto.', mtWarning, [mbOK], 0);
    MeCodProduto.SetFocus;
    Exit;
  End;

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

  DmVenda.CdItemVendaCOD_VENDA.Value := 0;
  if DmVenda.CdItemVenda.State = dsInsert then
  Begin
    if DmVenda.CdItemVendamax_codigo.Value = null then
      DmVenda.CdItemVendaCOD_VENDA_ITEM.Value := 1
    else
      DmVenda.CdItemVendaCOD_VENDA_ITEM.Value := DmVenda.CdItemVendamax_codigo.Value + 1;
  End;
  DmVenda.CdItemVendaCOD_PRODUTO.Value := StrToInt(Trim(MeCodProduto.Text));
  DmVenda.CdItemVendaQT_QUANTIDADE.Value := CeQtde.Value;
  DmVenda.CdItemVendaVAL_PRECO.Value := CePreco.Value;

  DmVenda.CdSabor.Filtered := False;
  DmVenda.CdSabor.Filter := '(COD_VENDA_ITEM = 0) OR (COD_VENDA_ITEM = ' + IntToStr(DmVenda.CdItemVendaCOD_VENDA_ITEM.Value) + ')';
  DmVenda.CdSabor.Filtered := True;
  DmVenda.CdSabor.First;
  contErros := 0;
  while not DmVenda.CdSabor.Eof do
  Begin
    if DmVenda.CdSaborCOD_VENDA_ITEM.Value = 0 then
    Begin
      DmVenda.CdSabor.Edit;
      DmVenda.CdSaborCOD_VENDA_ITEM.Value := DmVenda.CdItemVendaCOD_VENDA_ITEM.Value;
      DmVenda.CdSabor.Post;
    End;

    if DmVenda.CdSaborCOD_SABOR.Value < 0 then
      Inc(contErros);

    DmVenda.CdSabor.Next;
  End;

  if contErros > 0 then
  Begin
    MessageDlg('Existem sabores não informados nesta pizza.'+#13+#10+'Informe-os ou retire os pedaços.', mtWarning, [mbOK], 0);
    Exit;
  End;

  DmVenda.CdItemVenda.Post;

  BtnCancelarItem.Click;
end;

procedure TFVenda.BtnCancelarItemClick(Sender: TObject);
begin
  if DmVenda.CdItemVenda.State in [dsInsert] then
    DmVenda.CdItemVenda.Cancel;
  if DmVenda.CdItemVenda.State in [dsEdit] then
  Begin
    DmVenda.CdItemVenda.Cancel;

    DmVenda.CdSabor.Filtered := False;
    DmVenda.CdSabor.Filter := '(COD_VENDA_ITEM = ' + DmVenda.CdItemVendaCOD_VENDA_ITEM.Text + ')';
    DmVenda.CdSabor.Filtered := True;
    DmVenda.CdSabor.First;
    while not DmVenda.CdSabor.IsEmpty do
      DmVenda.CdSabor.Delete;

    DmVenda.CdBackup.First;
    while not DmVenda.CdBackup.Eof do
    Begin
      DmVenda.CdSabor.Append;
      DmVenda.CdSaborCOD_VENDA_ITEM.Value := DmVenda.CdBackupCOD_VENDA_ITEM.Value;
      DmVenda.CdSaborCOD_SABOR.Value := DmVenda.CdBackupCOD_SABOR.Value;
      DmVenda.CdSaborQT_QUANTIDADE.Value := DmVenda.CdBackupQT_QUANTIDADE.Value;
      DmVenda.CdSaborCOD_VENDA.Value := 0;
      DmVenda.CdSabor.Post;

      DmVenda.CdBackup.Next;
    End;
  End;
  if DmVenda.CdSabor.State in [dsEdit, dsInsert] then
    DmVenda.CdSabor.Cancel;

  DmVenda.CdSabor.Filtered := False;
  DmVenda.CdSabor.Filter := '(COD_VENDA_ITEM = 0)';
  DmVenda.CdSabor.Filtered := True;
  DmVenda.CdSabor.First;
  while not DmVenda.CdSabor.IsEmpty do
    DmVenda.CdSabor.Delete;

  GbManutencao.Visible := False;
  DbGDados.SetFocus;
end;

procedure TFVenda.GbManutencaoExit(Sender: TObject);
begin
  BtnCancelarItem.Click;
end;

procedure TFVenda.CeQtdeExit(Sender: TObject);
begin
  CeTotal.Value := CeQtde.Value * CePreco.Value;
end;

procedure TFVenda.CePrecoExit(Sender: TObject);
begin
  CeTotal.Value := CeQtde.Value * CePreco.Value;
end;

procedure TFVenda.SbEditarClick(Sender: TObject);
begin
  if DmVenda.CdItemVenda.IsEmpty then Exit;
  GbManutencao.Visible := True;
  MeCodProduto.SetFocus;
  DmVenda.CdItemVenda.Edit;

  BlockChange := True;

  MeCodProduto.Text := DmVenda.CdItemVendaCOD_PRODUTO.Text;
  EProduto.Text := DmVenda.CdItemVendadesc_produto.Text;
  CeQtde.Value := DmVenda.CdItemVendaQT_QUANTIDADE.Value;
  CePreco.Value := DmVenda.CdItemVendaVAL_PRECO.Value;
  CeTotal.Value := DmVenda.CdItemVendaval_total.Value;

  BlockChange := False;

  DmVenda.CdSabor.Filtered := False;
  DmVenda.CdSabor.Filter := 'COD_VENDA_ITEM = ' + IntToStr(DmVenda.CdItemVendaCOD_VENDA_ITEM.Value);
  DmVenda.CdSabor.Filtered := True;

  DmVenda.CdBackup.Close;
  DmVenda.CdBackup.Open;
  DmVenda.CdSabor.First;
  while not DmVenda.CdSabor.Eof do
  Begin
    DmVenda.CdBackup.Append;
    DmVenda.CdBackupCOD_VENDA.Value := DmVenda.CdSaborCOD_VENDA.Value;
    DmVenda.CdBackupCOD_VENDA_ITEM.Value := DmVenda.CdSaborCOD_VENDA_ITEM.Value;
    DmVenda.CdBackupCOD_SABOR.Value := DmVenda.CdSaborCOD_SABOR.Value;
    DmVenda.CdBackupQT_QUANTIDADE.Value := DmVenda.CdSaborQT_QUANTIDADE.Value;
    DmVenda.CdBackup.Post;

    DmVenda.CdSabor.Next;
  End;

  DmProduto.QQtdSabores.Close;
  DmProduto.QQtdSabores.ParamByName('COD_PRODUTO').AsInteger := StrToInt(Trim(MeCodProduto.Text));
  DmProduto.QQtdSabores.Open;

  if (DmProduto.QQtdSaboresNUM_SABORES.IsNull) or (DmProduto.QQtdSaboresNUM_SABORES.Value <= 0) then
    DBChart1.Visible := False
  else
    DBChart1.Visible := True;
  AlteraTamanho;
  DBChart1.RefreshData;
end;

procedure TFVenda.SbInserirClick(Sender: TObject);
begin
  GbManutencao.Visible := True;
  MeCodProduto.SetFocus;
  DmVenda.CdItemVenda.Append;

  BlockChange := True;

  MeCodProduto.Clear;
  EProduto.Clear;
  CeQtde.Value := 0;
  CePreco.Value := 0;
  CeTotal.Value := 0;

  BlockChange := False;

  DmVenda.CdSabor.Filtered := False;
  DmVenda.CdSabor.Filter := 'COD_VENDA_ITEM = 0';
  DmVenda.CdSabor.Filtered := True;

  DBChart1.RefreshData;

  DBChart1.Visible := False;

  AlteraTamanho;
end;

procedure TFVenda.SbExcluirClick(Sender: TObject);
begin
  if DmVenda.CdItemVenda.IsEmpty then Exit;
  DmVenda.CdSabor.Filtered := False;
  DmVenda.CdSabor.Filter := '(COD_VENDA_ITEM = ' + DmVenda.CdItemVendaCOD_VENDA_ITEM.Text + ')';
  DmVenda.CdSabor.Filtered := True;
  DmVenda.CdSabor.First;
  while not DmVenda.CdSabor.IsEmpty do
    DmVenda.CdSabor.Delete;

  DmVenda.CdItemVenda.Delete;
end;

procedure TFVenda.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFVenda.MeCodProdutoChange(Sender: TObject);
var i: Integer;
begin
  if BlockChange then Exit;
  BlockChange := False;
  if MeCodProduto.Text <> '' then
    EProduto.Text := BuscaString('DESC_PRODUTO', 'TB_PRODUTO', 'COD_PRODUTO', StrToInt(MeCodProduto.Text))
  else
  Begin
    EProduto.Clear;
    DBChart1.Visible := False;
    AlteraTamanho;
    Exit;
  End;

  DmProduto.QQtdSabores.Close;
  DmProduto.QQtdSabores.ParamByName('COD_PRODUTO').AsInteger := StrToInt(Trim(MeCodProduto.Text));
  DmProduto.QQtdSabores.Open;

  CeQtde.Value := 1;
  CePreco.Value := DmProduto.QQtdSaboresVLR_VENDA.Value;
  CeTotal.Value := CeQtde.Value * CePreco.Value;

  if (DmProduto.QQtdSaboresNUM_SABORES.IsNull) or (DmProduto.QQtdSaboresNUM_SABORES.Value <= 0) then
    DBChart1.Visible := False
  else
    DBChart1.Visible := True;
  AlteraTamanho;

  QtdMaxSabores := DmProduto.QQtdSaboresNUM_SABORES.Value;

  DmVenda.CdSabor.Filtered := False;
  DmVenda.CdSabor.Filter := '(COD_VENDA_ITEM = 0) OR (COD_VENDA_ITEM = ' + IntToStr(DmVenda.CdItemVendaCOD_VENDA_ITEM.Value) + ')';
  DmVenda.CdSabor.Filtered := True;
  DmVenda.CdSabor.First;
  while not DmVenda.CdSabor.IsEmpty do
  Begin
    DmVenda.CdSabor.Delete;
  End;

  for i := 1 to QtdMaxSabores do
  Begin
    DmVenda.CdSabor.Append;
    DmVenda.CdSaborCOD_VENDA.Value := 0;
    DmVenda.CdSaborCOD_VENDA_ITEM.Value := 0;
    DmVenda.CdSaborCOD_SABOR.Value := i * (-1);
    DmVenda.CdSaborQT_QUANTIDADE.Value := 1;
    DmVenda.CdSabor.Post;
  End;
end;

procedure TFVenda.SpeedButton1Click(Sender: TObject);
begin
  Application.CreateForm(TFProdutoCad, FProdutoCad);
  FProdutoCad.Consultando := True;
  FProdutoCad.ShowModal;

  if RetornoConsulta > -1 then
    MeCodProduto.Text := IntToStr(RetornoConsulta)
  else
    MeCodProduto.Clear;

  MeCodProduto.SetFocus;
end;

procedure TFVenda.BtnGravarClick(Sender: TObject);
begin
  if DmVenda.CdItemVenda.IsEmpty then
  Begin
    MessageDlg('Informe pelo menos um Produto.', mtWarning, [mbOK], 0);
    DbGDados.SetFocus;
    Exit;
  End;

  if ((Trim(MeCodCliente.Text) = '') or (Trim(ECliente.Text) = '')) then
  Begin
    MessageDlg('Informe o Cliente.', mtWarning, [mbOK], 0);
    MeCodCliente.SetFocus;
    Exit;
  End;

  DmSistema.TSistema.CommitRetaining;
  try
    with DmVenda do
    Begin
      QInsVenda.Close;
      QInsVenda.ParamByName('DT_VENDA').AsDate := Date;
      QInsVenda.ParamByName('COD_CLIENTE').AsInteger := StrToInt(Trim(MeCodCliente.Text));
      QInsVenda.ParamByName('COD_OPERADOR').AsInteger := OperadorLogado;
      QInsVenda.ParamByName('DESC_OBSERVACAO').AsString := EObs.Text;
      QInsVenda.ExecSQL;

      QUltimaVenda.Close;
      QUltimaVenda.Open;

      CdItemVenda.First;
      while not CdItemVenda.Eof do
      Begin
        QInsVendaItem.Close;
        QInsVendaItem.ParamByName('COD_VENDA').AsInteger := QUltimaVendaULTIMO.Value;
        QInsVendaItem.ParamByName('COD_VENDA_ITEM').AsInteger := CdItemVendaCOD_VENDA_ITEM.Value;
        QInsVendaItem.ParamByName('COD_PRODUTO').AsInteger := CdItemVendaCOD_PRODUTO.Value;
        QInsVendaItem.ParamByName('QT_QUANTIDADE').AsFloat := CdItemVendaQT_QUANTIDADE.Value;
        QInsVendaItem.ParamByName('VAL_PRECO').AsFloat := CdItemVendaVAL_PRECO.Value;
        QInsVendaItem.ExecSQL;

        CdSabor.Filtered := False;
        CdSabor.Filter := '(COD_VENDA_ITEM = ' + IntToStr(CdItemVendaCOD_VENDA_ITEM.Value) + ')';
        CdSabor.Filtered := True;
        CdSabor.First;
        while not CdSabor.Eof do
        Begin
          QInsVendaItemSabor.Close;
          QInsVendaItemSabor.ParamByName('COD_VENDA').AsInteger := QUltimaVendaULTIMO.Value;
          QInsVendaItemSabor.ParamByName('COD_VENDA_ITEM').AsInteger := CdSaborCOD_VENDA_ITEM.Value;
          QInsVendaItemSabor.ParamByName('COD_SABOR').AsInteger := CdSaborCOD_SABOR.Value;
          QInsVendaItemSabor.ParamByName('QT_QUANTIDADE').AsInteger := CdSaborQT_QUANTIDADE.Value;
          QInsVendaItemSabor.ExecSQL;

          CdSabor.Next;
        End;

        CdItemVenda.Next;
      End;
    End;
  except
    MessageDlg('Erro durante a Gravação.', mtError, [mbOK], 0);
    DmSistema.TSistema.RollbackRetaining;
    Abort;
  end;

  DmSistema.TSistema.CommitRetaining;

  ImprimeTicket(DmVenda.QUltimaVendaULTIMO.Value);

  BtnLimpar.Click;
end;

procedure TFVenda.DBChart1ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SaborClicado := ValueIndex;
  if Button = mbRight then
    PopupMenu1.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  if Button = mbLeft then
    Edita1.Click;
end;

procedure TFVenda.Adicionar1Click(Sender: TObject);
var coditem: Integer;
begin
  Application.CreateForm(TFSaborCad, FSaborCad);
  FSaborCad.Consultando := True;
  FSaborCad.ShowModal;

  if DmVenda.CdItemVenda.State = dsInsert then
    coditem := 0
  else
    coditem := DmVenda.CdItemVendaCOD_VENDA_ITEM.Value;

  if RetornoConsulta > -1 then
  Begin
    if DmVenda.CdSabor.Locate('COD_VENDA_ITEM;COD_SABOR', VarArrayOf([coditem, RetornoConsulta]), []) then
    Begin
      DmVenda.CdSabor.Edit;
      DmVenda.CdSaborQT_QUANTIDADE.Value := DmVenda.CdSaborQT_QUANTIDADE.Value + 1;
      DmVenda.CdSabor.Post;
    End
    else
    Begin
      DmVenda.CdSabor.Append;
      DmVenda.CdSaborCOD_VENDA.Value := 0;
      DmVenda.CdSaborCOD_VENDA_ITEM.Value := 0;
      DmVenda.CdSaborCOD_SABOR.Value := RetornoConsulta;
      DmVenda.CdSaborQT_QUANTIDADE.Value := 1;
      DmVenda.CdSabor.Post;
    End;
  End;

  DBChart1.RefreshData;
end;

procedure TFVenda.Edita1Click(Sender: TObject);
var coditem: Integer;
begin
  Application.CreateForm(TFSaborCad, FSaborCad);
  FSaborCad.Consultando := True;
  FSaborCad.ShowModal;

  if RetornoConsulta > -1 then
  Begin
    if DmVenda.CdItemVenda.State = dsInsert then
      coditem := 0
    else
      coditem := DmVenda.CdItemVendaCOD_VENDA_ITEM.Value;

    if DmVenda.CdSabor.Locate('COD_VENDA_ITEM;COD_SABOR', VarArrayOf([coditem, RetornoConsulta]), []) then
    Begin
      DmVenda.CdSabor.Edit;
      DmVenda.CdSaborQT_QUANTIDADE.Value := DmVenda.CdSaborQT_QUANTIDADE.Value + 1;
      DmVenda.CdSabor.Post;

      if ProcuraRegistro(DmVenda.CdSabor, SaborClicado) then
      Begin
        DmVenda.CdSabor.Delete;
        DBChart1.Series[0].Delete(SaborClicado);
      End;
    End
    else
      if ProcuraRegistro(DmVenda.CdSabor, SaborClicado) then
      Begin
        DmVenda.CdSabor.Edit;
        DmVenda.CdSaborCOD_SABOR.Value := RetornoConsulta;
        DmVenda.CdSaborQT_QUANTIDADE.Value := 1;
        DmVenda.CdSabor.Post;
      End;
  End;

  DBChart1.RefreshData;
  DBChart1.Refresh;
end;

function TFVenda.ProcuraRegistro(dataset: TDataSet; RecNoRelativo: Integer): Boolean;
var atual: Integer;
Begin
  dataset.First;
  atual := 0;
  while not dataset.Eof do
  Begin
    if atual = RecNorelativo then
    Begin
      Result := True;
      Exit;
    End;

    Inc(atual);
    dataset.Next;
  End;
  Result := False;
End;

procedure TFVenda.Retirar1Click(Sender: TObject);
var coditem: Integer;
begin
    if DmVenda.CdItemVenda.State = dsInsert then
      coditem := 0
    else
      coditem := DmVenda.CdItemVendaCOD_VENDA_ITEM.Value;

  if DmVenda.CdSabor.Locate('COD_VENDA_ITEM;COD_SABOR', VarArrayOf([coditem, LocalizaRecNo(DmVenda.CdSabor, SaborClicado + 1, 'COD_SABOR')]), []) then
    DmVenda.CdSabor.Delete;
  DBChart1.Series[0].Delete(SaborClicado);

  DBChart1.RefreshData;
end;

procedure TFVenda.AlteraTamanho;
Begin
  if DBChart1.Visible then
    GbManutencao.Height := 185 + 160
  else
    GbManutencao.Height := 160;

  GbManutencao.Top := trunc(ClientHeight / 2) - trunc(GbManutencao.Height / 2);
  GbManutencao.Left := trunc(ClientWidth / 2) - trunc(GbManutencao.Width / 2);

  BtnCancelarItem.Top := GbManutencao.Height - BtnCancelarItem.Height - 17;
  BtnGravarItem.Top := GbManutencao.Height - BtnGravarItem.Height - 17;
End;

procedure TFVenda.DbGDadosDblClick(Sender: TObject);
begin
  SbEditar.Click;
end;

procedure TFVenda.DbGDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_INSERT then
    SbInserir.Click;
  if Key = VK_DELETE then
    SbExcluir.Click;
  if Key = VK_RETURN then
  Begin
    SbEditar.Click;
    Abort;
  End;
end;

procedure TFVenda.BtnLimparClick(Sender: TObject);
begin
  DmVenda.CdItemVenda.Close;
  DmVenda.CdItemVenda.Open;
  DmVenda.CdSabor.Close;
  DmVenda.CdSabor.Open;
  MeCodCliente.Clear;
  ECliente.Clear;
  EObs.Clear;

  DbGDados.SetFocus;
  DbGDados.SelectedIndex := 0;
end;

procedure TFVenda.FormResize(Sender: TObject);
begin
  AlteraTamanho;
end;

procedure TFVenda.ImprimeTicket(NumVenda: Integer);
var wNumLinhas, wLinha: Integer;
    wTotal: Real;
    Sabores, wDescCompleta, wObservacao: String;
Begin
  wLinha := 0;
  wNumLinhas := 40;
  wTotal := 0;

  if Imp = Nil Then
    Imp := TImp.Create;
  Imp.AbreImpressora;
  Imp.ConfiguraImpressora('CONDENSADO_ON', 'OITAVOS', 40);

  DmVenda.QTicketCab.Close;
  DmVenda.QTicketCab.ParamByName('COD_VENDA').AsInteger := NumVenda;
  DmVenda.QTicketCab.Open;

  DmVenda.QTicketItem.Close;
  DmVenda.QTicketItem.ParamByName('COD_VENDA').AsInteger := NumVenda;
  DmVenda.QTicketItem.Open;
  DmVenda.QTicketItem.First;

  Imp.WriteXY(0, wLinha, TiraAcentos(Copy(DmParamSistema.QParamSistemaDESC_FANTASIA.Value, 1, 40)));
  Inc(wLinha);
  Imp.WriteXY(0, wLinha, TiraAcentos(Copy(DmParamSistema.QParamSistemaDESC_ENDERECO.Value, 1, 40)));
  Inc(wLinha);
  Imp.WriteXY(0, wLinha, TiraAcentos(Copy(DmParamSistema.QParamSistemaDESC_CIDADE.Value + ' - ' + DmParamSistema.QParamSistemaDESC_UF.Value, 1, 40)));
  Inc(wLinha);
  Imp.WriteXY(0, wLinha, DmParamSistema.QParamSistemaDESC_TELEFONE.Value);
  Imp.WriteXY(4.3, wLinha, FormatDateTime('dd/MM/yyyy', DmVenda.QTicketCabDT_VENDA.Value));
  Inc(wLinha);
  Imp.WriteXY(0, wLinha, '----------------------------------------');
  Inc(wLinha);
  Imp.WriteXY(0, wLinha, TiraAcentos(Copy(DmVenda.QTicketCabDESC_NOME_CLIENTE.Value, 1, 40)));
  if Trim(DmVenda.QTicketCabDESC_ENDERECO.Value) <> '' then
  Begin
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, TiraAcentos(Copy(DmVenda.QTicketCabDESC_ENDERECO.Value, 1, 40)));
  End;
  if Trim(DmVenda.QTicketCabDESC_LOCALIZACAO.Value) <> '' then
  Begin
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, TiraAcentos(Copy(DmVenda.QTicketCabDESC_LOCALIZACAO.Value, 1, 40)));
  End;
  Inc(wLinha);
  Imp.WriteXY(0, wLinha, DmVenda.QTicketCabDESC_TELEFONE.Value);
  Inc(wLinha);
  Imp.WriteXY(0, wLinha, '----------------------------------------');
  Inc(wLinha);
  Imp.WriteXY(0, wLinha, 'Produto                           Total');
  Inc(wLinha);
  Imp.WriteXY(0, wLinha, '----------------------------------------');

  while not DmVenda.QTicketItem.Eof do
  Begin
    DmVenda.QTicketSabor.Close;
    DmVenda.QTicketSabor.ParamByName('COD_VENDA').AsInteger := NumVenda;
    DmVenda.QTicketSabor.ParamByName('COD_VENDA_ITEM').AsInteger := DmVenda.QTicketItemCOD_VENDA_ITEM.Value;
    DmVenda.QTicketSabor.Open;
    DmVenda.QTicketSabor.First;

    wTotal := wTotal + (DmVenda.QTicketItemVAL_PRECO.Value * DmVenda.QTicketItemQT_QUANTIDADE.Value);

    Sabores := '';
    while not DmVenda.QTicketSabor.Eof do
    Begin
      Sabores := Sabores + DmVenda.QTicketSaborDESC_SABOR.Value + ', ';
      DmVenda.QTicketSabor.Next;
    End;
    if Sabores <> '' then
      Sabores := ' (' + copy(Sabores, 1, length(Sabores) - 2) + ')';

    wDescCompleta := TiraAcentos(DmVenda.QTicketItemDESC_PRODUTO.Value + Sabores);

    Inc(wLinha);
//    Imp.WriteXY(0, wLinha, FormatFloat('#0.#', DmVenda.QTicketItemQT_QUANTIDADE.Value));
    Imp.WriteXY(0, wLinha, Bib.NumToTexto(DmVenda.QTicketItemQT_QUANTIDADE.Value, 0, 2));
    Imp.WriteXY(0.4, wLinha, Copy(wDescCompleta, 1, 30));
//    Imp.WriteXY(5, wLinha, FormatFloat('#0.00', DmVenda.QTicketItemVAL_PRECO.Value * DmVenda.QTicketItemQT_QUANTIDADE.Value));
    Imp.WriteXY(4.8, wLinha, Bib.NumToTexto(DmVenda.QTicketItemVAL_PRECO.Value * DmVenda.QTicketItemQT_QUANTIDADE.Value, 2, 6));
    if Copy(wDescCompleta, 31, 30) <> '' then
    Begin
      Inc(wLinha);
      Imp.WriteXY(0.4, wLinha, Copy(wDescCompleta, 31, 30));
    End;
    if Copy(wDescCompleta, 61, 30) <> '' then
    Begin
      Inc(wLinha);
      Imp.WriteXY(0.4, wLinha, Copy(wDescCompleta, 61, 30));
    End;

    if wLinha >= wNumLinhas then
    Begin
//      Imp.SaltaPagina;
//      wLinha := 0;
    End;

    DmVenda.QTicketItem.Next;
  End;

  wObservacao := TiraAcentos(DmVenda.QTicketCabDESC_OBSERVACAO.Value);

  Inc(wLinha);
  Imp.WriteXY(0, wLinha, '----------------------------------------');
  Inc(wLinha);
  Imp.WriteXY(3, wLinha, 'Total: ');
  Imp.WriteXY(4.8, wLinha, Bib.NumToTexto(wTotal, 2, 6));
  Inc(wLinha);
  Imp.WriteXY(0, wLinha, '----------------------------------------');
  Inc(wLinha);
  Imp.WriteXY(0, wLinha, Copy(wObservacao, 1, 40));
  if Copy(wObservacao, 41, 40) <> '' then
  Begin
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, Copy(wObservacao, 41, 40));
  End;
  if Copy(wObservacao, 81, 40) <> '' then
  Begin
    Inc(wLinha);
    Imp.WriteXY(0, wLinha, Copy(wObservacao, 81, 40));
  End;

  Imp.SaltaPagina;

  Imp.FechaImpressora;
End;

Function TFVenda.TiraAcentos(wString: String):String;
Var i: Integer;
    wStringNova, wCharNovo: String;
Begin
  wStringNova := '';
  For i := 1 to Length(wString) do
  Begin
    wCharNovo := wString[i];

    if wString[i] in ['à', 'á', 'ã', 'â'] then
      wCharNovo := 'a';
    if wString[i] in ['é', 'è', 'ê'] then
      wCharNovo := 'e';
    if wString[i] in ['í', 'ì'] then
      wCharNovo := 'i';
    if wString[i] in ['ó', 'õ', 'ô', 'ò', 'ö'] then
      wCharNovo := 'o';
    if wString[i] in ['ú', 'ù', 'ü'] then
      wCharNovo := 'u';
    if wString[i] in ['ç'] then
      wCharNovo := 'c';

    if wString[i] in ['À', 'Á', 'Ã', 'Â'] then
      wCharNovo := 'A';
    if wString[i] in ['É', 'È', 'Ê'] then
      wCharNovo := 'E';
    if wString[i] in ['Í', 'Ì'] then
      wCharNovo := 'I';
    if wString[i] in ['Ó', 'Õ', 'Ô', 'Ò', 'Ö'] then
      wCharNovo := 'O';
    if wString[i] in ['Ú', 'Ù', 'Ü'] then
      wCharNovo := 'U';
    if wString[i] in ['Ç'] then
      wCharNovo := 'C';

    wStringNova := wStringNova + wCharNovo;
  End;

  Result := wStringNova;
End;

end.
